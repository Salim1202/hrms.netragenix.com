using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Authentication
    {
        public int employeeid { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string usertype { get; set; }
        public string imagename { get; set; }
        public bool isactive { get; set; }
        public bool isdeleted { get; set; }
    }
}
