﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LayerDesignIntro.aspx.cs" Inherits="treeDiM.StackBuilder.TechnologyBSA_ASPNET.LayerDesignIntro" EnableSessionState="True"%>
<%@ Import Namespace="treeDiM.StackBuilder.TechnologyBSA_ASPNET" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Layer design introduction</title>
    <style type="text/css">

        .border {
            border: solid 8px;
            color: lightblue;
        }
        .auto-style7 {
            width: 283px;
        }
        .switch {
            position: relative;
            display: inline-block;
            width: 50px;
            height: 24px;
        }
        .switch input {
            opacity: 0;
        }
        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }
        .slider:before {
            position: absolute;
            content: "";
            height: 16px;
            width: 16px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }
        input:checked + .slider {
            background-color: #2196F3;
        }
        input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
        }
        input:checked + .slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }
        .slider.round {
            border-radius: 34px;
        }
        .slider.round:before {
            border-radius: 50%;
        }

        .auto-style8 {
            font-family: Arial, Verdana;
            font-size: 16px;
        }

    </style>
    <link type="text/css" href="css/default.css" rel="stylesheet" />
    <link href="css/jquery-ui.css" rel="stylesheet" />
    <link href="css/keyboard.css" rel="stylesheet" />
    <script type="text/javascript" src="javascript/jquery.min.js"></script>
    <script type="text/javascript" src="javascript/jquery-ui.min.js"></script>
    <script type="text/javascript" src="javascript/jquery.keyboard.js"></script>
    <script type="text/javascript" src="javascript/jquery.keyboard.extension-typing.js"></script>
    <script type="text/javascript">
        function ActivateVirtualKeyboard() {
            $('#TBCaseLength').keyboard({ layout: 'num', restrictInput: true, preventPaste: true, autoAccept: true, accepted: function () { $('#BTRefresh').click(); } }).addTyping();
            $('#TBCaseWidth').keyboard({ layout: 'num', restrictInput: true, preventPaste: true, autoAccept: true, accepted: function () { $('#BTRefresh').click(); } }).addTyping();
            $('#TBCaseHeight').keyboard({ layout: 'num', restrictInput: true, preventPaste: true, autoAccept: true, accepted: function () { $('#BTRefresh').click(); } }).addTyping();
            $('#TBPalletLength').keyboard({ layout: 'num', restrictInput: true, preventPaste: true, autoAccept: true, accepted: function () { $('#BTRefresh').click(); } }).addTyping();
            $('#TBPalletWidth').keyboard({ layout: 'num', restrictInput: true, preventPaste: true, autoAccept: true, accepted: function () { $('#BTRefresh').click(); } }).addTyping();
            $('#TBPalletHeight').keyboard({ layout: 'num', restrictInput: true, preventPaste: true, autoAccept: true, accepted: function () { $('#BTRefresh').click(); } }).addTyping();
            $('#TBPalletWeight').keyboard({ layout: 'num', restrictInput: true, preventPaste: true, autoAccept: true, accepted: function () { $('#BTRefresh').click(); } }).addTyping();
            $('#TBMaxPalletWeight').keyboard({ layout: 'num', restrictInput: true, preventPaste: true, autoAccept: true, accepted: function () { $('#BTRefresh').click(); } }).addTyping();
            /* Code to get jQuery UI to work with jQuery 3.4+ ... */
            $.isArray = function (a) {
                return Object.prototype.toString.call(a) === '[object Array]';
            }
            $.isFunction = function (f) {
                return typeof f === 'function';
            }
            $.isWindow = function (w) {
                var toString = Object.prototype.toString.call(w);
                return toString == '[object global]' ||
                    toString == '[object Window]' ||
                    toString == '[object DOMWindow]';
            }
        }
        function ScrollTo() {
            if ($('.border').length > 0) {
                $('div.liste').animate({ scrollLeft: $('.border').position().left - 20 }, 200);
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="div980x780">
            <asp:ScriptManager ID="pageUpdates" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
            <asp:UpdatePanel ID="controlsInput" runat="server">
                <ContentTemplate>
                    <div>
                        <table class="style100pct">
                            <tr>
                                <td>
                                    <asp:Label ID="LBCaseDim" runat="server" Text="Case dimensions" CssClass="label" />
                                </td>
                                <td class="style65px">
                                    <asp:TextBox ID="TBCaseLength" runat="server" Width="60px" CssClass="textbox" OnTextChanged="OnRefresh"/>
                                </td>
                                <td class="style65px">
                                    <asp:TextBox ID="TBCaseWidth" runat="server" Width="60px" CssClass="textbox" OnTextChanged="OnRefresh"/>
                                </td>
                                <td class="style65px">
                                    <asp:TextBox ID="TBCaseHeight" runat="server" Width="60px" CssClass="textbox" OnTextChanged="OnRefresh"/>
                                </td>
                                <td class="style65px">
                                    <asp:Label ID="LBCaseHeightUnit" runat="server" Text="mm" CssClass="label"/>
                                </td>
                                <td />
                                <td>
                                    <asp:label ID="LBPalletDim" runat="server" Text="Pallet dimensions" CssClass="label" />
                                </td>
                                <td class="style195px">
                                    <asp:DropDownList ID="DropDownPalletDimensions" CssClass="select" runat="server" Width="180px" Height="60px">
                                        <asp:ListItem Value="0">1200x800</asp:ListItem>
                                        <asp:ListItem Value="1">1200x1000</asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:Label ID="LBPalletDimUnit" runat="server" Text="mm" CssClass="label" />
                                <td />
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="LBCaseWeight" runat="server" Text="Case weight" CssClass="label"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="TBCaseWeight" runat="server" Width="60px" CssClass="textbox"/>
                                </td>
                                <td />
                                <td>
                                    <asp:Label ID="LBCaseWeightUnit" runat="server" Text="kg" CssClass="label" />
                                </td>
                                <td />
                                <td />
                                <td>
                                    <asp:Label ID="LBPalletWeight" runat="server" Text="Pallet weight" CssClass="label"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="TBPalletWeight" runat="server" Width="60px" CssClass="textbox"/>
                                </td>
                                <td>
                                    <asp:Label Id="LBPalletWeightUnit" runat="server" Text="kg" CssClass="label" />
                                </td>
                                <td>
                                    <asp:Button ID="BTRefresh" runat="server" Text="Refresh" OnClick="OnRefresh" CssClass="buttonRefresh" />
                                </td>
                            </tr>
                            <tr>
                                <td />
                                <td />
                                <td />
                                <td />
                                <td />
                                <td />
                                <td>
                                    <asp:Label ID="LBNumberOfLayers" runat="server" Text="Number of layers" CssClass="label"/>
                                </td>
                                <td>
                                    <asp:TextBox ID="TBNumberOfLayers" TextMode="Number" min="1" max="100" runat="server" Width="60px" CssClass="textbox"/>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="CaseSetsConfiguration" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <table class="style100pct">
                        <tr>
                            <td>
                                &nbsp;</td>
                               <td> 
                                   &nbsp;</td>
                            <td/>
                            <td/>                            
                        </tr>
                        <tr>
                            <td>
                               <asp:Image ID="ImageCase1" runat="server" Height="150px" Width="150px" alt="Dynamic Image" ImageUrl="~/HandlerCaseSet.ashx?number=1"/>
                            </td>
                            <td>
                               <asp:Image ID="ImageCase2" runat="server" Height="150px" Width="150px" alt="Dynamic Image" ImageUrl="~/HandlerCaseSet.ashx?number=2"/>
                             </td>
                            <td>
                               <asp:Image ID="ImageCase3" runat="server" Height="150px" Width="150px" alt="Dynamic Image" ImageUrl="~/HandlerCaseSet.ashx?number=3"/>
                            </td>
                            <td>
                               <asp:Image ID="ImageCase4" runat="server" Height="150px" Width="150px" Alt="Dynamic Image" ImageUrl="~/HandlerCaseSet.ashx?number=4"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style7"/>
                            <td/>
                            <td/>
                            <td class="styleTextAlignRight">
                                <asp:Button ID="bnNext" CssClass="buttonNext" runat="server" OnClick="OnNext" Text="Next &gt;" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </form>
</body>
</html>
