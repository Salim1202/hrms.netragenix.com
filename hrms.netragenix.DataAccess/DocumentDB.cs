using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using hrms.netragenix.BusinessEntities;
using System.IO;
using System.Web;
using System.Net.Http;

namespace hrms.netragenix.DataAccess
{
    public class DocumentDB
    {
        CommonDB commonDB = new CommonDB();
        private object HttpUtility;
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());
        private readonly object uploadedby;

        public object Response { get; private set; }

        public List<Document> GetDocumentDetails()
        {
            List<Document> documentList = new List<Document>();
            SqlDataReader sqlDataReaderDocument = commonDB.getDataReaderFromSQL("SELECT * FROM vwGetDocumentDetails");
            
            if (sqlDataReaderDocument.HasRows)
            {
                while (sqlDataReaderDocument.Read())
                {
                    Document document = new Document();

                    document.documentname = sqlDataReaderDocument.GetString(0);
                    document.documenttype = sqlDataReaderDocument.GetString(1);
                    document.documentextension = sqlDataReaderDocument.GetString(2);
                    document.uploadeddate = sqlDataReaderDocument.GetDateTime(3);
                    document.departmentname = sqlDataReaderDocument.GetString(4);
                    document.employeecode = sqlDataReaderDocument.GetString(5);
                    document.firstname = sqlDataReaderDocument.GetString(6);
                    document.lastname = sqlDataReaderDocument.GetString(7);
                    document.uploadfile = (byte[])sqlDataReaderDocument.GetValue(11);
                    //System.IO.File.WriteAllBytes("D:\\hrms.netragenix.com\\hrms.netragenix.Web.UI\\documents\\"+ document.documentname + document.documentextension, document.uploadfile);
                    //System.IO.File.WriteAllBytes(System.Web.Hosting.HostingEnvironment.MapPath(Path.Combine("~/documents/" + document.documentname + document.documentextension)), document.uploadfile);
                    //System.IO.File.WriteAllBytes(HttpContext.Current.Server.MapPath("~/documents/" + document.documentname + document.documentextension), document.uploadfile);

                    documentList.Add(document);
                }
                
            }

            return documentList;
        }

        public void LogDocuments(DocumentLog documentLog)
        {           

            SqlCommand cmdDocument = new SqlCommand("spLogDocuments", sqlConnection);
            cmdDocument.CommandType = CommandType.StoredProcedure;

            cmdDocument.Parameters.AddWithValue("@documentname", documentLog.documentname);
            cmdDocument.Parameters.AddWithValue("@documenttype", documentLog.documenttype);
            cmdDocument.Parameters.AddWithValue("@documentextension", documentLog.documentextension);
            cmdDocument.Parameters.AddWithValue("@uploadeddate", documentLog.uploadeddate);
            cmdDocument.Parameters.AddWithValue("@uploadedby", documentLog.uploadedby);
            cmdDocument.Parameters.AddWithValue("@uploadfile", documentLog.uploadfile);
            cmdDocument.Parameters.AddWithValue("@departmentid", documentLog.departmentid);
            cmdDocument.Parameters.AddWithValue("@createdby", documentLog.createdby);
            
            
            sqlConnection.Open();
            cmdDocument.ExecuteReader();
            //cmdDocument.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}
