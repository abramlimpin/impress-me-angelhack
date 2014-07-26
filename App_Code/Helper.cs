using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net.Mail;

/// <summary>
/// Summary description for Helper
/// </summary>
public class Helper
{
	public Helper()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public static string GetCon()
    {
        return ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString;
    }

    public static string Encrypt(string toEncrypt, bool useHashing)
    {
        byte[] keyArray;
        byte[] toEncryptArray = UTF8Encoding.UTF8.GetBytes(toEncrypt);

        System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
        // Get the key from config file
        string key = "impressme";
        if (useHashing)
        {
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
            hashmd5.Clear();
        }
        else
            keyArray = UTF8Encoding.UTF8.GetBytes(key);

        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        tdes.Key = keyArray;
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateEncryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);
        tdes.Clear();
        return Convert.ToBase64String(resultArray, 0, resultArray.Length);
    }
    /// <summary>
    /// DeCrypt a string using dual encryption method. Return a DeCrypted clear string
    /// </summary>
    /// <param name="cipherString">encrypted string</param>
    /// <param name="useHashing">Did you use hashing to encrypt this data? pass true is yes</param>
    /// <returns></returns>
    public static string Decrypt(string cipherString, bool useHashing)
    {
        byte[] keyArray;
        byte[] toEncryptArray = Convert.FromBase64String(cipherString);

        System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
        //Get your key from config file to open the lock!
        string key = "impressme";

        if (useHashing)
        {
            MD5CryptoServiceProvider hashmd5 = new MD5CryptoServiceProvider();
            keyArray = hashmd5.ComputeHash(UTF8Encoding.UTF8.GetBytes(key));
            hashmd5.Clear();
        }
        else
            keyArray = UTF8Encoding.UTF8.GetBytes(key);

        TripleDESCryptoServiceProvider tdes = new TripleDESCryptoServiceProvider();
        tdes.Key = keyArray;
        tdes.Mode = CipherMode.ECB;
        tdes.Padding = PaddingMode.PKCS7;

        ICryptoTransform cTransform = tdes.CreateDecryptor();
        byte[] resultArray = cTransform.TransformFinalBlock(toEncryptArray, 0, toEncryptArray.Length);

        tdes.Clear();
        return UTF8Encoding.UTF8.GetString(resultArray);
    }

    public static void SendEmail(string email, string subject, string message)
    {
        MailMessage emailMessage = new MailMessage();
        emailMessage.From = new MailAddress("impress.me.server@gmail.com", "Administrator");
        emailMessage.To.Add(new MailAddress(email));
        emailMessage.Subject = subject;
        emailMessage.Body = message;
        emailMessage.IsBodyHtml = true;
        emailMessage.Priority = MailPriority.Normal;
        SmtpClient MailClient = new SmtpClient("smtp.gmail.com", 587);
        MailClient.EnableSsl = true;
        MailClient.Credentials = new System.Net.NetworkCredential("impress.me.server@gmail.com", "impressmetemppw");
        MailClient.Send(emailMessage);
    }

    public static string GetURL()
    {
        string URL = HttpContext.Current.Request.Url.Scheme + "://" +
            HttpContext.Current.Request.Url.Authority + HttpContext.Current.Request.ApplicationPath;
        return URL;
    }

    public static void ValidateUser()
    {
        if (HttpContext.Current.Session["supplierid"] == null)
        { 
            HttpContext.Current.Response.Redirect("~/Account/Login.aspx?url=" +
                HttpContext.Current.Request.Url.AbsoluteUri);
        }
    }
    public static string CreateSHAHash(string Phrase)
    {
        SHA512Managed HashTool = new SHA512Managed();
        Byte[] PhraseAsByte = System.Text.Encoding.UTF8.GetBytes(string.Concat(Phrase));
        Byte[] EncryptedBytes = HashTool.ComputeHash(PhraseAsByte);
        HashTool.Clear();
        return Convert.ToBase64String(EncryptedBytes);
    }

    public static void ClearTextboxes(ControlCollection cc)
    {
        foreach (Control ctrl in cc)
        {
            TextBox tb = ctrl as TextBox;
            if (tb != null)
            {
                tb.Text = "";
            }
            else
                ClearTextboxes(ctrl.Controls);
        }
    }

    public static void AddLog(string userID, string logType, string description)
    {
        SqlConnection con = new SqlConnection(GetCon());
        con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "INSERT INTO Logs VALUES (@UserID, @LogType, @Description, @Timestamp)";
        cmd.Parameters.Add("@UserID", SqlDbType.BigInt).Value = userID;
        cmd.Parameters.Add("@LogType", SqlDbType.VarChar).Value = logType;
        cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = description;
        cmd.Parameters.Add("@Timestamp", SqlDbType.DateTime).Value = DateTime.Now;
        cmd.ExecuteNonQuery();
        con.Close();
        con.Dispose();
    }

    public static string GetData(string table, string column)
    {
        SqlConnection con = new SqlConnection(GetCon());
        con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT CONVERT(varchar, " + column + ") FROM " + table + " WHERE UserID=@UserID";
        cmd.Parameters.AddWithValue("@UserID", HttpContext.Current.Session["userid"].ToString());
        string data = (string)cmd.ExecuteScalar();
        con.Close();
        con.Dispose();
        return data;
    }

    public static string CountData(string table)
    {
        SqlConnection con = new SqlConnection(GetCon());
        con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = con;
        cmd.CommandText = "SELECT COUNT(*) FROM " + table;
        int count = (int)cmd.ExecuteScalar();
        con.Close();
        con.Dispose();
        return count.ToString();
    }
}