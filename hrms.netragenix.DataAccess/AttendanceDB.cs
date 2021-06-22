using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.DataAccess
{
    public class AttendanceDB
    {
        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());

        public List<Attendance> GetAttendanceDetails(string UserType, int EmployeeID)
        {
            List<Attendance> attendanceList = new List<Attendance>();

            string strSQL = string.Empty;
            if (UserType == "Administrator")
            {
                strSQL = "SELECT * FROM vwGetAttendanceDetails";
            }
            else
            {
                strSQL = "SELECT * FROM vwGetAttendanceDetails WHERE employeeid=" + EmployeeID;
            }

            SqlDataReader sqlDataReaderAttendance = commonDB.getDataReaderFromSQL(strSQL);

            if (sqlDataReaderAttendance.HasRows)
            {
                while (sqlDataReaderAttendance.Read())
                {
                    Attendance attendance = new Attendance();

                    attendance.employeecode = sqlDataReaderAttendance.GetString(0);
                    attendance.firstname = sqlDataReaderAttendance.GetString(1);
                    attendance.lastname = sqlDataReaderAttendance.GetString(2);
                    attendance.january = sqlDataReaderAttendance.GetInt32(3);
                    attendance.february = sqlDataReaderAttendance.GetInt32(4);
                    attendance.march = sqlDataReaderAttendance.GetInt32(5);
                    attendance.april = sqlDataReaderAttendance.GetInt32(6);
                    attendance.may = sqlDataReaderAttendance.GetInt32(7);
                    attendance.june = sqlDataReaderAttendance.GetInt32(8);
                    attendance.july = sqlDataReaderAttendance.GetInt32(9);
                    attendance.august = sqlDataReaderAttendance.GetInt32(10);
                    attendance.september = sqlDataReaderAttendance.GetInt32(11);
                    attendance.october = sqlDataReaderAttendance.GetInt32(12);
                    attendance.november = sqlDataReaderAttendance.GetInt32(13);
                    attendance.december = sqlDataReaderAttendance.GetInt32(14);

                    attendanceList.Add(attendance);
                }
            }

            return attendanceList;
        }

        public void LogAttendance(DailyAttendanceLog dailyAttendanceLog)
        {
            SqlCommand cmdAttendance = new SqlCommand("spLogAttendance", sqlConnection);
            cmdAttendance.CommandType = CommandType.StoredProcedure;

            cmdAttendance.Parameters.AddWithValue("@employeecode", dailyAttendanceLog.employeecode);
            cmdAttendance.Parameters.AddWithValue("@loggeddate", DateTime.Now);
            cmdAttendance.Parameters.AddWithValue("@status", dailyAttendanceLog.status);

            sqlConnection.Open();
            cmdAttendance.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}
