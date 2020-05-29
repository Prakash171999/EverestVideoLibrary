using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace EverestVideoLibrary
{
    public partial class Dashboard : System.Web.UI.Page
    {
        //This method loads automatically everytime the dashboard page is opened.
        //This method gets the required value from the database through the SqlDataSources and sets the value into the respective cards. 
        protected void Page_Load(object sender, EventArgs e)
        {
            DataView memberCount = (DataView)sqlMember.Select(DataSourceSelectArguments.Empty);
            Members.Text = String.Join("|", memberCount.Table.Rows[0].ItemArray.Select(p => p.ToString()).ToArray());

            DataView dvdCount = (DataView)sqlDVD.Select(DataSourceSelectArguments.Empty);
            DVD.Text = String.Join("|", dvdCount.Table.Rows[0].ItemArray.Select(p => p.ToString()).ToArray());

            DataView actorCount = (DataView)sqlActor.Select(DataSourceSelectArguments.Empty);
            actor.Text = String.Join("|", actorCount.Table.Rows[0].ItemArray.Select(p => p.ToString()).ToArray());

            DataView producerCount = (DataView)sqlProducer.Select(DataSourceSelectArguments.Empty);
            producers.Text = String.Join("|", producerCount.Table.Rows[0].ItemArray.Select(p => p.ToString()).ToArray());

            DataView studioCount = (DataView)sqlStudio.Select(DataSourceSelectArguments.Empty);
            studio.Text = String.Join("|", studioCount.Table.Rows[0].ItemArray.Select(p => p.ToString()).ToArray());
        }
    }
}