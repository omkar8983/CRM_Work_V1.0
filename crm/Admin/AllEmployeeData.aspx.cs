using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using ClosedXML.Excel;
using System.Data.SqlClient;
using System.Configuration;

namespace CRM.Admin
{
    public partial class AllEmployeeData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ExportExcel(object sender, EventArgs e)
        {

            string str = ConfigurationManager.ConnectionStrings["AdminDB"].ToString();

            using (SqlConnection con = new SqlConnection(str))
            {

                using (SqlCommand cmd = new SqlCommand("USP_USER_MANAGEMENT"))
                {

                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@TYPE", "11");
                    //cmd.Parameters.AddWithValue("@EMP_CODE", "6");
                    cmd.Parameters.AddWithValue("@HUB", hdnhub.Value);
                    cmd.Parameters.AddWithValue("@startdate", hdndate.Value);

                    con.Open();
                    DataSet ds = new DataSet();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(ds);
                    }
                    int tt = ds.Tables.Count;
                    if(tt > 0) { 
                    //ds.Tables[0].TableName = "Rupali";
                    for (int i = 0; i < tt; i++)
                    {
                        ds.Tables[i].TableName = ds.Tables[i].Rows[0]["EmployeeName"].ToString();
                    }
                    using (XLWorkbook wb = new XLWorkbook())
                    {
                        foreach (DataTable dt in ds.Tables)
                        {
                            //Add DataTable as Worksheet.
                            wb.Worksheets.Add(dt);
                        }

                        //Export the Excel file.
                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename="+ hdnhub.Value + "HubEmpAttendanceSheet.xlsx");
                        using (MemoryStream MyMemoryStream = new MemoryStream())
                        {
                            wb.SaveAs(MyMemoryStream);
                            MyMemoryStream.WriteTo(Response.OutputStream);
                            Response.Flush();
                            Response.End();
                        }
                    }
                    }

                }


            }


        }
    }
}