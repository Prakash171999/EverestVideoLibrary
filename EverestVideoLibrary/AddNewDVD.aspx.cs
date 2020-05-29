using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EverestVideoLibrary
{
    public partial class AddNewDVD : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //This method redirects the user to the DVDAddForm page when add new dvd button is clicked
        protected void NewDVDAddBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("DVDAddForm.aspx");
        }
    }
}