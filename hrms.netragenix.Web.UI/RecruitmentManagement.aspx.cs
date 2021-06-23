using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using System;
using System.Web;

namespace hrms.netragenix.Web.UI
{
    public partial class RecruitmentManagement : System.Web.UI.Page
    {
        RecruitmentBL recruitmentBL = new RecruitmentBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();

        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");
        }

        public string getRecruitmentDetails()
        {
            return recruitmentBL.GetRecruitmentDetails();
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

        public string getGridMenu()
        {
            string CommonString = string.Empty;

            if (authentication.usertype == "Administrator")
            {
                CommonString += "<ul class='header-dropdown m-r--5'>";
                CommonString += "<li class='dropdown'><a href='javascript:void(0);' class='dropdown-toggle' data-toggle='dropdown' role='button' aria-haspopup='true' aria-expanded='false'><i class='zmdi zmdi-more-vert'></i></a>";
                CommonString += "<ul class='dropdown-menu pull-right'>";
                CommonString += "<li><a href='RecruitmentLog.aspx'>Log Recruitment Details</a></li>";
                CommonString += "</ul>";
                CommonString += "</li>";
                CommonString += "</ul>";
            }
            else
            {
                CommonString += "";
            }

            return CommonString;
        }
    }
}