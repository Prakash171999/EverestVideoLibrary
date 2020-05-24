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
                ManageUser.Visible = true;
                AssistanceChangePassword.Visible = false;
            }
            else
            {
                ManageUser.Visible = false;
                AssistanceChangePassword.Visible = true;
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Session.Clear();
            Response.Redirect("login.aspx");
        }

        protected void AssistanceChangePassword_Click(object sender, EventArgs e)
        {
            Response.Redirect("AssisPwdChange.aspx");
        }

        protected void ManageUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("ManageUsers.aspx");
        }
    }
}