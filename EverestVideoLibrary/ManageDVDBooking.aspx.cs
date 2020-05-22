using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace EverestVideoLibrary
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-FG2OP2K;Initial Catalog=EverestVideoLibrary;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            //conn.Open();
            //SqlCommand cmd = conn.CreateCommand();
            //cmd.CommandType = CommandType.Text;
            //cmd.CommandText = "Insert into loan values ('"+ CopyIDDropDownList3.Text +"','"+"') ";
            //cmd.ExecuteNonQuery();
        }
    }
}