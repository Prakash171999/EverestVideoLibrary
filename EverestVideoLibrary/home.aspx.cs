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
    public partial class home : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-FG2OP2K;Initial Catalog=EverestVideoLibrary;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "select * from users where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'";
            cmd.ExecuteNonQuery();
            DataTable datatable = new DataTable();
            SqlDataAdapter dataAdapter = new SqlDataAdapter(cmd);
            dataAdapter.Fill(datatable);
            foreach (DataRow dr in datatable.Rows)
            {
                Session["username"] = dr["username"].ToString();
                Session["usertype"] = dr["usertype"].ToString();
                Response.Redirect("Dashboard.aspx");

            }
            conn.Close();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //Response.Write("<script>window.close()</script>");
            Response.Write("<script language='javascript'> { self.close() }</script>");
        }
    }
}