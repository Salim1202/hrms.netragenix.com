using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class TaskBL
    {
        TaskDB taskDB = new TaskDB();
        public string GetTaskDetails(string UserType, int EmployeeID)
        {
            string TaskString = string.Empty;
            List<BusinessEntities.Task> taskList = taskDB.GetTaskDetails(UserType, EmployeeID);

            foreach (var task in taskList)
            {
                if (UserType == "Administrator")
                {
                    TaskString += "<tr>";
                    TaskString += "<td>" + task.assignedtofirstname + " " + task.assignedtolastname + "</td>";
                    TaskString += "<td>" + task.taskname + "</td>";
                    TaskString += "<td>" + task.createdon + "</td>";
                    TaskString += "<td>" + task.createdbyfirstname + " " + task.createdbylastname + "</td>";
                    TaskString += "</tr>";
                }
                else
                {
                    TaskString += "<tr>";
                    TaskString += "<td>" + task.taskname + "</td>";
                    TaskString += "<td>" + task.createdon + "</td>";
                    TaskString += "<td>" + task.createdbyfirstname + " " + task.createdbylastname + "</td>";
                    TaskString += "</tr>";
                }
            }

            return TaskString;
        }

        public string GetTaskHeaders(string UserType)
        {
            string TaskString = string.Empty;

            if (UserType == "Administrator")
            {
                TaskString += "<tr>";
                TaskString += "<th>Assigned To</th>";
                TaskString += "<th>Task</th>";
                TaskString += "<th>Created On</th>";
                TaskString += "<th>Created By</th>";
                TaskString += "</tr>";
            }
            else
            {
                TaskString += "<tr>";
                TaskString += "<th>Task</th>";
                TaskString += "<th>Created On</th>";
                TaskString += "<th>Created By</th>";
                TaskString += "</tr>";
            }

            return TaskString;
        }

        public string GetTopTaskDetails(string UserType, int EmployeeID)
        {
            string TaskString = string.Empty;
            List<BusinessEntities.Task> taskList = taskDB.GetTaskDetails(UserType, EmployeeID);

            foreach (var task in taskList)
            {
                if (UserType == "Administrator")
                {
                    TaskString += "<li><a href='TaskManagement.aspx?taskid=" + task.taskid + "'>";
                    TaskString += "<div class='menu-info'>";
                    TaskString += "<h5>Created By : " + task.createdbyfirstname + " " + task.createdbylastname + " on " + task.createdon + "</h5>";
                    TaskString += "<p class='ellipsis'>" + task.taskname + "</p>";
                    TaskString += "<h5>Assigned To : " + task.assignedtofirstname + " " + task.assignedtolastname + "</h5>";
                    TaskString += "</div>";
                    TaskString += "</a></li>";
                }
                else
                {
                    TaskString += "<li><a href='TaskManagement.aspx?taskid=" + task.taskid + "'>";
                    TaskString += "<div class='menu-info'>";
                    TaskString += "<h5>Created By : " + task.createdbyfirstname + " " + task.createdbylastname + " on " + task.createdon + "</h5>";
                    TaskString += "<p class='ellipsis'>" + task.taskname + "</p>";
                    TaskString += "</div>";
                    TaskString += "</a></li>";
                }
            }

            return TaskString;
        }

        public void InsertTask(TaskCreate taskCreate)
        {
            taskDB.CreateTask(taskCreate);
        }

        public string GetUpdatedCountTopTaskDetails(int employeeid, int taskid)
        {
            int k = 0;
            k = taskDB.GetUpdatedCountTopTaskDetails(employeeid, taskid);
            return k.ToString();
        }
    }
}
