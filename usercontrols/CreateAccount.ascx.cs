using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class usercontrols_CreateAccount : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        //Roles.AddUserToRole(CreateUserWizard1.UserName, "WebCustomer");
    }

    protected void CreateUserWizard1_ContinueButtonClick(object sender, EventArgs e)
    {
        Response.Redirect("/");
    }
  
    protected void Login1_LoggedIn(object sender, EventArgs e)
    {
        Response.Redirect("/fr/accueil/");
    }
}