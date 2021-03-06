﻿#region Using directives
using treeDiM.Basics;
using Sharp3D.Math.Core;
#endregion

namespace treeDiM.StackBuilder.Basics
{
    public class HAnalysisPallet : AnalysisHetero
    {
        #region Constructor
        public HAnalysisPallet(Document doc) : base(doc)
        {
            ConstraintSet = new HConstraintSetPallet()
            {
                MaximumHeight = UnitsManager.ConvertLengthFrom(1700.0, UnitsManager.UnitSystem.UNIT_METRIC1)
            };
        }
        #endregion

        #region Specific properties
        public PalletProperties Pallet
        {
            set { _containers.Clear(); _containers.Add(value); }
            get
            {
                if (_containers.Count < 1) return null;
                return _containers[0] as PalletProperties;
            }
        }
        #endregion

        #region Override HAnalysis
        public override Vector3D DimContainer(int index)
        {
            HConstraintSetPallet constraintSet = ConstraintSet as HConstraintSetPallet;

            return index < _containers.Count && _containers[index] is PalletProperties palletProperties
                ? new Vector3D(
                    palletProperties.Length + 2.0 * constraintSet.Overhang.X,
                    palletProperties.Width + 2.0 * constraintSet.Overhang.Y,
                    constraintSet.MaximumHeight - palletProperties.Height)
                : Vector3D.Zero;
        }
        public override double WeightContainer(int index)
        {
            return index < _containers.Count && _containers[index] is PalletProperties palletProperties
                ? palletProperties.Weight : 0.0;
        }
        public override Vector3D Offset(int index)
        {
            HConstraintSetPallet constraintSet = ConstraintSet as HConstraintSetPallet;
            if (index < _containers.Count && _containers[index] is PalletProperties palletProperties)
                return new Vector3D(-constraintSet.Overhang.X, -constraintSet.Overhang.Y, palletProperties.Height);
            else
                return Vector3D.Zero;
        }
        public override BBox3D AdditionalBoudingBox(int index)
        {
            if (index < _containers.Count && _containers[index] is PalletProperties palletProperties)
                return palletProperties.BoundingBox;
            else
                return BBox3D.Initial;
        }
        #endregion
    }
}
