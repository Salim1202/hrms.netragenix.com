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
    public class TrainingDB
    {
        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());

        public List<Training> GetTrainingDetails(string UserType, int EmployeeID)
        {
            List<Training> trainingList = new List<Training>();

            string strSQL = string.Empty;
            if (UserType == "Administrator")
            {
                strSQL = "SELECT * FROM vwGetTrainingDetails";
            }
            else
            {
                strSQL = "SELECT * FROM vwGetTrainingDetails WHERE employeeid=" + EmployeeID;
            }

            SqlDataReader sqlDataReaderTraining = commonDB.getDataReaderFromSQL(strSQL);

            if (sqlDataReaderTraining.HasRows)
            {
                while (sqlDataReaderTraining.Read())
                {
                    Training training = new Training();

                    training.employeecode = sqlDataReaderTraining.GetString(0);
                    training.firstname = sqlDataReaderTraining.GetString(1);
                    training.lastname = sqlDataReaderTraining.GetString(2);
                    training.trainingdate = sqlDataReaderTraining.GetDateTime(3);
                    training.scheduledate = sqlDataReaderTraining.GetDateTime(4);
                    training.particulars = sqlDataReaderTraining.GetString(5);
                    training.raisedbyfirstname = sqlDataReaderTraining.GetString(6);
                    training.raisedbylastname = sqlDataReaderTraining.GetString(7);

                    trainingList.Add(training);
                }
            }

            return trainingList;
        }

        public void LogTraining(TrainingLog trainingLog)
        {
            SqlCommand cmdTraining = new SqlCommand("spLogTraining", sqlConnection);
            cmdTraining.CommandType = CommandType.StoredProcedure;

            cmdTraining.Parameters.AddWithValue("@trainingdate", trainingLog.trainingdate);
            cmdTraining.Parameters.AddWithValue("@scheduledate", trainingLog.scheduledate);
            cmdTraining.Parameters.AddWithValue("@particulars", trainingLog.particulars);
            cmdTraining.Parameters.AddWithValue("@raisedby", trainingLog.raisedby);
            cmdTraining.Parameters.AddWithValue("@employeeid", trainingLog.employeeid);
            cmdTraining.Parameters.AddWithValue("@createdby", trainingLog.createdby);
            cmdTraining.Parameters.AddWithValue("@employeecode", trainingLog.employeecode);

            sqlConnection.Open();
            cmdTraining.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}
