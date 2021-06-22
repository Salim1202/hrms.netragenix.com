using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Recruitment
    {
        public string candidatename { get; set; }
        public DateTime interviewdate { get; set; }
        public DateTime confirmationdate { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string status { get; set; }
    }

    public class LogRecruitment
    {
        public string candidatename { get; set; }
        public DateTime interviewdate { get; set; }
        public DateTime confirmationdate { get; set; }
        public int takenby { get; set; }
        public string status { get; set; }
        public int createdby { get; set; }
    }
}
