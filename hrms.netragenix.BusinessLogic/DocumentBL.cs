using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class DocumentBL
    {
        DocumentDB documentDB = new DocumentDB();
        

        public string GetDocumentDetails()
        {
            string DocumentString = string.Empty;
            List<Document> documentList = documentDB.GetDocumentDetails();

            foreach (var document in documentList)
            {
                DocumentString += "<tr>";
                DocumentString += "<td>" + document.documentname + "</td>";                                
                DocumentString += "<td>" + document.documenttype + "</td>";
                DocumentString += "<td>" + document.uploadeddate + "</td>";
                DocumentString += "<td>" + document.employeecode + "</td>";
                DocumentString += "<td>" + document.firstname + " " + document.lastname + "</td>";
                DocumentString += "<td>" + document.departmentname + "</td>";
                DocumentString += "<td><a href='documents/" + document.documentname + document.documentextension + "'>" + document.documentname + document.documentextension +  "</a></td>";                
                DocumentString += "</tr>";
            }

            return DocumentString;
        }

        public void LogDocument(DocumentLog documentLog)
        {
            documentDB.LogDocuments(documentLog);
        }
    }
}
