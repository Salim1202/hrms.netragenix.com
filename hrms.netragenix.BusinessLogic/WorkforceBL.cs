using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class WorkforceBL
    {
        WorkforceDB workforceDB = new WorkforceDB();
        public string GetWorkforceEmployees()
        {
            string WorkforceEmployeesString = string.Empty;
            List<WorkforceEmployees> workforceEmployeesList = workforceDB.GetWorkforceEmployees();

            foreach (var workforceEmployees in workforceEmployeesList)
            {
                WorkforceEmployeesString += "<tr>";
                WorkforceEmployeesString += "<td>" + workforceEmployees.employeecode + "</td>";
                WorkforceEmployeesString += "<td>" + workforceEmployees.firstname + " " + workforceEmployees.lastname + "</td>";
                WorkforceEmployeesString += "<td>" + workforceEmployees.positionname + "</td>";
                WorkforceEmployeesString += "<td>" + workforceEmployees.departmentname + "</td>";
                WorkforceEmployeesString += "<td><span class='text-success'>" + workforceEmployees.status + "</span></td>";
                WorkforceEmployeesString += "</tr>";
            }

            return WorkforceEmployeesString;
        }

        public List<WorkforceEmployees> GetWorkforceEmployeesDropdown()
        {
            return workforceDB.GetWorkforceEmployees();
        }

        public Employees GetWorkforceEmployeesRawData(string EmployeeCode)
        {
            return workforceDB.GetWorkforceEmployeesRawData(EmployeeCode);
        }

        public void InsertWorkforceEmployees(Employees employees)
        {
            workforceDB.InsertWorkforceEmployees(employees);
        }

        public void UpdateWorkforceEmployees(Employees employees)
        {
            workforceDB.UpdateWorkforceEmployees(employees);
        }

        public void RemoveWorkforceEmployees(Employees employees)
        {
            workforceDB.RemoveWorkforceEmployees(employees);
        }
    }
}
