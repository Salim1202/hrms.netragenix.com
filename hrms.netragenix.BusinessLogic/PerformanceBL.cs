using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class PerformanceBL
    {
        PerformanceDB performanceDB = new PerformanceDB();
        public string GetPerformanceDetails(string UserType, int EmployeeID)
        {
            string PerformanceString = string.Empty;
            List<Performance> performanceList = performanceDB.GetPerformanceDetails(UserType, EmployeeID);

            foreach (var performance in performanceList)
            {
                PerformanceString += "<tr>";
                PerformanceString += "<td>" + performance.employeecode + "</td>";
                PerformanceString += "<td>" + performance.firstname + " " + performance.lastname + "</td>";
                PerformanceString += "<td>" + performance.communication + "</td>";
                PerformanceString += "<td>" + performance.conflictresolution + "</td>";
                PerformanceString += "<td>" + performance.planning + "</td>";
                PerformanceString += "<td>" + performance.problemsolving + "</td>";
                PerformanceString += "<td>" + performance.management + "</td>";
                PerformanceString += "</tr>";
            }

            return PerformanceString;
        }

        public void LogPerformance(PerformanceLog performanceLog)
        {
            performanceDB.LogPerformance(performanceLog);
        }
    }
}
