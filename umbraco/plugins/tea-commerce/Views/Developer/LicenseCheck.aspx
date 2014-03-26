<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="LicenseCheck.aspx.cs" Inherits="TeaCommerce.Umbraco.Application.Views.Developer.LicenseCheck"
  MasterPageFile="../Shared/UmbracoTabView.Master" ValidateRequest="false" %>

<%@ Register Assembly="controls" Namespace="umbraco.uicontrols" TagPrefix="umbUIControls" %>
<asp:Content ContentPlaceHolderID="CphBody" runat="server">
  <style type="text/css">
    .licenseIcon { float: left; display: block; margin-right: 8px; position: relative; top: 2px; }
    h3 { margin-left: 25px; }
    hr { border: 0; border-bottom: 1px solid #CAC9C9; }
  </style>
  <asp:Panel ID="PnlLicense" runat="server">
    <asp:Panel ID="PnlLicensedDomains" runat="server">
      <h3>
        <asp:Literal ID="LitHeading" runat="server" /></h3>
      <asp:ListView ID="LvLicensesTeaCommerce" runat="server">
        <LayoutTemplate>
          <ul>
            <asp:PlaceHolder ID="itemPlaceHolder" runat="server" />
          </ul>
        </LayoutTemplate>
        <ItemTemplate>
          <li>
            <%# Container.DataItem %>
          </li>
        </ItemTemplate>
      </asp:ListView>
      <hr />
      <h2>
        <asp:Literal ID="LitWantToBuyALicense" runat="server" /></h2>
      <p>
        <a href="http://www.teacommerce.net/en/support/how-to-buy-a-license.aspx" target="_blank">
          <asp:Literal ID="LitLink" runat="server" /></a>
      </p>
    </asp:Panel>
  </asp:Panel>
</asp:Content>
