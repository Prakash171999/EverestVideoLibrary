using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Windows.Forms;

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
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int memberID = Convert.ToInt32(DropDownList1.SelectedValue);
            int dvdID = Convert.ToInt32(DropDownList2.SelectedValue);

            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandType = System.Data.CommandType.Text;
            cmd1.CommandText = "Select Age FROM Member WHERE MemberID = (@textValue)";
            cmd1.Parameters.AddWithValue("@textValue", memberID);
            cmd1.Connection = conn;
            conn.Open();
            int memberAge = Convert.ToInt32(cmd1.ExecuteScalar());
            conn.Close();

            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandType = System.Data.CommandType.Text;
            cmd2.CommandText = "Select IsAgeRestricted FROM DVD WHERE DVD_ID = (@textValue)";
            cmd2.Parameters.AddWithValue("@textValue", dvdID);
            cmd2.Connection = conn;
            conn.Open();
            string isRestricted = (cmd2.ExecuteScalar()).ToString();
            conn.Close();

            SqlCommand cmd3 = new SqlCommand();
            cmd3.CommandType = System.Data.CommandType.Text;
            cmd3.CommandText = "Select Count(Loan.LoanID) AS TotalLoan FROM Loan JOIN Member ON Loan.MemberID = Member.MemberID WHERE Member.MemberID = @textValue";
            cmd3.Parameters.AddWithValue("@textValue", memberID);
            cmd3.Connection = conn;
            conn.Open();
            int totalLoan = Convert.ToInt32(cmd3.ExecuteScalar());        
            conn.Close();

            SqlCommand cmd4 = new SqlCommand();
            cmd4.CommandType = System.Data.CommandType.Text;
            cmd4.CommandText = "SELECT MemberCategory.TotalLoan FROM MemberCategory JOIN Member ON Member.MemberCategoryID = MemberCategory.MemberCategoryID WHERE Member.MemberID = @textValue";
            cmd4.Parameters.AddWithValue("textValue", memberID);
            cmd4.Connection = conn;
            conn.Open();
            int totalLoanAllowed = Convert.ToInt32(cmd4.ExecuteScalar());
            conn.Close();


            string loanTotal = "Loans Taken: " + totalLoan;
            string loansAllowed = "Loans Allowed: " + totalLoanAllowed;

            //string message;
            if (memberAge <= 18 && isRestricted == "True")
            {
                string message = "Opps! User is Restricted";
                MessageBox.Show(message + "\n\n" + loanTotal + "\n" + loansAllowed);

            }
            else
            {
               string message2 = "User is Not Restricted";
                MessageBox.Show(message2 + "\n\n" + loanTotal + "\n" + loansAllowed);


            }
            //Response.Write("<script>alert('" + message + "\n \n Loan taken: " + totalLoan + " \n\n Loan allowed: " + totalLoanAllowed + "');</script>)");


        }

        //public class messageBox
        //{
            
        //}
    }
}