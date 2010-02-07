﻿#region Using directives
using System;
using System.Collections.Generic;
using System.Text;
using System.Drawing;
using System.IO;

using TreeDim.StackBuilder.Basics;
using TreeDim.StackBuilder.Engine;
using TreeDim.StackBuilder.Graphics;

using Sharp3D.Math.Core;
#endregion

namespace TreeDim.StackBuilder.Engine.Test
{
    class Program
    {
        static int Main(string[] args)
        {
            try
            {
                bool useSingleColor = false;
                // define box properties
                BoxProperties boxProperties = new BoxProperties(400, 300, 200);
                boxProperties.Weight = 1.0;
                if (!useSingleColor)
                {
                    boxProperties.SetColor(HalfAxis.AXIS_X_N, Color.Red);
                    boxProperties.SetColor(HalfAxis.AXIS_X_P, Color.Red);
                    boxProperties.SetColor(HalfAxis.AXIS_Y_N, Color.Green);
                    boxProperties.SetColor(HalfAxis.AXIS_Y_P, Color.Green);
                    boxProperties.SetColor(HalfAxis.AXIS_Z_N, Color.Blue);
                    boxProperties.SetColor(HalfAxis.AXIS_Z_P, Color.Blue);
                }
                else
                    boxProperties.SetAllColors(Color.Chocolate);

                Console.WriteLine(boxProperties.ToString());

                // define pallet properties
                PalletProperties palletProperties = new PalletProperties(PalletProperties.PalletType.BLOCK, 1200, 1000, 150);
                Console.WriteLine("=== Pallet properties ===");
                Console.WriteLine(palletProperties.ToString());

                // define constraints
                ConstraintSet constraintSet = new ConstraintSet();
                constraintSet.SetAllowedOrthoAxis(HalfAxis.AXIS_X_N, false);
                constraintSet.SetAllowedOrthoAxis(HalfAxis.AXIS_X_P, false);
                constraintSet.SetAllowedOrthoAxis(HalfAxis.AXIS_Y_N, false);
                constraintSet.SetAllowedOrthoAxis(HalfAxis.AXIS_Y_P, false);
                constraintSet.SetAllowedOrthoAxis(HalfAxis.AXIS_Z_N, false);
                constraintSet.SetAllowedOrthoAxis(HalfAxis.AXIS_Z_P, true);

                //constraintSet.SetAllowedPattern("Column");
                //constraintSet.SetAllowedPattern("Interlocked");
                constraintSet.SetAllowedPattern("Spirale");
                constraintSet.ForceAlternateLayer = false;
                constraintSet.AllowAlternateLayer = true;
                
                constraintSet.MaximumPalletWeight = 2000;
                constraintSet.MaximumNumberOfItems = 2000;
                constraintSet.MaximumHeight = 2000.0;
                constraintSet.UseMaximumHeight = true;
                constraintSet.UseMaximumPalletWeight = true;
                constraintSet.UseMaximumWeightOnBox = false;
                Console.WriteLine("=== Constraint set ===");
                Console.WriteLine(constraintSet.ToString());

                // initialize analysis
                Analysis analysis = new Analysis(boxProperties, palletProperties, constraintSet);

                // initialize solver
                Solver solver = new Solver();
                solver.ProcessAnalysis(analysis);

                Console.WriteLine("=== Solutions ===");
                int solIndex = 0;
                foreach (Solution sol in analysis.Solutions)
                {
                    // instantiate graphics
                    Graphics3DImage graphics = new Graphics3DImage(new Size(1000, 1000));
                    graphics.CameraPosition = new Vector3D(10000.0, 10000.0, 10000.0);
                    graphics.Target = new Vector3D(0.0, 0.0, 0.0);
                    graphics.LightDirection = new Vector3D(-0.75, -0.5, 1.0);
                    graphics.SetViewport(-500.0f, -500.0f, 500.0f, 500.0f);
                    // instantiate solution viewer
                    SolutionViewer sv = new SolutionViewer(analysis, sol);
                    sv.Draw(graphics);
                    // save
                    string fileName = string.Format("Pallet_{0}.bmp", solIndex++);
                    string filePath = Path.Combine(Path.GetTempPath(), fileName);
                    Console.WriteLine("Saving file " + filePath + "...");
                    graphics.SaveAs(filePath);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
            return 0;
        }
    }
}