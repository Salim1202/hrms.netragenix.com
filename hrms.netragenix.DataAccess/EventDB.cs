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
    public class EventDB
    {
        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());

        public List<Event> GetEventDetails()
        {
            List<Event> eventList = new List<Event>();
            SqlDataReader sqlDataReaderEvent = commonDB.getDataReaderFromSQL("SELECT * FROM vwGetEventDetails");

            if (sqlDataReaderEvent.HasRows)
            {
                while (sqlDataReaderEvent.Read())
                {
                    Event eventObj = new Event();

                    eventObj.eventid = sqlDataReaderEvent.GetInt32(0);
                    eventObj.eventname = sqlDataReaderEvent.GetString(1);
                    eventObj.eventdescription = sqlDataReaderEvent.GetString(2);
                    eventObj.scheduleon = sqlDataReaderEvent.GetDateTime(3);
                    eventObj.firstname = sqlDataReaderEvent.GetString(4);
                    eventObj.lastname = sqlDataReaderEvent.GetString(5);

                    eventList.Add(eventObj);
                }
            }
            //int m= eventList.Count;
            return eventList;
        }
        
        public void CreateEvents(EventCreate eventCreate)
        {
            SqlCommand cmdEvent = new SqlCommand("spInsertEvent", sqlConnection);
            cmdEvent.CommandType = CommandType.StoredProcedure;

            cmdEvent.Parameters.AddWithValue("@eventname", eventCreate.eventname);
            cmdEvent.Parameters.AddWithValue("@eventdescription", eventCreate.eventdescription);
            cmdEvent.Parameters.AddWithValue("@isRead", 0);
            cmdEvent.Parameters.AddWithValue("@createdby", eventCreate.createdby);
            cmdEvent.Parameters.AddWithValue("@scheduledon", eventCreate.scheduledon);
            
            sqlConnection.Open();
            cmdEvent.ExecuteNonQuery();
            sqlConnection.Close();
        }


        public int UpdateEventDetails(int employeeid, int eventid, int messageid, int taskid)
        {
            string k;
            SqlCommand cmdEvent = new SqlCommand("spInsertNotificationDetails", sqlConnection);
            cmdEvent.CommandType = CommandType.StoredProcedure;

            cmdEvent.Parameters.AddWithValue("@employeeid", employeeid);
            cmdEvent.Parameters.AddWithValue("@eventid", eventid);
            cmdEvent.Parameters.AddWithValue("@messageid", messageid);
            cmdEvent.Parameters.AddWithValue("@taskid", taskid);

            sqlConnection.Open();
            k = cmdEvent.ExecuteNonQuery().ToString();
            sqlConnection.Close();

            return Convert.ToInt32(k);
        }

        public int GetUpdatedCountTopEventDetails(int employeeid, int eventid)
        {            
            List<Event> eventList = new List<Event>();
           

            int k = 0;
            SqlCommand cmdEvent = new SqlCommand("spGetEventCount", sqlConnection);
            cmdEvent.CommandType = CommandType.StoredProcedure;

            cmdEvent.Parameters.AddWithValue("@employeeid", employeeid);
            cmdEvent.Parameters.AddWithValue("@eventid", eventid);
            //cmdEvent.Parameters.AddWithValue("@isRead", 1);

            sqlConnection.Open();
            k = Convert.ToInt32(cmdEvent.ExecuteScalar().ToString());
            sqlConnection.Close();

            return Convert.ToInt32(k);
            //SqlDataReader sqlDataReaderEvent = cmdEvent.ExecuteReader();

            //if (sqlDataReaderEvent.HasRows)
            //{
            //    while (sqlDataReaderEvent.Read())
            //    {
            //        Event eventObj = new Event();

            //        eventObj.eventid = sqlDataReaderEvent.GetInt32(0);
            //        eventObj.eventname = sqlDataReaderEvent.GetString(1);
            //        eventObj.eventdescription = sqlDataReaderEvent.GetString(2);
            //        if(!sqlDataReaderEvent.IsDBNull(sqlDataReaderEvent.GetOrdinal("isRead")))
            //        { 
            //            eventObj.isRead = Convert.ToBoolean(sqlDataReaderEvent.GetOrdinal("isRead"));
            //        }
            //        eventObj.scheduleon = sqlDataReaderEvent.GetDateTime(4);                   

            //        eventList.Add(eventObj);
            //    }
            //}
            //sqlConnection.Close();
            //int m= eventList.Count;
            //return eventList.Count;

            //sqlConnection.Open();
            //k = cmdEvent.ExecuteNonQuery();
            //sqlConnection.Close();
            //return k;           

        }

    }
}
