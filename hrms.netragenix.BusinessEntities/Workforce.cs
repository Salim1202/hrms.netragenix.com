using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace hrms.netragenix.BusinessEntities
{
    public class Workforce
    {

    }

    public class WorkforceEmployees
    {
        public int employeeid { get; set; }
        public string employeecode { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string departmentname { get; set; }
        public string positionname { get; set; }
        public string status { get; set; }
    }

    public class Employees
    {
        public string employeecode { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public DateTime dateofbirth { get; set; }
        public DateTime joiningdate { get; set; }
        public string mobile { get; set; }
        public string emailid { get; set; }
        public string gender { get; set; }
        public string maritalstatus { get; set; }
        public string employeetype { get; set; }
        public int departmentid { get; set; }
        public int positionid { get; set; }
        public string imagename { get; set; }
        public string username { get; set; }
        public string password { get; set; }
        public string usertype { get; set; }
        public string address { get; set; }
        public string status { get; set; }
        public bool isactive { get; set; }
        public bool isdeleted { get; set; }
        public int createdby { get; set; }
        public DateTime createddate { get; set; }
    }
}
