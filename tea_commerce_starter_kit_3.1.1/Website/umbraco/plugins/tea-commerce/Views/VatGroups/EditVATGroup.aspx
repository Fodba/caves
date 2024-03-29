﻿<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="EditVatGroup.aspx.cs" Inherits="TeaCommerce.Umbraco.Application.Views.VATGroups.EditVatGroup"
  MasterPageFile="../Shared/UmbracoTabView.Master" %>

<%@ Register Assembly="controls" Namespace="umbraco.uicontrols" TagPrefix="umbUIControls" %>
<asp:Content ContentPlaceHolderID="CphBody" runat="server">
  <umbUIControls:Pane ID="PnCommon" runat="server">
    <umbUIControls:PropertyPanel ID="PPnlName" runat="server">
      <asp:TextBox ID="TxtName" runat="server" CssClass="guiInputText guiInputStandardSize" />
    </umbUIControls:PropertyPanel>
    <umbUIControls:PropertyPanel ID="PPnlVAT" runat="server">
      <asp:TextBox ID="TxtVAT" runat="server" />&nbsp;%
    </umbUIControls:PropertyPanel>
  </umbUIControls:Pane>
  <umbUIControls:Pane ID="PnContries" runat="server">
    <asp:ListView ID="LvCountrySpecificVatRates" runat="server" DataKeyNames="Id" OnItemDataBound="LvCountrySpecificVatRates_ItemDataBound">
      <LayoutTemplate>
        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
      </LayoutTemplate>
      <ItemTemplate>
        <asp:HiddenField ID="HdfKey" runat="server" Value='<%# Eval("Id") %>' />
        <div class="propertyItem">
          <div class="propertyItemheader">
            <asp:Label runat="server" Text='<%# Eval("Name") %>' />
          </div>
          <div class="propertyItemContent">
            <asp:TextBox ID="TxtValue" runat="server" Text='<%# Eval("VatRate") %>' CssClass="guiInputText guiInputTextTiny" />&nbsp;%
          </div>
        </div>
        <asp:ListView ID="LvCountryRegionSpecificVatRates" runat="server">
          <LayoutTemplate>
            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
          </LayoutTemplate>
          <ItemTemplate>
            <asp:HiddenField ID="HdfKey" runat="server" Value='<%# Eval("Id") %>' />
            <div class="propertyItem">
              <div class="propertyItemheader">
                <asp:Label runat="server" Text='<%# Eval("Name") %>' />
              </div>
              <div class="propertyItemContent">
                <asp:TextBox ID="TxtValue" runat="server" Text='<%# Eval("VatRate") %>' CssClass="guiInputText guiInputTextTiny" />&nbsp;%
              </div>
            </div>
          </ItemTemplate>
        </asp:ListView>
      </ItemTemplate>
    </asp:ListView>
  </umbUIControls:Pane>
</asp:Content>
