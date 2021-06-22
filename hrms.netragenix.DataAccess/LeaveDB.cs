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
    public class LeaveDB
    {
        Authentication authentication = new Authentication();
        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());
        public List<Leave> GetLeaveDetails(string UserType, int EmployeeID)
        {
            List<Leave> leaveList = new List<Leave>();
            string strSQL = string.Empty;
            if (UserType == "Administrator")
                strSQL = "SELECT * FROM vwGetLeaveDetails WHERE status='Pending'";
                //strSQL = "SELECT * FROM vwGetLeaveDetails WHERE employeecode='NEN-0001-APR2018' and status='Pending'";
                
            else
                strSQL = "SELECT * FROM vwGetLeaveDetails WHERE employeeid=" + EmployeeID;

            SqlDataReader sqlDataReaderLeave = commonDB.getDataReaderFromSQL(strSQL);

            if (sqlDataReaderLeave.HasRows)
            {
                while (sqlDataReaderLeave.Read())
                {
                    Leave leave = new Leave();

                    leave.leaveid = sqlDataReaderLeave.GetInt32(0);
                    leave.appliedon = sqlDataReaderLeave.GetDateTime(1);
                    leave.employeecode = sqlDataReaderLeave.GetString(2);
                    leave.firstname = sqlDataReaderLeave.GetString(3);
                    leave.lastname = sqlDataReaderLeave.GetString(4);
                    leave.leavefrom = sqlDataReaderLeave.GetDateTime(5);
                    leave.leaveto = sqlDataReaderLeave.GetDateTime(6);
                    leave.status = sqlDataReaderLeave.GetString(7);
                    leave.employeeid = sqlDataReaderLeave.GetInt32(8);

                    leaveList.Add(leave);
                }
            }

            return leaveList;
        }

        public void ApproveLeave(int LeaveID)
        {
            SqlCommand cmdEmployee = new SqlCommand("spApproveLeave", sqlConnection);
            cmdEmployee.CommandType = CommandType.StoredProcedure;

            cmdEmployee.Parameters.AddWithValue("@leaveid", LeaveID);

            sqlConnection.Open();
            cmdEmployee.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public void ApplyLeave(Leave leave, string Reason)
        {            
            SqlCommand cmdEmployee = new SqlCommand("spApplyLeave", sqlConnection);
            cmdEmployee.CommandType = CommandType.StoredProcedure;

            cmdEmployee.Parameters.AddWithValue("@appliedon", DateTime.Now);            
            cmdEmployee.Parameters.AddWithValue("@appliedby", leave.employeeid);
            cmdEmployee.Parameters.AddWithValue("@leavefrom", leave.leavefrom);
            cmdEmployee.Parameters.AddWithValue("@leaveto", leave.leaveto);
            cmdEmployee.Parameters.AddWithValue("@reason", Reason);
            cmdEmployee.Parameters.AddWithValue("@status", leave.status);
            //cmdEmployee.Parameters.AddWithValue("@createdby", leave.employeeid);//write who logged in/created leave/authentication.employeeid
            cmdEmployee.Parameters.AddWithValue("@createddate", DateTime.Now);

            sqlConnection.Open();
            cmdEmployee.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}
