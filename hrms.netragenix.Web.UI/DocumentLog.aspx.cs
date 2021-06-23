using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using System;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Web;

namespace hrms.netragenix.Web.UI
{
    public partial class DocumentLog : System.Web.UI.Page
    {
        protected System.Web.UI.HtmlControls.HtmlInputFile File1;
        protected System.Web.UI.HtmlControls.HtmlInputButton Submit1;
        AttendanceBL attendanceBL = new AttendanceBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        LeaveBL leaveBL = new LeaveBL();
        WorkforceBL workforceBL = new WorkforceBL();
        PerformanceBL performanceBL = new PerformanceBL();
        DocumentBL documentBL = new DocumentBL();
        TrainingBL trainingBL = new TrainingBL();
        Document document = new Document();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());


        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {//changes done line nos .- 70, 111
            //if (!Regex.Match(txtDocumentName.Text, @"^[a-zA-Z0-9]+$").Success)
            //{
            //    // first name was incorrect  
            //    lblDocumentNameValidation.Text = "Special characters and spaces are not allowed in Document Name Textbox";
            //    lblDocumentNameValidation.ForeColor = System.Drawing.Color.Red;
            //    txtDocumentName.Focus();
            //    return;
            //}            
            //UploadFtpFile("documents", filename);
            string filename = Path.GetFileName(fuUploadFiles.PostedFile.FileName);
            filename.Replace(" ", "");
            //filename=Path.ChangeExtension(filename,null);
            //get extension from here thorugh GetExtension method also ther must not be space between two words in filename
            string extension = Path.GetExtension(filename);
            string contentType = fuUploadFiles.PostedFile.ContentType;

            using (Stream fs = fuUploadFiles.PostedFile.InputStream)
            {
                using (BinaryReader br = new BinaryReader(fs))
                {
                    byte[] bytes = br.ReadBytes((Int32)fs.Length);

                    hrms.netragenix.BusinessEntities.DocumentLog documentLog = new hrms.netragenix.BusinessEntities.DocumentLog();
                    //documentLog.documentname = txtDocumentName.Text.Replace(" ", "");
                    //documentLog.documentname = Regex.Replace(txtDocumentName.Text, @"\s", "");
                    documentLog.documentname = txtDocumentName.Text;
                    documentLog.documenttype = extension;
                    //documentLog.documenttype = ddlDocumentType.SelectedValue;
                    //documentLog.documenttype ="A" +ddlDocumentType.SelectedValue;
                    documentLog.documentextension = extension;
                    documentLog.uploadeddate = Convert.ToDateTime(txtUploadedDate.Text);
                    documentLog.uploadedby = 4;
                    //write for uploadedby also
                    documentLog.departmentid = Convert.ToInt32(ddlDepartment.SelectedValue);
                    documentLog.createdby = authentication.employeeid;
                    documentLog.uploadfile = bytes;
                    //documentLog.uploadfile = System.Text.Encoding.UTF8.GetBytes(bytes.ToString());
                    System.IO.File.WriteAllBytes(HttpContext.Current.Server.MapPath("~/documents/" + documentLog.documentname + documentLog.documentextension), documentLog.uploadfile);
                    documentBL.LogDocument(documentLog);

                    Response.Redirect("DocumentManagement.aspx");
                }
            }
        }
    }
}

//public void UploadFtpFile(string folderName, string fileName)
//{
//    System.Net.FtpWebRequest request;

//    string ftpfolderName;
//    string ftpfileName;
//    string absoluteFileName = Path.GetFileName(fileName);

//    request = WebRequest.Create(new Uri(string.Format(@"ftp://hrms.shreeganeshcourier.com/documents/", folderName, absoluteFileName))) as FtpWebRequest;
//    request.Method = WebRequestMethods.Ftp.UploadFile;
//    request.UseBinary = Convert.ToBoolean(1);
//    request.UsePassive = Convert.ToBoolean(1);
//    request.KeepAlive = Convert.ToBoolean(1);
//    request.Credentials = new NetworkCredential("hrms", "I2uy89&q");
//    request.ConnectionGroupName = "group";


//    string filename = Path.GetFileName(fuUploadFiles.PostedFile.FileName);
//    filename.Replace(" ", "");
//    //get extension from here thorugh GetExtension method also ther must not be space between two words in filename
//    string extension = Path.GetExtension(filename);
//    string contentType = fuUploadFiles.PostedFile.ContentType;
//    using (FileStream fs = File.OpenRead(fileName))
//    {
//        using (BinaryReader br = new BinaryReader(fs))
//        {
//            byte[] bytes = br.ReadBytes((Int32)fs.Length);                    
//            fs.Read(bytes, 0, bytes.Length);
//            fs.Close();
//            Stream requestStream = request.GetRequestStream();
//            requestStream.Write(bytes, 0, bytes.Length);
//            requestStream.Flush();
//            requestStream.Close();

//            hrms.netragenix.BusinessEntities.DocumentLog documentLog = new hrms.netragenix.BusinessEntities.DocumentLog();

//            documentLog.documentname = Regex.Replace(txtDocumentName.Text, @"\s", "");
//            documentLog.documenttype = extension;                    
//            documentLog.documentextension = extension;
//            documentLog.uploadeddate = Convert.ToDateTime(txtUploadedDate.Text);
//            documentLog.uploadedby = 4;
//            //write for uploadedby also
//            documentLog.departmentid = Convert.ToInt32(ddlDepartment.SelectedValue);
//            documentLog.createdby = authentication.employeeid;
//            documentLog.uploadfile = bytes;

//            documentBL.LogDocument(documentLog);

//            Response.Redirect("DocumentManagement.aspx");                    
//        }
//    }
//}


//byte[] buffer = new byte[fs.Length];
//fs.Read(buffer, 0, buffer.Length);
//fs.Close();
//Stream requestStream = request.GetRequestStream();
//requestStream.Write(buffer, 0, buffer.Length);
//requestStream.Flush();
//requestStream.Close();