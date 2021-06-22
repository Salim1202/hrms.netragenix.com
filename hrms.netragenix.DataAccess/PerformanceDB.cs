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
    public class PerformanceDB
    {
        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());

        public List<Performance> GetPerformanceDetails(string UserType, int EmployeeID)
        {
            List<Performance> performanceList = new List<Performance>();

            string strSQL = string.Empty;
            if (UserType == "Administrator")
            {
                strSQL = "SELECT * FROM vwGetPerformanceDetails";
            }
            else
            {
                strSQL = "SELECT * FROM vwGetPerformanceDetails WHERE employeeid=" + EmployeeID;
            }

            SqlDataReader sqlDataReaderPerformance = commonDB.getDataReaderFromSQL(strSQL);

            if (sqlDataReaderPerformance.HasRows)
            {
                while (sqlDataReaderPerformance.Read())
                {
                    Performance performance = new Performance();

                    performance.employeecode = sqlDataReaderPerformance.GetString(0);
                    performance.firstname = sqlDataReaderPerformance.GetString(1);
                    performance.lastname = sqlDataReaderPerformance.GetString(2);
                    performance.communication = sqlDataReaderPerformance.GetInt32(3);
                    performance.conflictresolution = sqlDataReaderPerformance.GetInt32(4);
                    performance.planning = sqlDataReaderPerformance.GetInt32(5);
                    performance.problemsolving = sqlDataReaderPerformance.GetInt32(6);
                    performance.management = sqlDataReaderPerformance.GetInt32(7);

                    performanceList.Add(performance);
                }
            }

            return performanceList;
        }

        public void LogPerformance(PerformanceLog performanceLog)
        {
            SqlCommand cmdPerformance = new SqlCommand("spLogPerformance", sqlConnection);
            cmdPerformance.CommandType = CommandType.StoredProcedure;

            cmdPerformance.Parameters.AddWithValue("@employeeid", performanceLog.employeeid);
            cmdPerformance.Parameters.AddWithValue("@communication", performanceLog.communication);
            cmdPerformance.Parameters.AddWithValue("@conflictresolution", performanceLog.conflictresolution);
            cmdPerformance.Parameters.AddWithValue("@planning", performanceLog.planning);
            cmdPerformance.Parameters.AddWithValue("@problemsolving", performanceLog.problemsolving);
            cmdPerformance.Parameters.AddWithValue("@management", performanceLog.management);
            cmdPerformance.Parameters.AddWithValue("@employeecode", performanceLog.employeecode);

            sqlConnection.Open();
            cmdPerformance.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}
