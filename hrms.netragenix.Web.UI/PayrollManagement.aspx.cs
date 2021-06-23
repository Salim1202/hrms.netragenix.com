using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using CrystalDecisions.Web;
using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using hrms.netragenix.DataAccess;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
//using System.Drawing;
using System.IO;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace hrms.netragenix.Web.UI
{
    [ComVisible(false)]
    public partial class PayrollManagement : System.Web.UI.Page
    {
        PayrollBL payrollBL = new PayrollBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        ReportDocument rprt = new ReportDocument();
        WorkforceDB workforcedb = new WorkforceDB();

        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");


            BindEmployeeDropdown();
            //spGetAllEmployee
            if (authentication.usertype == "Administrator")
            {
                ddlEmployeeCode.Visible = true;
            }
            else
            {
                ddlEmployeeCode.Visible = false;
            }
        }

        protected void Page_Init(object sender, EventArgs e)
        {

            if (Session["report"] != null)
            {
                SalarySlipViewer.ReportSource = (CrystalReportViewer)Session["report"];
            }
        }

        private void BindEmployeeDropdown()
        {
            List<WorkforceEmployees> listemployees = new List<WorkforceEmployees>();
            listemployees = workforcedb.GetAllEmployees();
            ddlEmployeeCode.DataSource = listemployees;

            ddlEmployeeCode.DataTextField = "employeecode";
            ddlEmployeeCode.DataValueField = "employeeid";
            ddlEmployeeCode.DataBind();
            //ddlEmployeeCode.Items.Insert(0, new System.Web.UI.WebControls.ListItem("--Select--", ""));
        }

        public string getPayrollDetails()
        {
            return payrollBL.GetPayrollDetails(authentication.usertype, authentication.employeeid);
        }

        public string getUserName()
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            return authentication.firstname;
        }

        public string getImageName()
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            return authentication.imagename;
        }

        public string getTopEventDetails()
        {
            return eventBL.GetTopEventDetails();
        }

        public string getTopMessageDetails()
        {
            return messageBL.GetTopMessageDetails(authentication.usertype, authentication.employeeid);
        }

        public string getTopTaskDetails()
        {
            return taskBL.GetTopTaskDetails(authentication.usertype, authentication.employeeid);
        }


        private DataTable GetData(int appliedby)

        {

            DataTable getdt = new DataTable();

            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlDataAdapter sda = new SqlDataAdapter();
            SqlCommand cmd = new SqlCommand("spPdfDownload", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@appliedby", appliedby);

            try
            {

                con.Open();

                sda.SelectCommand = cmd;

                sda.Fill(getdt);

                return getdt;

            }

            catch (Exception ex)

            {

                throw ex;

            }

            finally

            {

                con.Close();

                sda.Dispose();

                con.Dispose();

            }

        }

        protected void btnPDFDownload_Click(object sender, EventArgs e)
        {
            DataTable query = GetData(authentication.employeeid);
            //string strQuery = "sptest";

            //SqlCommand cmd = new SqlCommand(query);

            DataTable dt = query;
            //DataTable dt = GetData(query);        

            ////Create a dummy GridView

            GridView GridView1 = new GridView();

            GridView1.AllowPaging = false;

            GridView1.DataSource = dt;       ////try to uncomment the following pdf code and run

            GridView1.DataBind();

            StringWriter sw = new StringWriter();

            HtmlTextWriter hw = new HtmlTextWriter(sw);

            GridView1.RenderControl(hw);

            StringReader sr = new StringReader(sw.ToString());

            iTextSharp.text.Document pdfDoc = new iTextSharp.text.Document(PageSize.A4, 10f, 10f, 10f, 0f);


            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
            //new code here
            Phrase phrase = null;
            PdfPCell cell = null;
            PdfPTable table = null;
            //Color color = null;
            //end

            pdfDoc.Open();


            //new code here
            //Header Table
            table = new PdfPTable(2);
            table.TotalWidth = 500f;
            table.LockedWidth = true;
            table.SetWidths(new float[] { 0.3f, 0.7f });

            //Company Logo
            cell = ImageCell("~/images/logo.png", 8f, PdfPCell.ALIGN_CENTER);
            table.AddCell(cell);

            //Company Name and Address
            phrase = new Phrase();
            phrase.Add(new Chunk("ABC Infotech Services\n\n", FontFactory.GetFont("Arial", 16, Font.BOLD, BaseColor.RED)));
            phrase.Add(new Chunk("107, Park site,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
            phrase.Add(new Chunk("S V Road,\n", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
            phrase.Add(new Chunk("Dahisar(E), Mumbai:400068", FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)));
            cell = PhraseCell(phrase, PdfPCell.ALIGN_LEFT);
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            table.AddCell(cell);

            phrase = new Phrase(Environment.NewLine);
            cell = PhraseCell(phrase, PdfPCell.ALIGN_MIDDLE);
            table.AddCell(cell);

            string code = "NEN - 0001 - APR2018";
            table.AddCell(PhraseCell(new Phrase("Employee code:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(code, FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
            cell.Colspan = 2;
            cell.PaddingBottom = 10f;
            table.AddCell(cell);


            //phrase = new Phrase(Environment.NewLine);
            //cell = PhraseCell(phrase, PdfPCell.ALIGN_MIDDLE);
            //table.AddCell(cell);

            string joiningdate = "2018-01-01";
            table.AddCell(PhraseCell(new Phrase("Joining Date:", FontFactory.GetFont("Arial", 8, Font.BOLD, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            table.AddCell(PhraseCell(new Phrase(joiningdate, FontFactory.GetFont("Arial", 8, Font.NORMAL, BaseColor.BLACK)), PdfPCell.ALIGN_LEFT));
            cell = PhraseCell(new Phrase(), PdfPCell.ALIGN_CENTER);
            cell.Colspan = 2;
            cell.PaddingBottom = 10f;
            table.AddCell(cell);
            pdfDoc.Add(table);

            phrase = new Phrase(Environment.NewLine);
            cell = PhraseCell(phrase, PdfPCell.ALIGN_MIDDLE);
            table.AddCell(cell);
            //end


            XMLWorkerHelper.GetInstance().ParseXHtml(writer, pdfDoc, sr);

            pdfDoc.Close();

            Response.ContentType = "application/pdf";

            Response.AddHeader("content-disposition", "attachment;filename=SalarySlip.pdf");

            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            Response.Write(pdfDoc);

            Response.End();

        }

        private static PdfPCell PhraseCell(Phrase phrase, int align)
        {
            PdfPCell cell = new PdfPCell(phrase);
            cell.BorderColor = BaseColor.WHITE;
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 2f;
            cell.PaddingTop = 0f;
            return cell;
        }

        private static PdfPCell ImageCell(string path, float scale, int align)
        {
            iTextSharp.text.Image image = iTextSharp.text.Image.GetInstance(HttpContext.Current.Server.MapPath(path));
            image.ScalePercent(scale);
            PdfPCell cell = new PdfPCell(image);
            cell.BorderColor = BaseColor.WHITE;
            cell.VerticalAlignment = PdfPCell.ALIGN_TOP;
            cell.HorizontalAlignment = align;
            cell.PaddingBottom = 0f;
            cell.PaddingTop = 0f;
            return cell;
        }

        public string getGridMenu()
        {
            string CommonString = string.Empty;

            if (authentication.usertype == "Administrator")
            {
                CommonString += "<ul class='header-dropdown m-r--5'>";
                CommonString += "<li class='dropdown'><a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'><i class='zmdi zmdi-more-vert'></i></a>";
                CommonString += "<ul class='dropdown-menu pull-right'>";
                CommonString += "<li><a href='PayrollLog.aspx'>Log Payroll Details</a></li>";
                CommonString += "<li><a href='LogSalaryStructure.aspx'>Log Salary Structure</a></li>";
                CommonString += "<li><a href='LogSalaryStructureDetails.aspx'>Log Salary Structure Details</a></li>";
                CommonString += "</ul>";
                CommonString += "</li>";
                CommonString += "</ul>";
            }
            else
            {
                CommonString += "";
            }

            return CommonString;
        }

        [STAThread]
        protected void btnGenerateCrystalReport_Click(object sender, EventArgs e)
        {
            String strConnString = System.Configuration.ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);

            rprt.Load(Server.MapPath("~/MainReport.rpt"));
            rprt.FileName = Server.MapPath("~/MainReport.rpt");

            if (authentication.usertype == "Administrator")
            {

                SqlCommand cmd = new SqlCommand("spPdfDownload", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.SelectCommand = cmd;
                DataTable dt = new DataTable();
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@appliedby", authentication.employeeid);
                cmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue);
                cmd.Parameters.AddWithValue("@employeeid", ddlEmployeeCode.SelectedValue);
                sda.Fill(dt);

                ////sda.Fill(ds, "spPdfDownload");

                string query = "SELECT * FROM vwGetEmployeeDetails where employeeid=" + ddlEmployeeCode.SelectedValue;
                SqlCommand cmd1 = new SqlCommand(query, con);
                cmd1.CommandType = CommandType.Text;
                //cmd.CommandText = query;
                SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                sda1.SelectCommand = cmd1;
                DataTable dt1 = new DataTable();


                sda1.Fill(dt1);
                //con.Close();

                rprt.Subreports["EmployeeDetailsReport.rpt"].SetDataSource(dt1);
                rprt.Subreports["EmployeePayrollReport.rpt"].SetDataSource(dt);
            }

            else
            {
                SqlCommand cmd = new SqlCommand("spPdfDownload", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.SelectCommand = cmd;
                DataTable dt = new DataTable();
                cmd.CommandType = CommandType.StoredProcedure;
                //cmd.Parameters.AddWithValue("@appliedby", authentication.employeeid);
                cmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue);
                cmd.Parameters.AddWithValue("@employeeid", authentication.employeeid);
                sda.Fill(dt);



                string query = ("SELECT * FROM vwGetEmployeeDetails where employeeid=" + authentication.employeeid);
                SqlCommand cmd1 = new SqlCommand(query, con);
                cmd1.CommandType = CommandType.Text;
                SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                sda1.SelectCommand = cmd1;
                DataTable dt1 = new DataTable();


                sda1.Fill(dt1);


                rprt.Subreports["EmployeeDetailsReport.rpt"].SetDataSource(dt1);
                rprt.Subreports["EmployeePayrollReport.rpt"].SetDataSource(dt);
            }


            SalarySlipViewer.ReportSource = rprt;
            SalarySlipViewer.DataBind();

            pdfdemo();
        }

        public void pdfdemo()
        {
            string filepath;

            Response.Clear();
            filepath = Server.MapPath("~/" + "SalarySlip.pdf");
            rprt.ExportToDisk(ExportFormatType.PortableDocFormat, filepath);
            FileInfo fileinfo = new FileInfo(filepath);
            Response.AddHeader("Content-Disposition", "inline;filenam=demo.pdf");
            Response.ContentType = "application/pdf";
            Response.WriteFile(fileinfo.FullName);


            try
            {
                ExportOptions CrExportOptions;
                DiskFileDestinationOptions CrDiskFileDestinationOptions = new DiskFileDestinationOptions();
                PdfRtfWordFormatOptions CrFormatTypeOptions = new PdfRtfWordFormatOptions();
                CrDiskFileDestinationOptions.DiskFileName = "C:\\SalarySlip.pdf";
                CrExportOptions = rprt.ExportOptions;
                {
                    CrExportOptions.ExportDestinationType = ExportDestinationType.DiskFile;
                    CrExportOptions.ExportFormatType = ExportFormatType.PortableDocFormat;
                    CrExportOptions.DestinationOptions = CrDiskFileDestinationOptions;
                    CrExportOptions.FormatOptions = CrFormatTypeOptions;
                }
                rprt.Export();
            }
            catch (Exception ex)
            {
                //Response.Write("<script>alert(ex);</script>");
                //MessageBox.Show(ex.ToString());
            }

        }
    }

}

//sda.Fill(dt);
//sda1.Fill(dt1);

//SqlCommand cmd = new SqlCommand("spPdfDownload", con);
//con.Open();
//SqlDataAdapter sda = new SqlDataAdapter(cmd);
//sda.SelectCommand = cmd;
//DataTable dt = new DataTable();
//cmd.CommandType = CommandType.StoredProcedure;
//cmd.Parameters.AddWithValue("@appliedby", authentication.employeeid);
//cmd.Parameters.AddWithValue("@month", ddlMonth.SelectedValue);
//cmd.Parameters.AddWithValue("@employeecode", ddlEmployeeCode.SelectedValue);


//////sda.Fill(ds, "spPdfDownload");

//string query = "SELECT * FROM Employee where employeeid=" + authentication.employeeid ;
//SqlCommand cmd1 = new SqlCommand(query, con);
//cmd1.CommandType = CommandType.Text;
////cmd.CommandText = query;
//SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
//sda1.SelectCommand = cmd1;
//DataTable dt1 = new DataTable();

//sda.Fill(dt);
//sda1.Fill(dt1);
////con.Close();


//rprt.Subreports["EmployeeDetailsReport.rpt"].SetDataSource(dt1);
//rprt.Subreports["EmployeePayrollReport.rpt"].SetDataSource(dt);

//rprt.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Response, true, "MainReport.pdf");