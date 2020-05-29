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
        //Object of the SqlConnection to connect with the server database.
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-FG2OP2K;Initial Catalog=EverestVideoLibrary;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //This method updates the assistant password.
        protected void chgPwdBtn_Click(object sender, EventArgs e)
        {
            var newPwd = NewPwd.Text;
            var PwdConfirm = ConfirmPwd.Text;

            //Checks if the new password text field and confirm password text field values are same or not.
            //If the value matches, assistant's new password is updated in the database table and displays the message for success and failure in label.
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