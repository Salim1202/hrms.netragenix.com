using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class SalaryStructure
    {
        public int salaryid { get; set; }

        public double basic { get; set; }

        public double hra { get; set; }

        public double da { get; set; }

        public double transportallowance { get; set; }

        public double medicalexpenses { get; set; }

        public double telephoneexpenses { get; set; }

        public double foodcoupons { get; set; }

        public double giftvouchars { get; set; }

        public double lta { get; set; }

        public double flexipay { get; set; }

        public double pf { get; set; }

        public double incometax { get; set; }

        public double loan { get; set; }

        public double advances { get; set; }

        public string employeecode { get; set; }

        public int salarystructureid { get; set; }

        public string salarystructurename { get; set; }

        public double salarystructurevalue { get; set; }

        public double minvalue { get; set; }

        public double maxvalue { get; set; }



    }
}
