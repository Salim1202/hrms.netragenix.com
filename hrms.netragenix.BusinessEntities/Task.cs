using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Task
    {
        public int taskid { get; set; }
        public string taskname { get; set; }
        public DateTime createdon { get; set; }
        public int createdby { get; set; }
        public string createdbyemployeecode { get; set; }
        public string createdbyfirstname { get; set; }
        public string createdbylastname { get; set; }
        public int assignedto { get; set; }
        public string assignedtoemployeecode { get; set; }
        public string assignedtofirstname { get; set; }
        public string assignedtolastname { get; set; }
        public string status { get; set; }

        public bool isRead { get; set; }
    }

    public class TaskCreate
    {
        public string employeecode { get; set; }
        public string taskname { get; set; }
        public DateTime createdon { get; set; }
        public int createdby { get; set; }
        public int assignedto { get; set; }

        public bool isRead { get; set; }
        public string status { get; set; }
    }
}
