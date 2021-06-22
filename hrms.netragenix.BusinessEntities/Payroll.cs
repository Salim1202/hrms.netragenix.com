using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Payroll
    {
        public string employeecode { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        //public int january { get; set; }
        //public int february { get; set; }
        //public int march { get; set; }
        //public int april { get; set; }
        //public int may { get; set; }
        //public int june { get; set; }
        //public int july { get; set; }
        //public int august { get; set; }
        //public int september { get; set; }
        //public int october { get; set; }
        //public int november { get; set; }
        //public int december { get; set; }

        public double basic { get; set; }

        public double hra { get; set; }

        public double da { get; set; }

        public double pf { get; set; }
        public double grosssalary { get; set; }
        public double netsalary { get; set; }
        public string status { get; set; }

        public string MONTH { get; set; }

        public double Year { get; set; }

        public int LEAVES { get; set; }

        public double SalaryAfterDeductions { get; set; }

        public double NetSalary { get; set; }


    }


    public class LogPayroll
    {
        public string employeecode { get; set; }
        public double grosssalary { get; set; }
        public double netsalary { get; set; }        
        public string status { get; set; }
        
    }
}
