﻿<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="EditPaymentMethod.aspx.cs"
  Inherits="TeaCommerce.Umbraco.Application.Views.PaymentMethods.EditPaymentMethod"
  MasterPageFile="../Shared/UmbracoTabView.Master" %>

<%@ Register Assembly="controls" Namespace="umbraco.uicontrols" TagPrefix="umbUIControls" %>
<%@ Register Assembly="umbraco" Namespace="umbraco.controls" TagPrefix="umbControls" %>
<%@ Register Namespace="ClientDependency.Core.Controls" Assembly="ClientDependency.Core"
  TagPrefix="CD" %>
<asp:Content ContentPlaceHolderID="CphBody" runat="server">
  <asp:Panel ID="PnlCommon" runat="server">
    <umbUIControls:Pane runat="server">
      <umbUIControls:PropertyPanel ID="PPnlName" runat="server">
        <asp:TextBox ID="TxtName" runat="server" CssClass="guiInputText guiInputStandardSize" />
      </umbUIControls:PropertyPanel>
      <umbUIControls:PropertyPanel ID="PPnlDictionaryItemName" runat="server">
        <asp:TextBox ID="TxtDictionaryItemName" runat="server" CssClass="guiInputText guiInputStandardSize" />
      </umbUIControls:PropertyPanel>
      <umbUIControls:PropertyPanel ID="PPnlSku" runat="server">
        <asp:TextBox ID="TxtSku" runat="server" CssClass="guiInputText guiInputStandardSize" />
      </umbUIControls:PropertyPanel>
      <umbUIControls:PropertyPanel ID="PPnlVatGroup" runat="server">
        <asp:DropDownList ID="DrpVatGroups" runat="server" DataTextField="Name" DataValueField="Id"
          CssClass="guiInputText guiInputStandardSize" AppendDataBoundItems="true">
          <asp:ListItem Text="----" Value="" />
        </asp:DropDownList>
      </umbUIControls:PropertyPanel>
      <umbUIControls:PropertyPanel ID="PPnlImage" runat="server">
        <umbControls:ContentPicker ID="CPImage" runat="server" AppAlias="media" TreeAlias="media" />
      </umbUIControls:PropertyPanel>
    </umbUIControls:Pane>
    <umbUIControls:Pane ID="PnDefaultCurrencies" runat="server">
      <asp:ListView ID="LvDefaultCurrencies" runat="server" OnItemDataBound="LvDefaultCurrencies_ItemDataBound">
        <layouttemplate>
          <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
        </layouttemplate>
        <itemtemplate>
          <asp:HiddenField ID="HdfId" runat="server" Value='<%# Eval("Id") %>' />
          <asp:HiddenField ID="HdfPriceId" runat="server" />
          <div class="propertyItem">
            <div class="propertyItemheader">
              <asp:Literal ID="LitHeader" runat="server" Text='<%# Eval("Name") %>' /></div>
            <div class="propertyItemContent">
              <asp:TextBox ID="TxtPrice" runat="server" CssClass="guiInputText guiInputStandardSize" />
            </div>
          </div>
        </itemtemplate>
      </asp:ListView>
    </umbUIControls:Pane>
  </asp:Panel>
  <umbUIControls:Pane ID="PnCurrencies" runat="server">
    <asp:CheckBox runat="server" ID="ChkSelectAll" CssClass="selectAll" />
    <div class="countries checkboxesForSelectAll">
      <asp:ListView ID="LvCountries" runat="server" OnItemDataBound="LvCountries_ItemDataBound">
        <LayoutTemplate>
          <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
        </LayoutTemplate>
        <ItemTemplate>
          <div style="margin: 1px 1px 1px 1px;">
            <asp:HiddenField ID="HdfId" runat="server" Value='<%# Eval("Id") %>' />
            <asp:CheckBox ID="ChkIsSupported" runat="server" /><%# Eval( "Name" ) %><span
              class="customPrices">(<asp:HyperLink ID="HypCustomPrices" runat="server" NavigateUrl="#" />)</span>
          </div>
          <div class="propertypane pnlCurrencies">
            <asp:ListView ID="LvCurrencies" runat="server" OnLayoutCreated="LvCurrencies_LayoutCreated"
              OnItemDataBound="LvCurrencies_ItemDataBound">
              <LayoutTemplate>
                <table cellpadding="0" cellspacing="0" border="0" style="width: 445px;">
                  <tr>
                    <th>
                      <asp:Literal ID="LitCurrency" runat="server" />
                    </th>
                    <th>
                      <asp:Literal ID="LitShippingFee" runat="server" />
                    </th>
                  </tr>
                  <tbody>
                    <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                  </tbody>
                </table>
              </LayoutTemplate>
              <ItemTemplate>
                <tr>
                  <td>
                    <asp:HiddenField ID="HdfId" runat="server" Value='<%# Eval("Id") %>' />
                    <asp:HiddenField ID="HdfPriceId" runat="server" />
                    <asp:Label ID="LblCurrencyName" runat="server" />
                  </td>
                  <td>
                    <asp:TextBox ID="TxtPrice" CssClass="guiInputText" runat="server" />
                  </td>
                </tr>
              </ItemTemplate>
            </asp:ListView>
          </div>
          <asp:ListView ID="LvCountryRegions" runat="server" OnItemDataBound="LvCountryRegions_ItemDataBound">
            <LayoutTemplate>
              <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
            </LayoutTemplate>
            <ItemTemplate>
              <div style="margin: 1px 1px 1px 20px;">
                <asp:HiddenField ID="HdfId" runat="server" Value='<%# Eval("Id") %>' />
                <asp:CheckBox ID="ChkIsSupported" runat="server" /><%# Eval( "Name" ) %><span
                  class="customPrices">(<asp:HyperLink ID="HypCustomPrices" runat="server" NavigateUrl="#" />)</span>
              </div>
              <div class="propertypane pnlCurrencies" style="margin-left: 20px;">
                <asp:ListView ID="LvCurrencies" runat="server" OnLayoutCreated="LvCurrencies_LayoutCreated"
                  OnItemDataBound="LvCurrencies_ItemDataBound">
                  <LayoutTemplate>
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 445px;">
                      <tr>
                        <th>
                          <asp:Literal ID="LitCurrency" runat="server" />
                        </th>
                        <th>
                          <asp:Literal ID="LitShippingFee" runat="server" />
                        </th>
                      </tr>
                      <tbody>
                        <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
                      </tbody>
                    </table>
                  </LayoutTemplate>
                  <ItemTemplate>
                    <tr>
                      <td>
                        <asp:HiddenField ID="HdfId" runat="server" Value='<%# Eval("Id") %>' />
                        <asp:HiddenField ID="HdfPriceId" runat="server" />
                        <asp:Label ID="LblCurrencyName" runat="server" />
                      </td>
                      <td>
                        <asp:TextBox ID="TxtPrice" CssClass="guiInputText" runat="server" />
                      </td>
                    </tr>
                  </ItemTemplate>
                </asp:ListView>
              </div>
            </ItemTemplate>
          </asp:ListView>
        </ItemTemplate>
      </asp:ListView>
    </div>
  </umbUIControls:Pane>
  <asp:Panel ID="PnlPaymentProvider" runat="server">
    <umbUIControls:Pane runat="server">
      <div class="propertyItem">
        <div class="propertyItemheader">
          <asp:Literal ID="LitPaymentProvider" runat="server" />
        </div>
        <div class="propertyItemContent" style="width: 450px;">
          <asp:DropDownList ID="DrpPaymentProviders" runat="server" OnSelectedIndexChanged="DrpPaymentProviders_SelectedIndexChanged"
            AutoPostBack="true" AppendDataBoundItems="true" CssClass="guiInputText guiInputStandardSize" />
          <asp:Button ID="BtnOverwriteSettings" runat="server" OnClick="BtnOverwriteSettings_Click" />
        </div>
      </div>
      <umbUIControls:PropertyPanel ID="PPnlDocumentation" Text=" " runat="server">
        <asp:HyperLink ID="HypDocumentation" runat="server" Target="_blank" />
      </umbUIControls:PropertyPanel>
    </umbUIControls:Pane>
    <asp:PlaceHolder ID="PlcCommonSettings" runat="server" />
    <umbUIControls:Pane ID="PnPaymentProviderAPICalls" runat="server">
      <umbUIControls:PropertyPanel runat="server">
        <asp:CheckBox ID="ChkAllowsGetStatus" runat="server" />
      </umbUIControls:PropertyPanel>
      <umbUIControls:PropertyPanel runat="server">
        <asp:CheckBox ID="ChkAllowsCapturePayment" runat="server" />
      </umbUIControls:PropertyPanel>
      <umbUIControls:PropertyPanel runat="server">
        <asp:CheckBox ID="ChkAllowsRefundPayment" runat="server" />
      </umbUIControls:PropertyPanel>
      <umbUIControls:PropertyPanel runat="server">
        <asp:CheckBox ID="ChkAllowsCancelPayment" runat="server" />
      </umbUIControls:PropertyPanel>
    </umbUIControls:Pane>
  </asp:Panel>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="CphHead" runat="server">
  <style type="text/css">
    .hide { display: none; }
    .pnlCurrencies { margin-top: 2px; margin-bottom: 5px; }
    .customPrices { font-size: 10px; padding-left: 5px; }
    .propertyItemContent { width: 300px; }
    .propertyItemContent input.button { float: right; margin-left: 5px; }
    .propertyItemContent span { float: left; height: 10px; padding: 3px; }
    .notice { margin-top: 7px; padding: 5px; }
    .selectAll { font-size: 11px; display: inline-block; padding-left: 3px; margin-bottom: 5px; }
  </style>
  <script type="text/javascript" src='<%= TeaCommerce.Umbraco.Application.Utils.WebUtils.GetWebResourceUrl(TeaCommerce.Umbraco.Application.Constants.Scripts.Default) %>'></script>
</asp:Content>
