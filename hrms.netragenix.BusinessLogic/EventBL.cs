using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;
using System.Web;

namespace hrms.netragenix.BusinessLogic
{
    public class EventBL
    {        
        EventDB eventDB = new EventDB();        

        public string GetEventDetails()
        {
            string EventString = string.Empty;
            List<Event> eventList = eventDB.GetEventDetails();

            foreach (var eventObj in eventList)
            {
                EventString += "<tr>";
                EventString += "<td>" + eventObj.eventname + "</td>";
                EventString += "<td>" + eventObj.scheduleon + "</td>";
                EventString += "<td>" + eventObj.firstname + " " + eventObj.lastname + "</td>";
                EventString += "</tr>";
            }

            return EventString;
        }

        public string GetTopEventDetails()
        {
            string k;
            string EventString = string.Empty;
            List<Event> eventList = eventDB.GetEventDetails();
            
            foreach (var eventObj in eventList)
            {
                EventString += "<li><a href='EventManagement.aspx?eventid=" + eventObj.eventid + "'>";
                EventString += "<div class='menu-info'>";
                EventString += "<h4>" + eventObj.scheduleon.ToShortDateString() + "</h4>";
                EventString += "<p class='ellipsis'>" + eventObj.eventname + "</p>";
                EventString += "</div>";
                EventString += "</a></li>";                
            }
                        
            return EventString;
        }

        public string GetCountTopEventDetails()
        {
            string EventString = string.Empty;
            List<Event> eventList = eventDB.GetEventDetails();
            
            return eventList.Count.ToString();
        }
        
        public string GetUpdatedCountTopEventDetails(int employeeid, int eventid)
        {
            int k = 0;                       
            k = eventDB.GetUpdatedCountTopEventDetails(employeeid, eventid);            
            return k.ToString();
        }                
        
        public void InsertEvent(EventCreate eventCreate)
        {
            eventDB.CreateEvents(eventCreate);
        }
    }
}
