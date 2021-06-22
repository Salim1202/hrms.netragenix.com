using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Training
    {
        public string employeecode { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public DateTime trainingdate { get; set; }
        public DateTime scheduledate { get; set; }
        public string particulars { get; set; }
        public string raisedbyfirstname { get; set; }
        public string raisedbylastname { get; set; }
    }

    public class TrainingLog
    {
        public DateTime trainingdate { get; set; }
        public DateTime scheduledate { get; set; }
        public string particulars { get; set; }
        public int raisedby { get; set; }
        public int employeeid { get; set; }
        public int createdby { get; set; }
        public string employeecode { get; set; }
    }
}
