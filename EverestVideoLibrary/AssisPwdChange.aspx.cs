using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EverestVideoLibrary
{
    public partial class AssisPwdChange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            var newPwd = NewPwd.ToString();
            var PwdConfirm = ConfirmPwd.ToString();

            if(newPwd ==  PwdConfirm)
            {

            }
        }
    }
}