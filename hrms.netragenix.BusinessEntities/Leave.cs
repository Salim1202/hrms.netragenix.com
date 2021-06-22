using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Leave
    {
        public int leaveid { get; set; }
        public DateTime appliedon { get; set; }
        public string employeecode { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public DateTime leavefrom { get; set; }
        public DateTime leaveto { get; set; }
        public string status { get; set; }
        public int employeeid { get; set; }
    }
}
