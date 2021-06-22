using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Attendance
    {
        public string employeecode { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public int january { get; set; }
        public int february { get; set; }
        public int march { get; set; }
        public int april { get; set; }
        public int may { get; set; }
        public int june { get; set; }
        public int july { get; set; }
        public int august { get; set; }
        public int september { get; set; }
        public int october { get; set; }
        public int november { get; set; }
        public int december { get; set; }
    }

    public class DailyAttendanceLog
    {
        public string employeecode { get; set; }
        public DateTime loggeddate { get; set; }
        public bool status { get; set; }
    }
}
