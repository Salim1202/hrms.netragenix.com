using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Document
    {
        public string documentname { get; set; }
        public string documenttype { get; set; }

        public string documentextension { get; set; }
        public DateTime uploadeddate { get; set; }
        public string departmentname { get; set; }
        public string employeecode { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }

        public byte[] uploadfile { get; set; }
    }

    public class DocumentLog
    {
        public string documentname { get; set; }
        public string documenttype { get; set; }

        public string documentextension { get; set; }
        public DateTime uploadeddate { get; set; }
        public int departmentid { get; set; }
        public int uploadedby { get; set; }
        public int createdby { get; set; }

        public byte[] uploadfile { get; set; }
    }
}
