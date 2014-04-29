<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CustomerLogin.ascx.cs" Inherits="usercontrols_CustomerLogin" %>
<div class="row">
    <div class="offset3 span6 inscription">
        <form id="form" runat="server">
            <span class="title">Se connecter</span>
            <asp:LoginView ID="UmbracoLoginView" runat="server">
                <AnonymousTemplate>
                    <asp:Login CssClass="formlogin" ID="Login1" runat="server">
                        <LayoutTemplate>
                            <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                <tr>
                                    <td>
                                        <table cellpadding="0">
                                            <tr>
                                                <td>
                                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nom d&#39;utilisateur&nbsp;</asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Un nom d'utilisateur est requis." ToolTip="Un nom d'utilisateur est requis." ValidationGroup="ctl00$ctl03$Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Mot de passe&nbsp;</asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Un mot de passe est requis." ToolTip="Un mot de passe est requis." ValidationGroup="ctl00$ctl03$Login1">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:CheckBox ID="RememberMe" runat="server" />&nbsp;Mémoriser le mot de passe.
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" style="color: Red;">
                                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" colspan="2">
                                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Se connecter" ValidationGroup="ctl00$ctl03$Login1" CssClass="button_create" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <a href="{localLink:1334}" style="color:#9b1230;text-decoration:underline;">Pas encore membre? Créez votre compte ici</a>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                    </asp:Login>
                </AnonymousTemplate>
            </asp:LoginView>
        </form>
        <asp:Panel runat="server" ID="panel1">
            Bienvenue, 
            <asp:LoginName ID="LoginName1" runat="server" />

        </asp:Panel>
    </div>
</div>
