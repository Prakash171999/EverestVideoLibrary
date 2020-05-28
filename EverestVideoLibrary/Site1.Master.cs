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

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["username"] == null)
            {
                Response.Redirect("login.aspx");
            }

            var usertype = Session["usertype"];
            userType.Text = usertype.ToString();

            if (Session["usertype"].ToString() == "Manager")
            {
                ManageUserBtn.Visible = true;
                AssistanceChangePasswordBtn.Visible = false;     
            }
            else
            {
                ManageUserBtn.Visible = false;
                AssistanceChangePasswordBtn.Visible = true;                
            }


        }

        protected void logoutBtn_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }

        protected void AssistanceChangePasswordBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssisPwdChange.aspx");
        }

        protected void ManageUserBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageUsers.aspx");
        }
    }
}