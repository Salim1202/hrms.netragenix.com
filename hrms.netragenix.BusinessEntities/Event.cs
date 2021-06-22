using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Event
    {
        public int eventid { get; set; }
        public string eventname { get; set; }
        public string eventdescription { get; set; }

        public bool isRead { get; set; }
        public string departmentname { get; set; }
        public DateTime scheduleon { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
    }

    public class EventCreate
    {
        public string eventname { get; set; }
        public string eventdescription { get; set; }

        public bool isRead { get; set; }
        public int createdby { get; set; }
        public DateTime scheduledon { get; set; }
    }
}
