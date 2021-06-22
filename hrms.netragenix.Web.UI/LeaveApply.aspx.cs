using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using System.IO;
using System.Net.Mail;
using System.Net;

namespace hrms.netragenix.Web.UI
{
    public partial class LeaveApply : System.Web.UI.Page
    {
        WorkforceBL workforceBL = new WorkforceBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        LeaveBL leaveBL = new LeaveBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");
        }

        public string getUserName()
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            return authentication.firstname;
        }

        public string getImageName()
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            return authentication.imagename;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {           
                        
            Leave leave = new Leave();

            leave.leavefrom = Convert.ToDateTime(txtLeaveFrom.Text);
            leave.leaveto = Convert.ToDateTime(txtLeaveTo.Text);
            leave.employeeid = authentication.employeeid;
            leave.status = "Pending";
            leaveBL.ApplyLeave(leave, txtReason.InnerText);

            string employeeemailname = authentication.firstname + " " + authentication.lastname;

            MailMessage message = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            message.From = new MailAddress("ritesh.varma@gmail.com"); //even though From address is ritesh.varma@gmail.com it is still showing From as salimlive.2014@gmail.com
            message.To.Add("salimlive.2014@gmail.com");
            message.Subject = "Employee Leave Application";
            message.IsBodyHtml = true; //to make message body as html

            string str = employeeemailname + " " + " has Applied for Leave" + Environment.NewLine +
                            "<a href ='http://localhost:49615/HRMSLogin.aspx' > Click Here for Dashboard </ a > ";
            message.Body = str;
            //message.Body = employeeemailname + " " + " has Applied for Leave" + Environment.NewLine +
            //"<a href =\"HRMSLogin.aspx" > Click Here </a>";

            smtp.Port = 587;
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("salimlive.2014@gmail.com", "P@than1202");
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Send(message);

            Response.Redirect("BusinessDeskManagement.aspx");
        }

        public string getTopEventDetails()
        {
            return eventBL.GetTopEventDetails();
        }

        public string getTopMessageDetails()
        {
            return messageBL.GetTopMessageDetails(authentication.usertype, authentication.employeeid);
        }

        public string getTopTaskDetails()
        {
            return taskBL.GetTopTaskDetails(authentication.usertype, authentication.employeeid);
        }
    }
}