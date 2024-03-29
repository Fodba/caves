﻿<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="Installer.ascx.cs" Inherits="TeaCommerce.Umbraco.Install.Views.Installer" %>
<%@ Register Assembly="controls" Namespace="umbraco.uicontrols" TagPrefix="umbUIControls" %>
<style type="text/css">
  .teaCommerce { padding: 10px 10px 0; }
  .teaCommerce div.codepress { border: 1px solid #ccc !important; height: 72px; }
  .teaCommerce div.codepress > div { height: 100%; }
  .teaCommerce .teaLogo { display: block; margin: 0 0 25px 15px; }
  .teaCommerce h2.propertypaneTitel { margin-bottom: 10px; color: #000; }
  .teaCommerce ul.links li { padding-bottom: 4px; }
</style>
<script>
  jQuery('.btnGoToTeaCommerceSection').live('click', function () {
    if (window.top.location.href.indexOf('umbraco.aspx') > -1) {
      window.top.location.href = '/umbraco/#teacommerce';
    } else {
      window.top.location.href = '/umbraco/umbraco.aspx#teacommerce';
    }
    return false;
  });
</script>
<div class="teaCommerce">
  <div class="success" id="body_packagerConfigControl_ctl00">
    <p>
      <asp:Literal ID="LitComplete" runat="server" />
    </p>
  </div>
  <%= @"</div></div></div><div class='propertypane' style=''><div><div class='teaCommerce' style='padding: 0 10px 0;'>" %>
  <h2 class="propertypaneTitel">
    <asp:Literal ID="LitStep1" runat="server" /></h2>
  <div class="notice">
    <asp:Literal ID="LitStep2" runat="server" />
  </div>
  <umbUIControls:CodeArea ID="CodeArea1" runat="server" CodeBase="HTML" AutoResize="false" />
  <br />
  <br />
  <asp:Button ID="BtnGoToTeaCommerceSection" runat="server" CssClass="btnGoToTeaCommerceSection" />
  <%= @"</div></div></div><div class='propertypane' style=''><div><div class='teaCommerce' style='padding: 0 10px 0;'>" %>
  <h2 class="propertypaneTitel">
    <asp:Literal ID="LitUsefulLinks" runat="server" /></h2>
  <p>
    <ul class="links">
      <li><a href="http://www.teacommerce.net/en/support/how-to-buy-a-license.aspx" target="_blank">
        <asp:Literal ID="LitBuyALicense" runat="server" /></a></li>
      <li><a href="http://www.teacommerce.net/en/documentation.aspx" target="_blank">
        <asp:Literal ID="LitDocumentation" runat="server" /></a></li>
      <li><a href="http://our.umbraco.org/projects/website-utilities/tea-commerce/tea-commerce-support"
        target="_blank">
        <asp:Literal ID="LitSupportForum" runat="server" /></a></li>
      <li><a href="http://www.teacommerce.net/en/products/tea-commerce-starter-kit.aspx"
        target="_blank">
        <asp:Literal ID="LitStarterKit" runat="server" /></a></li>
      <li><a href="http://www.teacommerce.net/en/documentation/revision-history.aspx" target="_blank">
        <asp:Literal ID="LitRevisionHistory" runat="server" /></a></li>
    </ul>
  </p>
</div>
