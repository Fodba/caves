<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LoginView2.ascx.cs" Inherits="usercontrols_LoginView" %>

<div class="connect pull-righte" id="divConnect" runat="server">
    <asp:Panel runat="server" ID="connect">
        <div class="hidden-phone">
            <%--<a href="{localLink:1342}"><span class="conn_btn">CONNEXION</span></a>--%>
            <a href="{localLink:1334}" id="linkSub"><span class="conn_btn">CONNEXION</span></a>
        </div>
        <div class="connectPhone visible-phone">
            <a href="{localLink:1342}"><i class="icon-user"> Se connecter</i></a>
        </div>
    </asp:Panel>
    <form runat="server" id="formStatus" style="font-weight: bold;margin:0px">
        <div class="hidden-phone">
            <asp:Label ID="name" runat="server"></asp:Label> -&nbsp;
            <asp:LoginStatus LogoutText="Déconnexion" ID="LoginStatusMember" runat="server" ForeColor="#9f1536" />
        </div>
        <div class="visible-phone connectPhone">
             <asp:Label ID="nameP" runat="server"></asp:Label> -&nbsp;
            <asp:LoginStatus LogoutText="Déconnexion" ID="LoginStatusMemberP" runat="server" ForeColor="#9f1536" />
        </div>
    </form>
</div>
