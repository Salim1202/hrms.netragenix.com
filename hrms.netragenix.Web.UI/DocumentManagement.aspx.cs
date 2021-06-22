﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using hrms.netragenix.BusinessLogic;
using hrms.netragenix.BusinessEntities;
using System.IO;

namespace hrms.netragenix.Web.UI
{
    public partial class DocumentManagement : System.Web.UI.Page
    {
        DocumentBL documentBL = new DocumentBL();
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

        public string getDocumentDetails()
        {
            return documentBL.GetDocumentDetails();
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
                CommonString += "<li><a href='DocumentLog.aspx'>Log Documents</a></li>";
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