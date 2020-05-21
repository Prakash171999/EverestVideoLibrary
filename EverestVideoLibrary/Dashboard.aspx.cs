using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EverestVideoLibrary
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("home.aspx");
                Response.Write("No user logged in.");
            }
            Response.Write("Welcome");

        }

        protected void Btn_logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("home.aspx");
            //Response.Write("<script language='javascript'>window.alert('Logout Successful!');window.location='home.aspx';</script>");
        }
    }
}