using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Message
    {
        public int messageid { get; set; }
        public int sentto { get; set; }
        public string senttoemployeecode { get; set; }
        public string senttofirstname { get; set; }
        public string senttolastname { get; set; }
        public string messagecontents { get; set; }
        public DateTime sentdate { get; set; }
        public int sentby { get; set; }

        public bool isRead { get; set; }
        public string sentbyemployeecode { get; set; }
        public string sentbyfirstname { get; set; }
        public string sentbylastname { get; set; }
    }

    public class MessageCreate
    {
        public string employeecode { get; set; }
        public int sentto { get; set; }
        public string messagecontents { get; set; }
        public DateTime sentdate { get; set; }
        public int sentby { get; set; }
        public bool isRead { get; set; }
    }
}
