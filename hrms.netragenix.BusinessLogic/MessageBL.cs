using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class MessageBL
    {
        MessageDB messageDB = new MessageDB();
        public string GetMessageDetails(string UserType, int EmployeeID)
        {
            string MessageString = string.Empty;
            List<Message> messageList = messageDB.GetMessageDetails(UserType, EmployeeID);

            foreach (var message in messageList)
            {
                if (UserType == "Administrator")
                {
                    MessageString += "<tr>";
                    MessageString += "<td>" + message.senttofirstname + " " + message.senttolastname + "</td>";
                    MessageString += "<td>" + message.messagecontents + "</td>";
                    MessageString += "<td>" + message.sentdate + "</td>";
                    MessageString += "<td>" + message.sentbyfirstname + " " + message.sentbylastname + "</td>";
                    MessageString += "</tr>";
                }
                else
                {
                    MessageString += "<tr>";
                    MessageString += "<td>" + message.messagecontents + "</td>";
                    MessageString += "<td>" + message.sentdate + "</td>";
                    MessageString += "<td>" + message.sentbyemployeecode + "</td>";
                    MessageString += "<td>" + message.sentbyfirstname + " " + message.sentbylastname + "</td>";
                    MessageString += "</tr>";
                }
            }

            return MessageString;
        }

        public string GetMessageHeaders(string UserType)
        {
            string MessageString = string.Empty;

            if(UserType == "Administrator")
            {
                MessageString += "<tr>";
                MessageString += "<th>Sent To</th>";
                MessageString += "<th>Message</th>";
                MessageString += "<th>Sent On</th>";
                MessageString += "<th>Sent By</th>";
                MessageString += "</tr>";
            }
            else
            {
                MessageString += "<tr>";
                MessageString += "<th>Message</th>";
                MessageString += "<th>Sent On</th>";
                MessageString += "<th>Employee Code</th>";
                MessageString += "<th>Sent By</th>";
                MessageString += "</tr>";
            }

            return MessageString;
        }

        public string GetTopMessageDetails(string UserType, int EmployeeID)
        {
            string MessageString = string.Empty;
            List<Message> messageList = messageDB.GetMessageDetails(UserType, EmployeeID);

            foreach (var message in messageList)
            {
                if (UserType == "Administrator")
                {
                    MessageString += "<li><a href='MessageManagement.aspx?messageid=" + message.messageid + "'>";
                    MessageString += "<div class='menu-info'>";
                    MessageString += "<h4>Sent By : " + message.sentbyfirstname + " " + message.sentbylastname + "</h4>";
                    MessageString += "<p class='ellipsis'>" + message.messagecontents + "</p>";
                    MessageString += "</div>";
                    MessageString += "</a></li>";
                }
                else
                {
                    MessageString += "<li><a href='MessageManagement.aspx?messageid=" + message.messageid + "'>";
                    MessageString += "<div class='menu-info'>";
                    MessageString += "<h4>Sent By : " + message.sentbyfirstname + " " + message.sentbylastname + "</h4>";
                    MessageString += "<p class='ellipsis'>" + message.messagecontents + "</p>";
                    MessageString += "</div>";
                    MessageString += "</a></li>";
                }
            }

            return MessageString;
        }

        public string GetBusinessDeskMessageDetails(string UserType, int EmployeeID)
        {
            string MessageString = string.Empty;
            List<Message> messageList = messageDB.GetMessageDetails(UserType, EmployeeID);

            foreach (var message in messageList)
            {
                if (UserType == "Administrator")
                {
                    MessageString += "<li class='inbox-inner'><a href='javascript:void(0)'>";
                    MessageString += "<div class='inbox-item-info'>";
                    MessageString += "<p class='author'>Message sent by : " + message.sentbyfirstname + " " + message.sentbylastname + "</p>";
                    MessageString += "<p class='inbox-message'>" + message.messagecontents + "</p>";
                    MessageString += "<p class='inbox-date'>Sent on : " + message.sentdate.ToShortDateString() + "</p>";
                    MessageString += "<p class='author'>Message sent to : " + message.senttofirstname + " " + message.senttolastname + "</p>";
                    MessageString += "</div>";
                    MessageString += "</a></li>";
                }
                else
                {
                    MessageString += "<li class='inbox-inner'><a href='javascript:void(0)'>";
                    MessageString += "<div class='inbox-item'>";
                    MessageString += "<div class='inbox-item-info'>";
                    MessageString += "<p class='author'>Message sent by : " + message.sentbyfirstname + " " + message.sentbylastname + "</p>";
                    MessageString += "<p class='inbox-message'>" + message.messagecontents + "</p>";
                    MessageString += "<p class='inbox-date'>Sent on : " + message.sentdate.ToShortDateString() + "</p>";
                    MessageString += "</div>";
                    MessageString += "</div>";
                    MessageString += "</a></li>";
                }
            }

            return MessageString;
        }

        public void InsertMessage(MessageCreate messageCreate)
        {
            messageDB.CreateMessage(messageCreate);
        }

        public string GetUpdatedCountTopMessageDetails(int employeeid)
        {
            int k = 0;
            k = messageDB.GetUpdatedCountTopMessageDetails(employeeid);
            return k.ToString();
        }
    }
}
