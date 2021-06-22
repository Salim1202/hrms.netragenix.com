using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace hrms.netragenix.BusinessLogic
{
    public class PayrollBL
    {
        AttendanceDB leave = new AttendanceDB();        
        
        PayrollDB payrollDB = new PayrollDB();
        //SalaryStructure salaryDB = new SalaryStructure();
        public string GetPayrollDetails(string UserType, int EmployeeID)
        {            
            string PayrollString = string.Empty;          
            List<Payroll> payrollList = payrollDB.MonthlySalaryLeave(UserType, EmployeeID);
            
            foreach (var payroll in payrollList) 
            {                
                    PayrollString += "<tr>";
                    PayrollString += "<td>" + payroll.employeecode + "</td>";
                    PayrollString += "<td>" + payroll.firstname + " " + payroll.lastname + "</td>";
                    PayrollString += "<td>" + payroll.MONTH + "</td>";
                    PayrollString += "<td>" + payroll.Year + "</td>";
                    PayrollString += "<td>" + payroll.LEAVES + "</td>";
                    PayrollString += "<td>" + payroll.grosssalary + "</td>";
                    PayrollString += "<td>" + payroll.netsalary + "</td>";
                    //PayrollString += "<td>" + payroll.NetSalary + "</td>";
                    PayrollString += "<td>" + payroll.basic + "</td>";
                    PayrollString += "<td>" + payroll.pf + "</td>";
                    PayrollString += "<td>" + payroll.da + "</td>";
                    PayrollString += "<td>" + payroll.hra + "</td>";
                    PayrollString += "</tr>";
            }

            return PayrollString;
        }
        
        public void LogPayroll(LogPayroll logPayroll)
        {
            payrollDB.LogPayroll(logPayroll);
        }

        public string GetSalaryStructureValues()
        {
            SalaryStructure salarystructure = new SalaryStructure();
            List<SalaryStructure> SalaryStructureString = new List<SalaryStructure>();

            DataTable dt = new DataTable();
            //dt = payrollDB.BindSalaryStructureValues(); //commented coz of payrolldb file corrupted issue

            //List<SalaryStructure> salaryStructureList = payrollDB.BindSalaryStructureValues();
            String salary = string.Empty;
            List<SalaryStructure> salstr = new List<SalaryStructure>();
            //foreach (SalaryStructure salarylist in salaryStructureList)
            //{                
            //    //salarystructure = salarylist.salarystructurevalue;
            //    //SalaryStructureString += "<tr>";
            //    //SalaryStructureString += "<td>" + salarystructure.salarystructurename + "</td>";
            //    //SalaryStructureString += "<td>" + salarystructure.salarystructurevalue +"</td>";
            //    //SalaryStructureString += "<td>" + salarystructure.minvalue + "</td>";
            //    //SalaryStructureString += "<td>" + salarystructure.maxvalue + "</td>";
            //    //SalaryStructureString += "</tr>";
            //    //SalaryStructureString.Add();


            //    //SalaryStructureString.Add(salarylist.salarystructurevalue);
            //}

            return salary.ToString(); 
        }
    }
}
