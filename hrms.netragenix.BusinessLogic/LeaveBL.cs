using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class LeaveBL
    {
        LeaveDB leaveDB = new LeaveDB();
        public string GetBusinessDeskLeaveDetails(string UserType, int EmployeeID)
        {
            string LeaveString = string.Empty;
            List<Leave> leaveList = leaveDB.GetLeaveDetails(UserType, EmployeeID);

            foreach (var leave in leaveList)
            {
                if (UserType == "Administrator")
                {
                    LeaveString += "<tr>";
                    LeaveString += "<td>" + leave.appliedon + "</td>";
                    LeaveString += "<td>" + leave.firstname + " " + leave.lastname + "</td>";
                    LeaveString += "<td>" + leave.leavefrom + "</td>";
                    LeaveString += "<td>" + leave.leaveto + "</td>";
                    LeaveString += "<td>" + leave.status + "</td>";
                    LeaveString += "<td><a href='BusinessDeskManagement.aspx?LeaveID=" + leave.leaveid + "'>Approve</a></td>";
                    LeaveString += "</tr>";
                }
                else
                {
                    LeaveString += "<tr>";
                    LeaveString += "<td>" + leave.appliedon + "</td>";
                    LeaveString += "<td>" + leave.firstname + " " + leave.lastname + "</td>";
                    LeaveString += "<td>" + leave.leavefrom + "</td>";
                    LeaveString += "<td>" + leave.leaveto + "</td>";
                    LeaveString += "<td>" + leave.status + "</td>";
                    LeaveString += "</tr>";
                }
            }

            return LeaveString;
        }

        public string GetBusinessDeskLeaveHeaders(string UserType)
        {
            string LeaveString = string.Empty;

            if (UserType == "Administrator")
            {
                LeaveString += "<tr>";
                LeaveString += "<th>Leave Applied On</th>";
                LeaveString += "<th>Applied By</th>";
                LeaveString += "<th>Leave From</th>";
                LeaveString += "<th>Leave To</th>";
                LeaveString += "<th>Status</th>";
                LeaveString += "<th>Action</th>";
                LeaveString += "</tr>";
            }
            else
            {
                LeaveString += "<tr>";
                LeaveString += "<th>Leave Applied On</th>";
                LeaveString += "<th>Applied By</th>";
                LeaveString += "<th>Leave From</th>";
                LeaveString += "<th>Leave To</th>";
                LeaveString += "<th>Status</th>";
                LeaveString += "</tr>";
            }

            return LeaveString;
        }

        public void ApproveLeave(int LeaveID)
        {
            leaveDB.ApproveLeave(LeaveID);
        }

        public void ApplyLeave(Leave leave, string Reason)
        {
            leaveDB.ApplyLeave(leave,Reason);
        }
    }
}
