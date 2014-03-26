<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LessFilesEditor.aspx.cs" MasterPageFile="../../masterpages/umbracoPage.Master" Inherits="uLess.Core.UI.LessFilesEditor" %>

<%@ Register TagPrefix="umb" Namespace="umbraco.uicontrols" Assembly="controls" %>
<asp:content contentplaceholderid="body" runat="server">

	<umb:UmbracoPanel runat="server" ID="UmbracoPanel" Text="Less Editor" hasMenu="true">
		
		<umb:Pane runat="server" ID="EditPane" Text="Edit Less File">
			
			<umb:Feedback runat="server" ID="Feedback" Visible="false" />

			<umb:PropertyPanel runat="server" ID="NamePanel" Text="Name">
				<asp:TextBox ID="TxtName" Width="350px" runat="server" />
			</umb:PropertyPanel>
			
			<umb:PropertyPanel runat="server" id="PathPanel" Text="Path">
				<asp:Literal ID="LtrlPath" runat="server" />
			</umb:PropertyPanel>

			<umb:PropertyPanel runat="server" ID="EditorPanel">
				<umb:CodeArea runat="server" ID="EditorSource" CodeBase="Css" AutoResize="true" OffSetX="47" OffSetY="47"  />
			</umb:PropertyPanel>

		</umb:Pane>

	</umb:UmbracoPanel>

</asp:content>
