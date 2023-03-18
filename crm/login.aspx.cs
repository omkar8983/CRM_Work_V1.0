using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CRM
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [System.Web.Services.WebMethod(EnableSession = true)]
        public static string User_login(string mobile, string password)
        {

            if (mobile != null)
            {
                try
                {

                    string CS = ConfigurationManager.ConnectionStrings["AdminDB"].ConnectionString;

                    DataSet dt = new DataSet();
                    using (SqlConnection con = new SqlConnection(CS))
                    {

                        using (SqlCommand cmd = new SqlCommand("USP_USER_MANAGEMENT"))
                        {

                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Connection = con;
                            cmd.Parameters.AddWithValue("@TYPE", "4");
                            cmd.Parameters.AddWithValue("@CONTACT", mobile);
                            cmd.Parameters.AddWithValue("@PASSWORD", password);

                            con.Open();
                            using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                            {
                                sda.Fill(dt);
                            }

                            if (dt.Tables[0].Rows[0]["DATA"].ToString() == "1") { 
                                string USER_GUID = dt.Tables[1].Rows[0]["USER_GUID"].ToString().ToUpper();
                                string EMP_CODE = dt.Tables[1].Rows[0]["EMP_CODE"].ToString().Trim();
                                string NAME = dt.Tables[1].Rows[0]["NAME"].ToString().Trim();
                                string ROLE_ID = dt.Tables[1].Rows[0]["ROLE_ID"].ToString();
                                string DEPT_ID = dt.Tables[1].Rows[0]["DEPT_ID"].ToString();
                                string DESIGNATION_ID = dt.Tables[1].Rows[0]["DESIGNATION_ID"].ToString();
                                string PROFILE_IMG = dt.Tables[1].Rows[0]["PROFILE_IMG"].ToString();


                                HttpCookie cookie = new HttpCookie("SALES_CRM");
                                cookie.Values["USER_GUID"] = USER_GUID;
                                cookie.Values["EMP_CODE"] = EMP_CODE;
                                cookie.Values["NAME"] = NAME;
                                cookie.Values["ROLE_ID"] = ROLE_ID;
                                cookie.Values["DEPT_ID"] = DEPT_ID;
                                cookie.Values["DESIGNATION_ID"] = DESIGNATION_ID;
                                cookie.Values["PROFILE_IMG"] = PROFILE_IMG;
                                cookie.Expires = DateTime.Now.AddDays(1);
                                HttpContext.Current.Response.Cookies.Add(cookie);
                                return string.Format("1");
                            }
                            else
                            {
                                return string.Format(dt.Tables[0].Rows[0]["DATA"].ToString());
                            }

                        }
                        
                    }
                    //}
                }
                catch (Exception ex)
                {
                    Console.Write(ex);
                    return string.Format("2");
                }

                
            }
            return "";
        }
    }
}