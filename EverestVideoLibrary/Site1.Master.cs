using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EverestVideoLibrary
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        //This method loads when everytime the site1 master page opens
        protected void Page_Load(object sender, EventArgs e)
        {
            //Checking if the session for username is null or not.
            //If the session value for username is null, user is redirected to the login page directly.
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }

            var usertype = Session["usertype"];
            userType.Text = usertype.ToString();

            //Checks the session for usertype of the logged in user.
            //The system show the respective buttons for particular usertype.
            if (Session["usertype"].ToString() == "Manager")
            {
                //If the usertype is "manager" than the ManageUserBtn is made visible and assistanceChangeBtn is hidden.
                ManageUserBtn.Visible = true;
                AssistanceChangePasswordBtn.Visible = false;     
            }
            //Else the ManageUserBtn is hidden and assistanceChangeBtn is made visible.
            else
            {
                ManageUserBtn.Visible = false;
                AssistanceChangePasswordBtn.Visible = true;                
            }


        }

        // This method is used to logout the user from the system by clearing all the session data. And redirecting the user to the login page.
        protected void logoutBtn_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }
        //This method redirects the user to the AssistanceChangePassword page.
        protected void AssistanceChangePasswordBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssisPwdChange.aspx");
        }
        //This method redirects the user to the ManageUsers page.
        protected void ManageUserBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageUsers.aspx");
        }
    }
}