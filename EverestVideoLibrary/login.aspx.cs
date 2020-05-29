using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class login : System.Web.UI.Page
    {
        //Object of Sql connection with the server database
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-FG2OP2K;Initial Catalog=EverestVideoLibrary;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /**When the BtnLogin button is clicked, it checks if the username and password entered by the user in the text field is
           vaid or not by checking in the database table using select query.

           For all the valid user credentails they are redirected their respective pages after successful login.
        **/

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "select * from users where username='" + username.Text + "' and password='" + password.Text + "'";
            cmd.ExecuteNonQuery();

            DataTable datatable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(datatable);
            foreach (DataRow dr in datatable.Rows)
            {
                //If the rows in the datatable is more than 0 then the users ID, username and usertype is stored in the session.
                //And user is redirected to their respective dashboards.
                if (datatable.Rows.Count > 0)
                {
                    Session["userID"] = dr["userid"].ToString();
                    Session["username"] = dr["username"].ToString();
                    Session["usertype"] = dr["usertype"].ToString();                   
                    Response.Redirect("Dashboard.aspx");
                   
                }
                //Else a message box is displayed with error message.
                else if
                {
                    MessageBox.Show("Invalid Username or password!");
                }
            }
            conn.Close();
        }
    }
}