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
    public partial class ManageReturnedDVD : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //ReturnedDVD Button click event
        protected void ReturnedDVD_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-FG2OP2K;Initial Catalog=EverestVideoLibrary;Integrated Security=True");

            SqlConnection con = new SqlConnection(@"Data Source=DESKTOP-FG2OP2K;Initial Catalog=EverestVideoLibrary;Integrated Security=True");

            int loanID = Convert.ToInt32(DropDownList1.SelectedValue.ToString());
            int totalDays = Convert.ToInt32(totaldays.Value.ToString());
            DateTime returnDate = Convert.ToDateTime(returndate.Value.ToString());

            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = System.Data.CommandType.Text;
            cmd1.CommandText = "UPDATE Loan SET ReturnedDate = @textValue1, TotalDays = @textValue2 WHERE LoanID = @textValue3";
            cmd1.Parameters.AddWithValue("@textValue1", returnDate);
            cmd1.Parameters.AddWithValue("@textValue2", totalDays);
            cmd1.Parameters.AddWithValue("@textValue3", loanID);
            cmd1.Connection = conn;
            conn.Open();
            cmd1.ExecuteNonQuery();
            conn.Close();

            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd2.CommandText = "SELECT DVD.StandardCharge FROM DVD JOIN DVD_Copy ON DVD.DVD_ID = DVD_Copy.DVD_ID JOIN Loan ON Loan.CopyID = DVD_Copy.CopyID WHERE LoanID = @textValue";
            cmd2.Parameters.AddWithValue("@textValue", loanID);
            cmd2.Connection = conn;
            conn.Open();
            int dvdCharge = Convert.ToInt32(cmd2.ExecuteScalar());
            conn.Close();

            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandType = System.Data.CommandType.Text;
            cmd3.CommandText = "SELECT (SELECT CASE WHEN ((Loan.TotalDays) - (LoanType.LoanDuration)) <= 0 THEN 0 ELSE((Loan.TotalDays) - (LoanType.LoanDuration)) END) AS Days FROM Loan JOIN LoanType ON Loan.LoanTypeID = LoanType.LoanTypeID WHERE LoanID = @textValue";
            cmd3.Parameters.AddWithValue("@textValue", loanID);
            cmd3.Connection = conn;
            conn.Open();
            int extraDays = Convert.ToInt32(cmd3.ExecuteScalar());
            conn.Close();


            SqlCommand cmd4 = new SqlCommand();
            cmd4.CommandType = System.Data.CommandType.Text;
            cmd4.CommandText = "SELECT (DVD.StandardCharge+(SELECT CASE WHEN (DVD.PenaltyCharge * ((Loan.TotalDays) - " +
                "(LoanType.LoanDuration))) < 0 THEN 0 ELSE(DVD.PenaltyCharge * ((Loan.TotalDays) - " +
                "(LoanType.LoanDuration))) END)) AS TotalCharge From Member JOIN Loan ON " +
                "Member.MemberID = Loan.MemberID JOIN DVD_Copy ON Loan.CopyID = DVD_Copy.CopyID JOIN " +
                "DVD ON DVD.DVD_ID = DVD_Copy.DVD_ID JOIN LoanType ON LoanType.LoanTypeID = Loan.LoanTypeID " +
                "WHERE Loan.LoanID = @textValue";
            cmd4.Parameters.AddWithValue("@textValue", loanID);
            cmd4.Connection = conn;
            conn.Open();
            int totalCharge = Convert.ToInt32(cmd4.ExecuteScalar());
            conn.Close();

            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandType = System.Data.CommandType.Text;
            cmd5.CommandText = "SELECT (SELECT CASE WHEN(DVD.PenaltyCharge * ((Loan.TotalDays) - (LoanType.LoanDuration))) < 0 THEN 0 ELSE(DVD.PenaltyCharge * ((Loan.TotalDays) - (LoanType.LoanDuration))) END AS Expr1) AS Fine FROM Member INNER JOIN Loan ON Member.MemberID = Loan.MemberID INNER JOIN DVD_Copy ON Loan.CopyID = DVD_Copy.CopyID INNER JOIN DVD ON DVD.DVD_ID = DVD_Copy.DVD_ID INNER JOIN LoanType ON LoanType.LoanTypeID = Loan.LoanTypeID WHERE Loan.LoanID = @textValue";
            cmd5.Parameters.AddWithValue("@textValue", loanID);
            cmd5.Connection = conn;
            conn.Open();
            int fine = Convert.ToInt32(cmd5.ExecuteScalar());
            conn.Close();

            conn.Dispose();

            string standardCharge = "You Standard Charge is: " + dvdCharge;
            string fineCharge = "Your Penalty Charge is: " + fine;
            string OverallCharge = "Your Total Charge is: " + totalCharge;
            

            MessageBox.Show("The DVD returned date has been updated!\n\n" + standardCharge + "\n" + fineCharge + "\n" + OverallCharge );


        }
        //Method stores the object of SqlCommand.
        public void  connection()
        {
            SqlCommand cmd4 = new SqlCommand();
            cmd4.CommandType = System.Data.CommandType.Text;
        }
    }
}