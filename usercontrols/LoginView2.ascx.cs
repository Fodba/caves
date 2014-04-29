using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using umbraco.cms.businesslogic.member;

public partial class usercontrols_LoginView : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Url.PathAndQuery == "/")
        {
            divConnect.Style.Add("margin-top", "86px");
        }
        
        Member currentMember = Member.GetCurrentMember();
        if (currentMember != null)
        {
            //UmbracoLoginView.Visible = false;
            formStatus.Visible = true;
            connect.Visible = false;
            name.Text = "Bienvenue, " + currentMember.LoginName;//.getProperty("firstName").Value + currentMember.getProperty("lastName").Value;
            nameP.Text = "Bienvenue, " + currentMember.LoginName;
        }
        else
        {
            formStatus.Visible = false;
            connect.Visible = true;
            //UmbracoLoginView.Visible = true;
        }
    }
}