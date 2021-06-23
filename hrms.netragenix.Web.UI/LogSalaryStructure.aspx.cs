using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using hrms.netragenix.DataAccess;
using System;
using System.Data;
using System.Web;
using System.Web.UI;

namespace hrms.netragenix.Web.UI
{
    public partial class LogSalaryStructure : System.Web.UI.Page
    {
        WorkforceBL workforceBL = new WorkforceBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        LeaveBL leaveBL = new LeaveBL();
        PayrollBL payrollBL = new PayrollBL();
        PayrollDB salary = new PayrollDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");

            if (!Page.IsPostBack)
                BindSalaryStructureValues();
        }

        public void BindSalaryStructureValues()
        {
            DataTable dt = new DataTable();
            dt = salary.BindSalaryStructureValues();

            txtBasicPercentage.Text = dt.Rows[0][0].ToString();
            txtDAPercentage.Text = dt.Rows[1][0].ToString();
            txtHRAPercentage.Text = dt.Rows[2][0].ToString();
            txtPFPercentage.Text = dt.Rows[3][0].ToString();
            txtLTAPercentage.Text = dt.Rows[4][0].ToString();
            txtMedicalPercentage.Text = dt.Rows[5][0].ToString();
            txtESIPercentage.Text = Convert.ToDouble(dt.Rows[6][0]).ToString();
            txtPTPercentage.Text = dt.Rows[7][0].ToString();
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

        //public void BindEmployeesDropdown()
        //{
        //    List<WorkforceEmployees> WorkforceEmployeesList = new List<WorkforceEmployees>();
        //    WorkforceEmployeesList = workforceBL.GetWorkforceEmployeesDropdown();
        //    ddlEmployeeCode.DataSource = WorkforceEmployeesList;
        //    ddlEmployeeCode.DataValueField = "employeecode";
        //    ddlEmployeeCode.DataTextField = "employeecode";
        //    ddlEmployeeCode.DataBind();
        //    ddlEmployeeCode.Items.Insert(0, new ListItem("-- Please Select Employee --", ""));
        //}

        protected void txtGrossSalary_TextChanged(object sender, EventArgs e)
        {
            txtBasicAmount.Text = (Convert.ToInt32(txtGrossSalary.Text) * Convert.ToDouble(txtBasicPercentage.Text) / 100).ToString();
            txtDAAmount.Text = (Convert.ToInt32(txtGrossSalary.Text) * Convert.ToDouble(txtDAPercentage.Text) / 100).ToString();
            txtHRAAmount.Text = (Convert.ToInt32(txtGrossSalary.Text) * Convert.ToDouble(txtHRAPercentage.Text) / 100).ToString();
            txtPFAmount.Text = (Convert.ToInt32(txtGrossSalary.Text) * Convert.ToDouble(txtPFPercentage.Text) / 100).ToString();
            txtLTAAmount.Text = (Convert.ToInt32(txtGrossSalary.Text) * Convert.ToDouble(txtLTAPercentage.Text) / 100).ToString();
            txtMedicalAmount.Text = (Convert.ToInt32(txtGrossSalary.Text) * Convert.ToDouble(txtMedicalPercentage.Text) / 100).ToString();
            txtESIAmount.Text = (Convert.ToInt32(txtGrossSalary.Text) * Convert.ToDouble(txtESIPercentage.Text) / 100).ToString();
            txtPTAmount.Text = (Convert.ToInt32(txtGrossSalary.Text) * Convert.ToDouble(txtPTPercentage.Text) / 100).ToString();

            double earnings = Convert.ToDouble(txtBasicAmount.Text) + Convert.ToDouble(txtDAAmount.Text) + Convert.ToDouble(txtHRAAmount.Text) + Convert.ToDouble(txtLTAAmount.Text) + Convert.ToDouble(txtMedicalAmount.Text) + Convert.ToDouble(txtESIAmount.Text);
            double deductions = Convert.ToDouble(txtPFAmount.Text) + Convert.ToDouble(txtPTAmount.Text);

            txtSalaryInHand.Text = Convert.ToDouble(earnings - deductions).ToString();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Salary logSalary = new Salary();
            //LogRecruitment logRecruitment = new LogRecruitment();

            logSalary.BASIC = Convert.ToDouble(txtBasicPercentage.Text);
            logSalary.DA = Convert.ToDouble(txtDAPercentage.Text);
            logSalary.HRA = Convert.ToDouble(txtHRAPercentage.Text);
            logSalary.PF = Convert.ToDouble(txtPFPercentage.Text);
            logSalary.LTA = Convert.ToDouble(txtLTAPercentage.Text);
            logSalary.Medical = Convert.ToDouble(txtMedicalPercentage.Text);
            logSalary.EmployeeStateInsurance = Convert.ToDouble(txtESIPercentage.Text);
            logSalary.ProfessionalTax = Convert.ToDouble(txtPTPercentage.Text);

            salary.InsertSalary(logSalary);

            //Response.Redirect("LogSalaryStructure.aspx");
        }
    }
}