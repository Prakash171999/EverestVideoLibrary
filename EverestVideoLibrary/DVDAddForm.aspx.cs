using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace EverestVideoLibrary
{
    public partial class DVDAddForm : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{

        //}

        //protected void DVDInsertForm_Click(object sender, EventArgs e)
        //{

        //}

        //protected void DVDInsertForm_Click1(object sender, EventArgs e)
        //{

        //}

        protected void dvdSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(@"Data Source=DESKTOP-FG2OP2K;Initial Catalog=EverestVideoLibrary;Integrated Security=True");



            string dvdTitle = (dvd_title.Value.ToString()).ToString();
            string dvdCategory = (category.Value.ToString()).ToString();
            string dvdProducer = (Producer.Value.ToString()).ToString();
            string dvdStudio = (Studio.Value.ToString()).ToString();
            string dvdActor = (Actor.Value.ToString()).ToString();
            Response.Write('a');
            bool dvdAgeRestriction;
            bool isChecked = radio1.Checked;
            if (isChecked)
                dvdAgeRestriction = true;
            else
                dvdAgeRestriction = false;
            Response.Write('0');
            var dvdReleasedDate = Convert.ToDateTime(releasedate.Value.ToString());
            Response.Write('b');
            var dvdStandardCharge = Convert.ToInt32(StandardCharge.Value.ToString());
            var dvdPenaltyCharge = Convert.ToInt32(PenaltyCharge.Value.ToString());
            var totalCopies = Convert.ToInt32(TotalCopies.Value.ToString());
            Response.Write('1');
            SqlConnection sqlConnection1 = new SqlConnection(@"Data Source=DESKTOP-FG2OP2K;Initial Catalog=EverestVideoLibrary;Integrated Security=True");

            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = System.Data.CommandType.Text;
            cmd1.CommandText = "Insert into Producer (ProducerName) Values (@producerName)";
            cmd1.Parameters.AddWithValue("@producerName", dvdProducer);
            cmd1.Connection = sqlConnection1;
            sqlConnection1.Open();
            cmd1.ExecuteNonQuery();
            sqlConnection1.Close();

            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd2.CommandText = "Insert into Studio (StudioName) Values (@textValue)";
            cmd2.Parameters.AddWithValue("@textValue", dvdStudio);
            cmd2.Connection = sqlConnection1;
            sqlConnection1.Open();
            cmd2.ExecuteNonQuery();
            sqlConnection1.Close();

            int producerID;
            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandType = System.Data.CommandType.Text;
            cmd3.CommandText = ("SELECT MAX(ProducerID) FROM Producer");
            cmd3.Connection = sqlConnection1;
            sqlConnection1.Open();
            producerID = Convert.ToInt32(cmd3.ExecuteScalar());
            Console.WriteLine(producerID);
            sqlConnection1.Close();

            int studioID;
            SqlCommand cmd4 = new SqlCommand();
            cmd4.CommandType = System.Data.CommandType.Text;
            cmd4.CommandText = "SELECT MAX(StudioID) FROM Studio";
            cmd4.Connection = sqlConnection1;
            sqlConnection1.Open();
            studioID = Convert.ToInt32(cmd4.ExecuteScalar());
            sqlConnection1.Close();

            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandType = System.Data.CommandType.Text;
            cmd5.CommandText = "Insert into DVD (DVD_title, Category, ProducerID, StudioID, IsAgeRestricted, ReleaseDate, StandardCharge, PenaltyCharge)" +
                        "Values (@textValue1, @textValue2, @textValue3, @textValue4, @textValue5, @textValue6, @textValue7, @textValue8)";

            cmd5.Parameters.AddWithValue("@textValue1", dvdTitle);
            cmd5.Parameters.AddWithValue("@textValue2", dvdCategory);
            cmd5.Parameters.AddWithValue("@textValue3", producerID);
            cmd5.Parameters.AddWithValue("@textValue4", studioID);
            cmd5.Parameters.AddWithValue("@textValue5", dvdAgeRestriction);
            cmd5.Parameters.AddWithValue("@textValue6", dvdReleasedDate);
            cmd5.Parameters.AddWithValue("@textValue7", dvdStandardCharge);
            cmd5.Parameters.AddWithValue("@textValue8", dvdPenaltyCharge);
            cmd5.Connection = sqlConnection1;
            sqlConnection1.Open();
            cmd5.ExecuteNonQuery();
            sqlConnection1.Close();


            int dvdID;
            SqlCommand cmd6 = new SqlCommand();
            cmd6.CommandType = System.Data.CommandType.Text;
            cmd6.CommandText = "Select Max(DVD_ID) FROM DVD";
            cmd6.Connection = sqlConnection1;
            sqlConnection1.Open();
            dvdID = Convert.ToInt32(cmd6.ExecuteScalar());
            sqlConnection1.Close();

            for (int i = 0; i < totalCopies; i++)
            {
                SqlCommand cmd7 = new SqlCommand();
                cmd7.CommandType = System.Data.CommandType.Text;
                cmd7.CommandText = ("Insert into DVD_Copy (DVD_ID) Values (@textValue)");
                cmd7.Parameters.AddWithValue("@textValue", dvdID);
                cmd7.Connection = sqlConnection1;
                sqlConnection1.Open();
                cmd7.ExecuteNonQuery();
                sqlConnection1.Close();
            }
            List<int> actorList = new List<int>();
            string[] names = dvdActor.Split(',');
            foreach (string name in names)
            {
                string[] breakName = name.Split(' ');
                string firstName = breakName[0].ToString();
                string lastName = breakName[1].ToString();
                SqlCommand cmd8 = new SqlCommand();
                cmd8.CommandType = System.Data.CommandType.Text;
                cmd8.CommandText = ("Insert into Actor (Actor_Fname, Actor_Lname) Values (@textValue1, @textValue2)");
                cmd8.Parameters.AddWithValue("@textValue1", firstName); cmd8.Parameters.AddWithValue("@textValue2", lastName);
                cmd8.Connection = sqlConnection1;

                SqlCommand cmd9 = new SqlCommand();
                cmd9.CommandType = System.Data.CommandType.Text;
                cmd9.CommandText = ("SELECT Max(ActorID) FROM Actor");
                cmd9.Connection = sqlConnection1;

                sqlConnection1.Open();
                cmd8.ExecuteNonQuery();
                actorList.Add(Convert.ToInt32(cmd9.ExecuteScalar()));
                sqlConnection1.Close();
            }
            foreach (int actor in actorList)
            {
                SqlCommand cmd10 = new SqlCommand();
                cmd10.CommandType = System.Data.CommandType.Text;
                cmd10.CommandText = ("Insert into CastMember (ActorID, DVD_ID) VALUES (@textValue1, @textValue2)");
                cmd10.Parameters.AddWithValue("@textValue1", actor);
                cmd10.Parameters.AddWithValue("@textValue2", dvdID);
                cmd10.Connection = sqlConnection1;
                sqlConnection1.Open();
                cmd10.ExecuteNonQuery();
                sqlConnection1.Close();
            }

            sqlConnection1.Dispose();

            MessageBox.Show("New DVD has been added to the store.");
            ClearAddDVDForm();
            
        }
        //This method clears all the text fields from the add new DVD form.
        public void ClearAddDVDForm()
        {
            dvd_title.Value = "";
            category.Value = "";
            Producer.Value = "";
            Actor.Value = "";
            Studio.Value = "";
            radio1.Checked = true;
            releasedate.Value = "";
            StandardCharge.Value = "";
            PenaltyCharge.Value = "";
            TotalCopies.Value = "";
            
        }
    }
}
   