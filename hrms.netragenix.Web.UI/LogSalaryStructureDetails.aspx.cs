using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using hrms.netragenix.BusinessEntities;
using hrms.netragenix.BusinessLogic;
using hrms.netragenix.DataAccess;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace hrms.netragenix.Web.UI
{
    public partial class LogSalaryStructureDetails : System.Web.UI.Page
    {
        WorkforceBL workforceBL = new WorkforceBL();
        Authentication authentication = new Authentication();
        EventBL eventBL = new EventBL();
        MessageBL messageBL = new MessageBL();
        TaskBL taskBL = new TaskBL();
        //LeaveBL leaveBL = new LeaveBL();
        //PayrollBL payrollBL = new PayrollBL();
        PayrollDB salarystructureDB = new PayrollDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            authentication = (Authentication)HttpContext.Current.Session["Authentication"];
            if (authentication == null)
                Response.Redirect("HRMSLogin.aspx");

            if (!this.IsPostBack)
            {
                this.BindSalaryStructureDetailsGrid();
            }
        }

        private void BindSalaryStructureDetailsGrid()
        {
            //SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());
            string constr = ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT salarystructureid, salarystructurename, salarystructurevalue, minvalue, maxvalue FROM SalaryStructure"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvSalaryStructureDetails.DataSource = dt;
                            gvSalaryStructureDetails.DataBind();
                        }
                    }
                }
            }
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

        protected void gvSalaryStructureDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSalaryStructureDetails.PageIndex = e.NewPageIndex;
            this.BindSalaryStructureDetailsGrid();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SalaryStructure salarystructure = new SalaryStructure();

            salarystructure.salarystructurename = txtsalarystructurename.Text;
            salarystructure.salarystructurevalue = Convert.ToDouble(txtsalarystructurevalue.Text);
            salarystructure.minvalue = Convert.ToDouble(txtMinValue.Text);
            salarystructure.maxvalue = Convert.ToDouble(txtMaxValue.Text);

            salarystructureDB.InsertSalaryStructure(salarystructure);

            this.BindSalaryStructureDetailsGrid();

            txtsalarystructurename.Text = "";
            txtsalarystructurevalue.Text = "";
            txtMinValue.Text = "";
            txtMaxValue.Text = "";
        }

        protected void gvSalaryStructureDetails_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvSalaryStructureDetails.EditIndex = e.NewEditIndex;
            this.BindSalaryStructureDetailsGrid();
        }

        //protected void OnUpdate(object sender, EventArgs e)
        //{
        //    GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
        //    string name = (row.Cells[0].Controls[0] as TextBox).Text;
        //    string country = (row.Cells[1].Controls[0] as TextBox).Text;
        //    DataTable dt = ViewState["dt"] as DataTable;
        //    dt.Rows[row.RowIndex]["Name"] = name;
        //    dt.Rows[row.RowIndex]["Country"] = country;
        //    ViewState["dt"] = dt;
        //    gvSalaryStructureDetails.EditIndex = -1;
        //    this.BindSalaryStructureDetailsGrid();
        //}

        protected void gvSalaryStructureDetails_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //int lblsalarystructureid = Convert.ToInt32(gvSalaryStructureDetails.DataKeys[e.RowIndex].Value.ToString());
            GridViewRow row = (GridViewRow)gvSalaryStructureDetails.Rows[e.RowIndex];
            Label lblsalarystructureid = (Label)row.FindControl("lblsalarystructureid") as Label;
            
            TextBox salarystructurename = (TextBox)row.FindControl("txtsalarystructurename") as TextBox;
            TextBox salarystructurevalue = (TextBox)row.FindControl("txtsalarystructurevalue") as TextBox;
            TextBox minvalue = (TextBox)row.FindControl("txtminvalue") as TextBox;
            TextBox maxvalue = (TextBox)row.FindControl("txtmaxvalue") as TextBox;
                        
            
            SqlCommand cmdSalary = new SqlCommand("sp_UpdateSalaryStructure", sqlConnection);
            cmdSalary.CommandType = CommandType.StoredProcedure;

            cmdSalary.Parameters.AddWithValue("@salarystructureid", Convert.ToInt32(lblsalarystructureid.Text));
            cmdSalary.Parameters.AddWithValue("@salarystructurename", salarystructurename.Text);
            cmdSalary.Parameters.AddWithValue("@salarystructurevalue", salarystructurevalue.Text);
            cmdSalary.Parameters.AddWithValue("@minvalue", minvalue.Text);
            cmdSalary.Parameters.AddWithValue("@maxvalue", maxvalue.Text);


            sqlConnection.Open();
            cmdSalary.ExecuteNonQuery();
            sqlConnection.Close();

            gvSalaryStructureDetails.EditIndex = -1;
            this.BindSalaryStructureDetailsGrid();
            //GridView1.DataBind(); 
        }

        protected void gvSalaryStructureDetails_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvSalaryStructureDetails.EditIndex = -1;
            this.BindSalaryStructureDetailsGrid();
        }

        //protected void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    SalaryStructure salarystructure = new SalaryStructure();

        //    salarystructure.salarystructurename = lblBasicSalary.Text;
        //    salarystructure.salarystructurevalue = Convert.ToDouble(txtBasicPercentage.Text);
        //    salarystructure.minvalue = Convert.ToDouble(txtBasicMinValue.Text);
        //    salarystructure.maxvalue = Convert.ToDouble(txtBasicMaxValue.Text);

        //    salarystructure.salarystructurename = lblDA.Text;
        //    salarystructure.salarystructurevalue = Convert.ToDouble(txtDAPercentage.Text);
        //    salarystructure.minvalue = Convert.ToDouble(txtDAMinValue.Text);
        //    salarystructure.maxvalue = Convert.ToDouble(txtDAMaxValue.Text);


        //}
    }
}