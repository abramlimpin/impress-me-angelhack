using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Suggest : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetSuggestions();
            GetRegions();
            GetCities(ddlRegions.SelectedValue);
        }
    }

    void GetSuggestions()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Posts.PostName, Posts.Description, Posts.Budget, Images.Image " +
            "FROM Posts INNER JOIN Images ON Posts.PostID = Images.PostID";
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds, "Posts");

        lvSuggests.DataSource = ds;
        lvSuggests.DataBind();
        con.Close();
    }

    void GetRegions()
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT RegionID, Name FROM Regions";
        SqlDataReader data = cmd.ExecuteReader();
        ddlRegions.DataSource = data;
        ddlRegions.DataTextField = "Name";
        ddlRegions.DataValueField = "RegionID";
        ddlRegions.DataBind();
        con.Close();
    }

    void GetCities(string regionID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT CityID, Name FROM Cities WHERE RegionID=@RegionID ORDER BY NEWID() ";
        cmd.Parameters.AddWithValue("@RegionID", regionID);
        SqlDataReader data = cmd.ExecuteReader();
        ddlCities.DataSource = data;
        ddlCities.DataTextField = "Name";
        ddlCities.DataValueField = "CityID";
        ddlCities.DataBind();
        con.Close();
    }

    protected void ddlRegions_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetCities(ddlRegions.SelectedValue);
    }
}