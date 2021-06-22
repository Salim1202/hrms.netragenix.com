using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Performance
    {
        public string employeecode { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public int communication { get; set; }
        public int conflictresolution { get; set; }
        public int planning { get; set; }
        public int problemsolving { get; set; }
        public int management { get; set; }
    }

    public class PerformanceLog
    {
        public int employeeid { get; set; }
        public string employeecode { get; set; }
        public int communication { get; set; }
        public int conflictresolution { get; set; }
        public int planning { get; set; }
        public int problemsolving { get; set; }
        public int management { get; set; }
    }
}
