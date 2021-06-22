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
    public class MessageDB
    {
        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());

        public List<Message> GetMessageDetails(string UserType, int EmployeeID)
        {
            List<Message> messageList = new List<Message>();
            string strSQL = string.Empty;

            if (UserType == "Administrator")
                strSQL = "SELECT * FROM vwGetMessageDetails";
            else
                strSQL = "SELECT * FROM vwGetMessageDetails WHERE sentto = " + EmployeeID;

            SqlDataReader sqlDataReaderMessage = commonDB.getDataReaderFromSQL(strSQL);

            if (sqlDataReaderMessage.HasRows)
            {
                while (sqlDataReaderMessage.Read())
                {
                    Message message = new Message();

                    message.messageid = sqlDataReaderMessage.GetInt32(0);
                    message.sentto = sqlDataReaderMessage.GetInt32(1);
                    message.senttoemployeecode = sqlDataReaderMessage.GetString(2);
                    message.senttofirstname = sqlDataReaderMessage.GetString(3);
                    message.senttolastname = sqlDataReaderMessage.GetString(4);
                    message.messagecontents = sqlDataReaderMessage.GetString(5);
                    message.sentdate = sqlDataReaderMessage.GetDateTime(6);
                    message.sentby = sqlDataReaderMessage.GetInt32(7);
                    message.sentbyemployeecode = sqlDataReaderMessage.GetString(8);
                    message.sentbyfirstname = sqlDataReaderMessage.GetString(9);
                    message.sentbylastname = sqlDataReaderMessage.GetString(10);

                    messageList.Add(message);
                }
            }

            return messageList;
        }

        public void CreateMessage(MessageCreate messageCreate)
        {
            SqlCommand cmdMessage = new SqlCommand("spInsertMessage", sqlConnection);
            cmdMessage.CommandType = CommandType.StoredProcedure;

            cmdMessage.Parameters.AddWithValue("@employeecode", messageCreate.employeecode);
            cmdMessage.Parameters.AddWithValue("@sentto", messageCreate.sentto);
            cmdMessage.Parameters.AddWithValue("@messagecontents", messageCreate.messagecontents);
            cmdMessage.Parameters.AddWithValue("@sentby", messageCreate.sentby);
            cmdMessage.Parameters.AddWithValue("@sentdate", messageCreate.sentdate);
            cmdMessage.Parameters.AddWithValue("@isRead", 0);

            sqlConnection.Open();
            cmdMessage.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public int UpdateMessageDetails(string messageid)
        {
            string k;
            SqlCommand cmdMessage = new SqlCommand("spUpdateMessageCount", sqlConnection);
            cmdMessage.CommandType = CommandType.StoredProcedure;

            cmdMessage.Parameters.AddWithValue("@messageid", messageid);

            sqlConnection.Open();
            k = cmdMessage.ExecuteNonQuery().ToString();
            sqlConnection.Close();

            return Convert.ToInt32(k);
        }

        public int GetUpdatedCountTopMessageDetails(int employeeid)
        {            
            List<Message> messageList = new List<Message>();

            int k = 0;
            SqlCommand cmdMessage = new SqlCommand("spGetMessageCount", sqlConnection);
            cmdMessage.CommandType = CommandType.StoredProcedure;

            cmdMessage.Parameters.AddWithValue("@employeeid", employeeid);
            //cmdMessage.Parameters.AddWithValue("@messageid", messageid);
            //cmdEvent.Parameters.AddWithValue("@isRead", 1);

            sqlConnection.Open();
            k = Convert.ToInt32(cmdMessage.ExecuteScalar().ToString());
            sqlConnection.Close();

            return Convert.ToInt32(k);

            //SqlDataReader sqlDataReaderMessage = cmdMessage.ExecuteReader();

            //if (sqlDataReaderMessage.HasRows)
            //{
            //    while (sqlDataReaderMessage.Read())
            //    {
            //        Message messageObj = new Message();

            //        messageObj.messageid = sqlDataReaderMessage.GetInt32(0);
            //        messageObj.sentto = sqlDataReaderMessage.GetInt32(1);
            //        messageObj.messagecontents = sqlDataReaderMessage.GetString(2);                    
            //        messageObj.sentby = sqlDataReaderMessage.GetInt32(3);
            //        messageObj.isRead = sqlDataReaderMessage.GetBoolean(4);

            //        messageList.Add(messageObj);
            //    }
            //}
            //sqlConnection.Close();

            //return messageList.Count;                  
        }
    }
}
