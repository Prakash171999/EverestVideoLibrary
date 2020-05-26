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
    public partial class WebForm8 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-FG2OP2K;Initial Catalog=EverestVideoLibrary;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
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
                if (datatable.Rows.Count > 0)
                {
                    Session["userID"] = dr["userid"].ToString();
                    Session["username"] = dr["username"].ToString();
                    Session["usertype"] = dr["usertype"].ToString();                   
                    Response.Redirect("Dashboard.aspx");
                   
                }
                //if (username != dr["username"] || password != dr["password"])
                else if (datatable.Rows.Count < 0)
                {
                    MessageBox.Show("Invalid Username or password!");
                }
            }
            conn.Close();
        }
    }
}