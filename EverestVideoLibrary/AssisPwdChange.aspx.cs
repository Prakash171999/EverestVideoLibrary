using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace EverestVideoLibrary
{
    public partial class AssisPwdChange : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-FG2OP2K;Initial Catalog=EverestVideoLibrary;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            var newPwd = NewPwd.Text;
            var PwdConfirm = ConfirmPwd.Text;

            if(newPwd ==  PwdConfirm)
            {
                int userID = Convert.ToInt32(Session["userID"].ToString());
                

                conn.Open();
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = "UPDATE Users SET password ='" + NewPwd.Text + "' WHERE userid ='"+ userID +"'";
                cmd.ExecuteNonQuery();
                conn.Close();

                Label1.Text="Password Successfully Changed!";
            }
            else
            {
                Label1.Text = "Error! Password Change Failed!";
            }
        }
    }
}