using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using hrms.netragenix.BusinessEntities;
using System.Data;

namespace hrms.netragenix.DataAccess
{
    public class TaskDB
    {
        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());

        public List<BusinessEntities.Task> GetTaskDetails(string UserType, int EmployeeID)
        {
            List<BusinessEntities.Task> taskList = new List<BusinessEntities.Task>();
            string strSQL = string.Empty;

            if (UserType == "Administrator")
                strSQL = "SELECT * FROM vwGetTaskDetails";
            else
                strSQL = "SELECT * FROM vwGetTaskDetails WHERE assignedto = " + EmployeeID;

            SqlDataReader sqlDataReaderTask = commonDB.getDataReaderFromSQL(strSQL);

            if (sqlDataReaderTask.HasRows)
            {
                while (sqlDataReaderTask.Read())
                {
                    BusinessEntities.Task task = new BusinessEntities.Task();

                    task.taskid = sqlDataReaderTask.GetInt32(0);
                    task.taskname = sqlDataReaderTask.GetString(1);
                    task.createdon = sqlDataReaderTask.GetDateTime(2);
                    task.createdby = sqlDataReaderTask.GetInt32(3);
                    task.createdbyemployeecode = sqlDataReaderTask.GetString(4);
                    task.createdbyfirstname = sqlDataReaderTask.GetString(5);
                    task.createdbylastname = sqlDataReaderTask.GetString(6);
                    task.assignedto = sqlDataReaderTask.GetInt32(7);
                    task.assignedtoemployeecode = sqlDataReaderTask.GetString(8);
                    task.assignedtofirstname = sqlDataReaderTask.GetString(9);
                    task.assignedtolastname = sqlDataReaderTask.GetString(10);

                    taskList.Add(task);
                }
            }

            return taskList;
        }

        public void CreateTask(TaskCreate taskCreate)
        {
            SqlCommand cmdTask = new SqlCommand("spInsertTask", sqlConnection);
            cmdTask.CommandType = CommandType.StoredProcedure;

            cmdTask.Parameters.AddWithValue("@employeecode", taskCreate.employeecode);
            cmdTask.Parameters.AddWithValue("@taskname", taskCreate.taskname);
            cmdTask.Parameters.AddWithValue("@createdon", taskCreate.createdon);
            cmdTask.Parameters.AddWithValue("@createdby", taskCreate.createdby);
            cmdTask.Parameters.AddWithValue("@assignedto", taskCreate.assignedto);
            cmdTask.Parameters.AddWithValue("@status", taskCreate.status);
            cmdTask.Parameters.AddWithValue("@isRead", 0);

            sqlConnection.Open();
            cmdTask.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public int UpdateTaskDetails(string taskid)
        {
            string k;
            SqlCommand cmdTask = new SqlCommand("spUpdateTaskCount", sqlConnection);
            cmdTask.CommandType = CommandType.StoredProcedure;

            cmdTask.Parameters.AddWithValue("@taskid", taskid);

            sqlConnection.Open();
            k = cmdTask.ExecuteNonQuery().ToString();
            sqlConnection.Close();

            return Convert.ToInt32(k);
        }

        public int GetUpdatedCountTopTaskDetails(int employeeid, int taskid)
        {            
            List<BusinessEntities.Task> taskList = new List<BusinessEntities.Task>();

            int k = 0;
            SqlCommand cmdTask = new SqlCommand("spGetTaskCount", sqlConnection);
            cmdTask.CommandType = CommandType.StoredProcedure;

            cmdTask.Parameters.AddWithValue("@employeeid", employeeid);
            cmdTask.Parameters.AddWithValue("@taskid", taskid);
            //cmdEvent.Parameters.AddWithValue("@isRead", 1);

            sqlConnection.Open();
            k = Convert.ToInt32(cmdTask.ExecuteScalar().ToString());
            sqlConnection.Close();

            return Convert.ToInt32(k);

            //SqlDataReader sqlDataReaderTask = cmdTask.ExecuteReader();

            //if (sqlDataReaderTask.HasRows)
            //{
            //    while (sqlDataReaderTask.Read())
            //    {
            //        BusinessEntities.Task taskObj = new BusinessEntities.Task();

            //        taskObj.taskid = sqlDataReaderTask.GetInt32(0);
            //        taskObj.taskname = sqlDataReaderTask.GetString(1);
            //        taskObj.assignedto = sqlDataReaderTask.GetInt32(2);
            //        taskObj.status = sqlDataReaderTask.GetString(3);
            //        taskObj.isRead = sqlDataReaderTask.GetBoolean(4);

            //        taskList.Add(taskObj);
            //    }
            //}
            //sqlConnection.Close();

            //return taskList.Count;
        }
    }
}
