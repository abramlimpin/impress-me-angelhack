using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Random : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        RandomPost();
    }

    void RandomPost()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT TOP 1 PostID FROM Posts ORDER BY NEWID()";
        int postID = (int)cmd.ExecuteScalar();
        con.Close();
        Response.Redirect("Details.aspx?suggest=" + postID.ToString());
    }
}