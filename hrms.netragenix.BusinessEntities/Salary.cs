using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Salary
    {
        public int salaryid { get; set; }

        public double BASIC { get; set; }

        public double DA { get; set; }

        public double HRA { get; set; }

        public double PF { get; set; }

        public double LTA { get; set; }

        public double Medical { get; set; }

        public double EmployeeStateInsurance { get; set; }

        public double ProfessionalTax { get; set; }       
    }
}
