using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class BusinessDeskBL
    {
        BusinessDeskDB businessDeskDB = new BusinessDeskDB();
        public string GetBusinessDeskEmployees()
        {
            string BusinessDeskEmployeesString = string.Empty;
            List<BusinessDeskEmployees> businessDeskEmployeesList = businessDeskDB.GetBusinessDeskEmployees();

            foreach (var businessDeskEmployees in businessDeskEmployeesList)
            {
                BusinessDeskEmployeesString += "<tr>";
                BusinessDeskEmployeesString += "<td>" + businessDeskEmployees.employeecode + "</td>";
                BusinessDeskEmployeesString += "<td>" + businessDeskEmployees.firstname + " " + businessDeskEmployees.lastname + "</td>";
                BusinessDeskEmployeesString += "<td>" + businessDeskEmployees.positionname + "</td>";
                BusinessDeskEmployeesString += "<td>" + businessDeskEmployees.departmentname + "</td>";
                BusinessDeskEmployeesString += "<td><span class='text-success'>" + businessDeskEmployees.status + "</span></td>";
                BusinessDeskEmployeesString += "</tr>";
            }

            return BusinessDeskEmployeesString; 
        }
    }
}
