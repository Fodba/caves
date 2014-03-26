using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using umbraco.cms.businesslogic.member;

public partial class usercontrols_CustomerLogin : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Member currentMember = Member.GetCurrentMember();
        if (currentMember != null)
        {
            form.Visible = false;
            panel1.Visible = true;
            //LoginStatusMember.Visible = true;
        }
        else
        {
            //LoginStatusMember.Visible = false;
            form.Visible = true;
            panel1.Visible = false;
        }
    }
}