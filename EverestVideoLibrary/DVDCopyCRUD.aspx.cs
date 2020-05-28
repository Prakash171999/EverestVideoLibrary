using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace EverestVideoLibrary
{
    public partial class DVDCopyCRUD : System.Web.UI.Page
    {
        //Instance for the SqlConnection
        private SqlConnection connection = new SqlConnection();

        //Instace for SqlCommand
        private SqlCommand command = new SqlCommand();

        //Instance for SqlDataAdapter
        private SqlDataAdapter adapter = new SqlDataAdapter();

        //Instance for DataSet
        private DataSet data = new DataSet();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public DVDCopyCRUD()
        {
            //Configure the ConnectionString for SqlConnection instance
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["EverestVideoLibraryConnectionString"].ConnectionString.ToString();

            //Configure the SqlCommand instance
            command.Connection = connection;

            //Configure SqlDataAdapter instance
            adapter.SelectCommand = command;
        }
        protected void OldDVDDelete_Click(object sender, EventArgs e)
        {
            LinkButton deleteButton = sender as LinkButton;
            GridViewRow currentRow = (GridViewRow)deleteButton.NamingContainer;

            command.CommandText = "DELETE FROM DVD_Copy WHERE CopyID = @id";
            command.Parameters.Clear();
            command.Parameters.AddWithValue("@id", GridView1.Rows[currentRow.RowIndex].Cells[0].Text);

            connection.Open();
            command.ExecuteNonQuery();

            Response.Redirect("~/DVDCopyCRUD.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
    
}