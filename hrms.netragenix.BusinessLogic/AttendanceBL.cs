using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class AttendanceBL
    {
        AttendanceDB attendanceDB = new AttendanceDB();
        public string GetAttendanceDetails(string UserType, int EmployeeID)
        {
            string AttendanceString = string.Empty;
            List<Attendance> attendanceDBList = attendanceDB.GetAttendanceDetails(UserType, EmployeeID);

            foreach (var attendance in attendanceDBList)
            {
                AttendanceString += "<tr>";
                AttendanceString += "<td>" + attendance.employeecode + "</td>";
                AttendanceString += "<td>" + attendance.firstname + " " + attendance.lastname + "</td>";
                //AttendanceString += "<td>" + attendance.january + "</td>";
                //AttendanceString += "<td>" + attendance.february + "</td>";
                AttendanceString += "<td>" + attendance.march + "</td>";
                AttendanceString += "<td>" + attendance.april + "</td>";
                AttendanceString += "<td>" + attendance.may + "</td>";
                //AttendanceString += "<td>" + attendance.june + "</td>";
                //AttendanceString += "<td>" + attendance.july + "</td>";
                //AttendanceString += "<td>" + attendance.august + "</td>";
                //AttendanceString += "<td>" + attendance.september + "</td>";
                //AttendanceString += "<td>" + attendance.october + "</td>";
                //AttendanceString += "<td>" + attendance.november + "</td>";
                //AttendanceString += "<td>" + attendance.december + "</td>";
                AttendanceString += "</tr>";
            }

            return AttendanceString;
        }

        public void LogAttendance(DailyAttendanceLog dailyAttendanceLog)
        {
            attendanceDB.LogAttendance(dailyAttendanceLog);
        }
    }
}
