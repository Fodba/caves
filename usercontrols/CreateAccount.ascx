<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CreateAccount.ascx.cs" Inherits="usercontrols_CreateAccount" %>
<style type="text/css">
    .auto-style1 {
        height: 23px;
    }

    .auto-style2 {
        height: 30px;
    }
</style>
<link href="/css/domaine2.css" rel="stylesheet" />
<div class="inscriptionConnection">
<form runat="server">
    <div class="formContent">
    
        <div class=" formulaire">
            <div class="inscription">

                <span class="title">Se connecter</span>
                <asp:LoginView ID="UmbracoLoginView" runat="server">
                    <AnonymousTemplate>
                        <asp:Login CssClass="formlogin" ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn">
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
                                                    <td>&nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <a href="{localLink:1334}" style="color: #9b1230; text-decoration: underline;">Pas encore membre? Créez votre compte ici</a>
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

                <asp:Panel runat="server" ID="panel1">
                    Bienvenue, 
                <asp:LoginName ID="LoginName1" runat="server" />

                </asp:Panel>
            </div>
        </div>

        <div class="formulaire">
            <div class="inscription">

                <span class="title">Créez votre compte</span>
                <asp:CreateUserWizard ID="CreateUserWizard1" OnContinueButtonClick="CreateUserWizard1_ContinueButtonClick" OnCreatedUser="CreateUserWizard1_CreatedUser" runat="server" CreateUserButtonText="Créer un utilisateur" CreateUserButtonStyle-CssClass="button_create">
                    <CreateUserButtonStyle CssClass="button_create" />


                    <WizardSteps>
                        <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                            <ContentTemplate>
                                <table>

                                    <tr>
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nom d&#39;utilisateur&nbsp;</asp:Label>
                                    </tr>
                                    <tr>
                                        <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="Un nom d'utilisateur est requis." ToolTip="Un nom d'utilisateur est requis." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </tr>
                                    <tr>
                                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Mot de passe&nbsp;</asp:Label>
                                    </tr>
                                    <tr>
                                        <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Un mot de passe est requis." ToolTip="Un mot de passe est requis." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </tr>
                                    <tr>
                                        <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirmer le mot de passe&nbsp;</asp:Label>
                                    </tr>
                                    <tr>
                                        <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="La confirmation du mot de passe est requise." ToolTip="La confirmation du mot de passe est requise." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                    </tr>
                                    <tr>
                                        <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">Adresse de messagerie&nbsp;</asp:Label>
                                    </tr>
                                    <tr>
                                        <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="Une adresse de messagerie est requise." ToolTip="Une adresse de messagerie est requise." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="vemailreg" ControlToValidate="email" ValidationGroup="CreateUserWizard1" ErrorMessage="L'adresse E-mail fournie est incorrecte" runat="server" Display="None" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2">
                                            <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="Le mot de passe et le mot de passe de confirmation doivent correspondre." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" style="color: Red;">
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="CreateUserWizard1" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" colspan="2" style="color: Red;">
                                            <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                        </td>
                                    </tr>

                                </table>
                            </ContentTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                            <ContentTemplate>
                                <table>
                                    <tr height="20">
                                    </tr>
                                    <tr>
                                        <td>Votre compte a été créé correctement.</td>
                                    </tr>
                                    <tr height="20">
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="2">
                                            <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continuer" CssClass="button_create" ValidationGroup="CreateUserWizard1" />
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </WizardSteps>
                </asp:CreateUserWizard>
                <a href="{localLink:1342}" style="color: #9b1230; text-decoration: underline;">Déjà membre? Se connecter </a>
            </div>
        </div>

    </div>
</form>
    </div>