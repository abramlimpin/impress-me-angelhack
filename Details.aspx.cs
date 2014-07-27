using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Details : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(Helper.GetCon());

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["suggest"] != null)
        {
            int postID = 0;
            bool validPost = int.TryParse(Request.QueryString["suggest"].ToString(), out postID);

            if (validPost)
            {
                GetInfo(postID);
            }
            else
            {
                Response.Redirect("Suggest.aspx");
            }
        }
        else
            Response.Redirect("Suggest.aspx");
    }

    void GetInfo(int postID)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT Posts.PostID, Posts.PostName, Posts.Description, " +
            "Posts.Budget, Posts.Hazards, Images.Image FROM Posts INNER JOIN Images ON " +
            "Posts.PostID = Images.PostID WHERE Posts.PostID=@PostID";
        cmd.Parameters.AddWithValue("@PostID", postID);
        SqlDataReader data = cmd.ExecuteReader();
        if (data.HasRows)
        {
            while (data.Read())
            {
                imgPost.ImageUrl = Helper.GetURL() + "/assets/posts/" + data["Image"].ToString();
                ltName.Text = data["PostName"].ToString();
                ltDesc.Text = data["Description"].ToString();
                ltBudget.Text = data["Budget"].ToString();
                ltHazards.Text = data["Hazards"].ToString();
            }
            con.Close();
        }
        else
        {
            con.Close();
            Response.Redirect("Suggest.aspx");
        }
    }
}