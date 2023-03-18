using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Admin_ImportData : System.Web.UI.Page
    {
        string fileLocation = "";
        List<string> Errorlist = new List<string>();
        List<string> successList = new List<string>();
        List<string> FailedList = new List<string>(0);
        //List<string> FailedList_wrongstatus = new List<string>(0);
        DataTable dt_duplicatedata = new DataTable();
        DataTable dt_wrongstatus = new DataTable();
        DataTable dt_uploaded_sites = new DataTable();
        bool Errorfree;
        string innererrorstring;
        string innersuccessstring;
        string innerfailurestring;
        string innerfailurestring_wrongstatus;
        //Cookie cookievar = new Cookie();

        protected void Page_Load(object sender, EventArgs e)
        {
            //CookieManagement ck = new CookieManagement();
            //cookievar = ck.checkcookies();

            dt_duplicatedata.Columns.AddRange(new DataColumn[13]
            {

                 new DataColumn("EMP_CODE", typeof(string)),
                new DataColumn("F_NAME", typeof(string)),
                new DataColumn("M_NAME", typeof(string)),
                new DataColumn("L_NAME", typeof(string)),
                new DataColumn("GENDER", typeof(string)),
                new DataColumn("DOB", typeof(string)),
                new DataColumn("DOJ", typeof(string)),
                new DataColumn("EMAIL", typeof(string)),
                new DataColumn("EMAIL1", typeof(string)),
                new DataColumn("CONTACT", typeof(string)),
                new DataColumn("CONTACT1",typeof(string)),
                new DataColumn("ADDRESS", typeof(string)),
                new DataColumn("HUB", typeof(string)),


                //new DataColumn("LEAD_OWNER", typeof(string)),


            });
            dt_wrongstatus.Columns.AddRange(new DataColumn[13]
          {


                 new DataColumn("EMP_CODE", typeof(string)),
                new DataColumn("F_NAME", typeof(string)),
                new DataColumn("M_NAME", typeof(string)),
                new DataColumn("L_NAME", typeof(string)),
                new DataColumn("GENDER", typeof(string)),
                new DataColumn("DOB", typeof(string)),
                new DataColumn("DOJ", typeof(string)),
                new DataColumn("EMAIL", typeof(string)),
                new DataColumn("EMAIL1", typeof(string)),
                new DataColumn("CONTACT", typeof(string)),
                new DataColumn("CONTACT1",typeof(string)),
                new DataColumn("ADDRESS", typeof(string)),
                new DataColumn("HUB", typeof(string)),

              //new DataColumn("LEAD_OWNER", typeof(string)),


          });
            duplicatedsitewrapper.Visible = false;
            wrongsitewrapper.Visible = false;
        }


        protected void Check_Click(object sender, EventArgs e)
        {

            //lbl_leadsource.Text = Hiddenlead_text.Value.ToString();
            //lbl_catsource.Text = Hiddencat_text.Value.ToString();
            successlistdiv.InnerHtml = "";
            //wrongstatuslistdiv.InnerHtml = "";
            successcount.InnerHtml = "";
            failurecount.InnerHtml = "";
            //failurelistdiv.InnerHtml = "";
            errorcount.InnerHtml = "";
            errorListdiv.InnerHtml = "";
            try
            {
                //if File is not selected then return  
                if (FileUpload1.HasFile)
                {
                    string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);


                    //If file is not in excel format then return  
                    if (fileExtension != ".xls" && fileExtension != ".xlsx")
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>document.getElementById('error').style.display='block';document.getElementById('error').style.backgroundColor='#00BCD4';setTimeout(function() {$('#error').fadeOut('slow');}, 5000); </script>", false);
                        errorwrap.Text = "Select xls or xlsx file onlyss";


                    }
                    else
                    {

                        //Get the File name and create new path to save it on server  
                        fileLocation = Server.MapPath("sitexls\\") + FileUpload1.FileName;
                        FileUpload1.SaveAs(fileLocation);

                        //Create the QueryString for differnt version of fexcel file  
                        string strConn = "";
                        switch (fileExtension)
                        {
                            case ".xls": //Excel 1997-2003  
                                strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + fileLocation + ";Extended Properties=\"Excel 8.0;HDR=Yes;IMEX=1\"";
                                break;
                            //case ".csv": //Excel 1997-2003  
                            //    strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileLocation+ ";Extended Properties=\"Text;HDR=Yes;FORMAT=Delimited\"";
                            //    break;
                            case ".xlsx": //Excel 2007-2010  
                                strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + fileLocation + ";Extended Properties=\"Excel 12.0 xml;HDR=Yes;IMEX=1\"";
                                break;
                        }


                        //Get the data from the excel sheet1 which is default  
                        string query = "select * from  [Sheet1$] where EMP_CODE <> '' or EMP_CODE <> null  ";
                        OleDbConnection objConn;
                        OleDbDataAdapter oleDA;
                        //DataTable dt = new DataTable();

                        objConn = new OleDbConnection(strConn);
                        objConn.Open();
                        oleDA = new OleDbDataAdapter(query, objConn);

                        using (DataTable Uploadds = new DataTable())
                        {
                            oleDA.Fill(Uploadds);
                            objConn.Close();
                            oleDA.Dispose();
                            objConn.Dispose();

                            int excelrow = Uploadds.Rows.Count;
                            //int excelcolumn = Uploadds.Tables[0].Columns.Count;
                            // string columnName = Uploadds.Tables[0].Columns[14].ToString();
                            if (excelrow > 0)
                            {

                                System.Data.DataView view = new System.Data.DataView(Uploadds);
                                System.Data.DataTable selected =
                                       view.ToTable("selected", false, "EMP_CODE", "F_NAME", "M_NAME", "L_NAME", "GENDER", "DOB", "DOJ", "EMAIL", "EMAIL1", "CONTACT", "CONTACT1", "ADDRESS", "HUB");
                                //Bind the datatable to the Grid  
                                GridView1.DataSource = selected;
                                GridView1.DataBind();

                                bool Headersverified = VadlidateHeaders();

                                if (!Errorlist.Any())


                                {
                                    for (int i = 0; i < Uploadds.Rows.Count; i++)
                                    {

                                        string EMP_CODE = Uploadds.Rows[i]["EMP_CODE"].ToString();
                                        string F_NAME = Uploadds.Rows[i]["F_NAME"].ToString();
                                        string M_NAME = Uploadds.Rows[i]["M_NAME"].ToString();
                                        string L_NAME = Uploadds.Rows[i]["L_NAME"].ToString();
                                        string GENDER = Uploadds.Rows[i]["GENDER"].ToString();
                                        string DOB = Uploadds.Rows[i]["DOB"].ToString();
                                        string DOJ = Uploadds.Rows[i]["DOJ"].ToString();
                                        string EMAIL = Uploadds.Rows[i]["EMAIL"].ToString();
                                        string EMAIL1 = Uploadds.Rows[i]["EMAIL1"].ToString();
                                        string CONTACT = Uploadds.Rows[i]["CONTACT"].ToString();
                                        string CONTACT1 = Uploadds.Rows[i]["CONTACT1"].ToString();
                                        string ADDRESS = Uploadds.Rows[i]["ADDRESS"].ToString();
                                        string HUB = Uploadds.Rows[i]["HUB"].ToString();

                                        try
                                        {
                                            errorwrap.Text = "";
                                            //CookieManagement ck = new CookieManagement();
                                            //cookievar = ck.checkcookies();
                                            string code = "";


                                            DataSet ds1 = new DataSet();
                                            string str = ConfigurationManager.ConnectionStrings["AdminDB"].ToString();
                                            using (SqlConnection con = new SqlConnection(str))
                                            {


                                                using (SqlCommand cmdd = new SqlCommand("USP_USER_MANAGEMENT"))
                                                {
                                                    cmdd.CommandType = CommandType.StoredProcedure;
                                                    cmdd.Connection = con;
                                                    cmdd.Parameters.AddWithValue("@TYPE", "1");
                                                    cmdd.Parameters.AddWithValue("@EMP_CODE", EMP_CODE);
                                                    cmdd.Parameters.AddWithValue("@F_NAME", F_NAME);
                                                    cmdd.Parameters.AddWithValue("@M_NAME", M_NAME);
                                                    cmdd.Parameters.AddWithValue("@L_NAME", L_NAME);
                                                    cmdd.Parameters.AddWithValue("@GENDER", GENDER);
                                                    cmdd.Parameters.AddWithValue("@DOB", DOB);
                                                    cmdd.Parameters.AddWithValue("@DOJ", DOJ);
                                                    cmdd.Parameters.AddWithValue("@EMAIL", EMAIL);
                                                    cmdd.Parameters.AddWithValue("@EMAIL1", EMAIL1);
                                                    cmdd.Parameters.AddWithValue("@CONTACT", CONTACT);
                                                    cmdd.Parameters.AddWithValue("@CONTACT1", CONTACT1);
                                                    cmdd.Parameters.AddWithValue("@ADDRESS", ADDRESS);
                                                    cmdd.Parameters.AddWithValue("@HUB", HUB);
                                                    DataSet ds = new DataSet();
                                                    using (SqlDataAdapter sda = new SqlDataAdapter(cmdd))
                                                    {
                                                        sda.Fill(ds);
                                                    }

                                                    if (ds.Tables[0].Rows[0][0].ToString() == "0")
                                                    {
                                                        if (ds.Tables[1].Rows.Count > 0)
                                                        {
                                                            FailedList.Add("Employee :" + EMP_CODE + "  is already Exist.");

                                                            dt_duplicatedata.Rows.Add(
                                                                    EMP_CODE
                                                                   , F_NAME
                                                                   , M_NAME
                                                                   , L_NAME
                                                                   , GENDER
                                                                   , DOB
                                                                   , DOJ
                                                                   , EMAIL
                                                                   , EMAIL1
                                                                   , CONTACT
                                                                   , CONTACT1
                                                                   , ADDRESS
                                                                   , HUB

                                                                    );

                                                            GetnewData_duplicatedata(dt_duplicatedata);
                                                        }
                                                    }
                                                    else if (ds.Tables[0].Rows[0][0].ToString() == "1")
                                                    {
                                                        successList.Add("Employee with Emp Code  :" + EMP_CODE + " is uploaded Successfully");
                                                        dt_uploaded_sites.Rows.Add(
                                                                   EMP_CODE
                                                                   , F_NAME
                                                                   , M_NAME
                                                                   , L_NAME
                                                                   , GENDER
                                                                   , DOB
                                                                   , DOJ
                                                                   , EMAIL
                                                                   , EMAIL1
                                                                   , CONTACT
                                                                   , CONTACT1
                                                                   , ADDRESS
                                                                   , HUB
                                                                    );
                                                        GetnewData_UploadedSites(dt_uploaded_sites);
                                                    }
                                                    else
                                                    {
                                                        string StrErrorMsg = ds.Tables[0].Rows[0][0].ToString();
                                                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>document.getElementById('error').style.display='block';setTimeout(function() {$('#error').fadeOut('slow');}, 10000); </script>", false);
                                                        errorwrap.Text = StrErrorMsg;

                                                    }

                                                }



                                            }




                                        }

                                        catch (Exception ex)
                                        {
                                            string StrErrorMsg = ex.Message;
                                            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>document.getElementById('error').style.display='block';setTimeout(function() {$('#error').fadeOut('slow');}, 10000); </script>", false);
                                            errorwrap.Text = StrErrorMsg;

                                        }


                                    }
                                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>document.getElementById('error').style.display='block';setTimeout(function() {$('#error').fadeOut('slow');}, 10000); </script>", false);
                                    //errorwrap.Text = "Kindly Find Upload Status Below";

                                    Successdisplaydiv.Style.Add("display", "block");
                                    for (int j = 0; j < successList.Count; j++)
                                    {
                                        innersuccessstring += "<div class='successlable p-1' >" + successList[j] + "</div>";
                                    }
                                    for (int j = 0; j < FailedList.Count; j++)
                                    {
                                        innerfailurestring += "<div class='errorlable p-1'>" + FailedList[j] + "</div>";
                                    }

                                    //for (int j = 0; j < FailedList_wrongstatus.Count; j++)
                                    //{
                                    //    innerfailurestring_wrongstatus += "<div class='errorlable p-1'>" + FailedList_wrongstatus[j] + "</div>";
                                    //}
                                    //successlistdiv.InnerHtml = innersuccessstring;

                                    //wrongstatuslistdiv.InnerHtml = innerfailurestring_wrongstatus;
                                    successcount.InnerHtml = "Uploaded Successfully : <span id='spn_count_successList'class='p-3'>" + successList.Count + "</span>";
                                    failurecount.InnerHtml = "Not Uploaded : <span class='p-3'>" + FailedList.Count + "</span>";
                                    //failurecount_wrongstatus.InnerHtml = "<span class='p-3'>Not Uploaded(Wrong Status) : " + FailedList_wrongstatus.Count + "</span>";
                                    //:< span class='p-3'>Not Uploaded(Duplicate Employee Code) : " + FailedList.Count + "</span>"
                                    errordisplaydiv.InnerHtml = "";
                                    //Delete the excel file from the server  
                                    File.Delete(fileLocation);
                                }

                                else
                                {

                                    errordisplaydiv.Style.Add("display", "block");


                                    for (int j = 0; j < Errorlist.Count; j++)
                                    {
                                        innererrorstring += "<div class='errorlable'>* " + Errorlist[j] + "</div>";
                                    }

                                    errorcount.InnerHtml = "<span>" + Errorlist.Count + " </span>";
                                    errorListdiv.InnerHtml = innererrorstring;
                                }
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>document.getElementById('error').style.display='block';document.getElementById('error').style.backgroundColor='#00BCD4';setTimeout(function() {$('#error').fadeOut('slow');}, 5000); </script>", false);
                                errorwrap.Text = "Empty Excel Sheet !!";
                            }
                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>document.getElementById('error').style.display='block';document.getElementById('error').style.backgroundColor='#00BCD4';setTimeout(function() {$('#error').fadeOut('slow');}, 5000); </script>", false);
                    errorwrap.Text = "Please select File !!";

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>document.getElementById('error').style.display='block';setTimeout(function() {$('#error').fadeOut('slow');}, 20000); </script>", false);
               // errorwrap.Text = "Select valid xls file format. (Note:Click on DOWNLOAD EXAMPLE UPLOAD FORMAT) ";
            errorwrap.Text = ex.Message.ToString();

            ////lbl_error_test.Text = ex.ToString();
            //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>document.getElementById('error').style.display='block';document.getElementById('error').style.backgroundColor='#00BCD4';setTimeout(function() {$('#error').fadeOut('slow');}, 5000); </script>", false);

            //errorwrap.Text = ex.ToString() + "Select valid xls file format";
        }

    }
        public void GetnewData_UploadedSites(DataTable dt21)
        {


            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            try
            {

                DataTable copyDataTable;
                copyDataTable = dt21.Copy();
                GridView1.DataSource = dt21;
                GridView1.DataBind();
                duplicatedsitewrapper.Visible = true;



            }
            catch (Exception ex)
            {
                Console.Write(ex);

            }



        }
        public void GetnewData_duplicatedata(DataTable dt21)
        {


            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
            try
            {

                DataTable copyDataTable;
                copyDataTable = dt21.Copy();
                GridView3.DataSource = dt21;
                GridView3.DataBind();
                duplicatedsitewrapper.Visible = true;



            }
            catch (Exception ex)
            {
                Console.Write(ex);

            }



        }


        protected void btn_export(object sender, EventArgs e)
        {
            ExportGridToExcel();
        }
        private void ExportGridToExcel()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "Duplicated Entry" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView3.GridLines = GridLines.Both;
            GridView3.HeaderStyle.Font.Bold = true;
            GridView3.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }

        protected void btn_export_wrong_status(object sender, EventArgs e)
        {
            ExportGridToExcel_wrong_status();
        }
        private void ExportGridToExcel_wrong_status()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "WrongStatusLeads" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            //grd_wrong_sites_inserted.GridLines = GridLines.Both;
            //grd_wrong_sites_inserted.HeaderStyle.Font.Bold = true;
            //grd_wrong_sites_inserted.RenderControl(htmltextwrtter);
            Response.Write(strwritter.ToString());
            Response.End();

        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            return;
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                bool rowerror = false;
                int rownumber = e.Row.RowIndex;
                rownumber = rownumber + 1;

                DataRow row = ((DataRowView)e.Row.DataItem).Row;

                object LEADNAME = row.Field<object>("EMP_CODE");
                if (LEADNAME == null) { rowerror = true; Errorlist.Add("EMP_CODE is null at Row " + rownumber + ""); e.Row.Cells[0].BackColor = System.Drawing.Color.Salmon; }


                e.Row.BackColor = rowerror ? System.Drawing.Color.Yellow : System.Drawing.Color.White;
                Errorfree = rowerror ? false : true;
            }
        }


        public bool VadlidateHeaders()
        {

            if (GridView1.HeaderRow.Cells[0].Text != "EMP_CODE") { return false; }
            else if (GridView1.HeaderRow.Cells[1].Text != "F_NAME") { return false; }
            else if (GridView1.HeaderRow.Cells[2].Text != "M_NAME") { return false; }
            else if (GridView1.HeaderRow.Cells[3].Text != "L_NAME") { return false; }
            else if (GridView1.HeaderRow.Cells[4].Text != "GENDER") { return false; }
            else if (GridView1.HeaderRow.Cells[5].Text != "DOB") { return false; }
            else if (GridView1.HeaderRow.Cells[6].Text != "DOJ") { return false; }
            else if (GridView1.HeaderRow.Cells[7].Text != "EMAIL") { return false; }
            else if (GridView1.HeaderRow.Cells[8].Text != "EMAIL1") { return false; }
            else if (GridView1.HeaderRow.Cells[9].Text != "CONTACT") { return false; }
            else if (GridView1.HeaderRow.Cells[10].Text != "CONTACT1") { return false; }
            else if (GridView1.HeaderRow.Cells[11].Text != "ADDRESS") { return false; }
            else if (GridView1.HeaderRow.Cells[12].Text != "HUB") { return false; }

            else { return true; }
        }
        protected bool CheckDate(String date)

        {

            try

            {

                DateTime dt = DateTime.Parse(date);

                return true;
            }

            catch

            {

                return false;

            }

        }
        protected bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return true;
            }
            catch
            {
                return false;
            }
        }
        protected bool Ismobile(string mobile)
        {
            Regex re = new Regex(@"^\+[0-9]{2}\s+[0-9]{2}[0-9]{8}$");
            if (re.IsMatch(mobile))
            {
                return false;
            }
            {
                return true;
            }




        }
        protected bool Ispincode(string pincode)
        {
            Regex re = new Regex("^[0-9]{6}$");
            if (re.IsMatch(pincode)) { return false; }
            return true;
        }

    }