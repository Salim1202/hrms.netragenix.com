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
    public class PayrollDB
    {

        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());
        
        public List<Payroll> MonthlySalaryLeave(string UserType, int EmployeeID)
        {          

            List<Payroll> payrollList = new List<Payroll>();

            string strSQL = string.Empty;
            SqlDataReader sqlDataReaderPayroll;
            if (UserType == "Administrator")
            {
                strSQL = "sptest";
                sqlDataReaderPayroll = commonDB.getDataReaderFromSQL(strSQL);
                //strSQL = "SELECT * FROM vwGetPayrollDetails";
            }
            else
            {
                strSQL = "spMonthlyLeave";
                sqlDataReaderPayroll = commonDB.getDataReaderFromSQLStoredProcedure(strSQL, Convert.ToString(EmployeeID), "@appliedby");
            }

            


            if (sqlDataReaderPayroll.HasRows)
            {
                while (sqlDataReaderPayroll.Read())
                {
                    Payroll payroll = new Payroll();

                    payroll.employeecode = sqlDataReaderPayroll.GetString(1).ToString();
                    payroll.firstname = sqlDataReaderPayroll.GetString(2).ToString();
                    payroll.lastname = sqlDataReaderPayroll.GetString(3).ToString();
                    payroll.MONTH = sqlDataReaderPayroll.GetString(4);
                    payroll.Year = sqlDataReaderPayroll.GetInt32(5);
                    payroll.LEAVES = sqlDataReaderPayroll.GetInt32(6);
                    payroll.grosssalary = sqlDataReaderPayroll.GetDouble(9);
                    payroll.netsalary = Math.Round((sqlDataReaderPayroll.GetDouble(10)), 2);                    
                    payroll.NetSalary = Math.Round((sqlDataReaderPayroll.GetDouble(12)), 2);
                    payroll.basic = Math.Round((sqlDataReaderPayroll.GetDouble(13)), 2);  
                    payroll.pf = Math.Round((sqlDataReaderPayroll.GetDouble(16)), 2);
                    payroll.da = Math.Round((sqlDataReaderPayroll.GetDouble(14)), 2);
                    payroll.hra = Math.Round((sqlDataReaderPayroll.GetDouble(15)), 2);                  
                                      
                    payrollList.Add(payroll);
                }
            }

            return payrollList;


        }


        public void LogPayroll(LogPayroll logPayroll)
        {
            SqlCommand cmdPayroll = new SqlCommand("spLogPayroll", sqlConnection);
            cmdPayroll.CommandType = CommandType.StoredProcedure;

            cmdPayroll.Parameters.AddWithValue("@employeecode", logPayroll.employeecode);
            cmdPayroll.Parameters.AddWithValue("@grosssalary", logPayroll.grosssalary);
            cmdPayroll.Parameters.AddWithValue("@netsalary", logPayroll.netsalary);            
            cmdPayroll.Parameters.AddWithValue("@status", logPayroll.status);
            

            sqlConnection.Open();
            cmdPayroll.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public DataTable BindSalaryStructureValues()
        {
            DataTable dtsalarystructureList = new DataTable();
            DataColumn dcvalue = new DataColumn();
            dtsalarystructureList.Columns.Add(dcvalue);

            //DataRow dr;
            DataRow dr = dtsalarystructureList.NewRow();
            dtsalarystructureList.Rows.Add(dr);

            SqlDataReader sqlSalaryStructureReader;

            SqlCommand cmdSalaryStructure = new SqlCommand("sp_GetSalaryStructureValues", sqlConnection);
            cmdSalaryStructure.CommandType = CommandType.StoredProcedure;

            sqlConnection.Open();
            sqlSalaryStructureReader = cmdSalaryStructure.ExecuteReader();
            
            if(sqlSalaryStructureReader.HasRows)
            {
                while(sqlSalaryStructureReader.Read())
                {
                    dr[0] = sqlSalaryStructureReader[0].ToString();

                    dr = dtsalarystructureList.NewRow();
                    dtsalarystructureList.Rows.Add(dr);
                    //dr[1] = sqlSalaryStructureReader[1].ToString();


                    //dtsalarystructureList.Rows.Add(dr);
                   // dr = dtsalarystructureList.NewRow();
                    //dtsalarystructureList.Rows.Add(dr);
                    
                    
                        //sqlSalaryStructureReader[0].ToString(),
                        //sqlSalaryStructureReader[1].ToString()
                        //);
                }
                sqlSalaryStructureReader.Close();
            }
            sqlConnection.Close();
            return dtsalarystructureList;
        }

        public void InsertSalary(Salary logSalary)
        {
            SqlCommand cmdSalary = new SqlCommand("sp_InsertSalary", sqlConnection);
            cmdSalary.CommandType = CommandType.StoredProcedure;

            cmdSalary.Parameters.AddWithValue("@BASIC", logSalary.BASIC);
            cmdSalary.Parameters.AddWithValue("@DA", logSalary.DA);
            cmdSalary.Parameters.AddWithValue("@HRA", logSalary.HRA);            
            cmdSalary.Parameters.AddWithValue("@PF", logSalary.PF);
            cmdSalary.Parameters.AddWithValue("@LTA", logSalary.LTA);
            cmdSalary.Parameters.AddWithValue("@Medical", logSalary.Medical);
            cmdSalary.Parameters.AddWithValue("@EmployeeStateInsurance", logSalary.EmployeeStateInsurance);
            cmdSalary.Parameters.AddWithValue("@ProfessionalTax", logSalary.ProfessionalTax);


            sqlConnection.Open();
            cmdSalary.ExecuteNonQuery();
            sqlConnection.Close();
        }


        public void InsertSalaryStructure(SalaryStructure logSalaryStructure)
        {
            SqlCommand cmdSalary = new SqlCommand("sp_InsertSalaryStructure", sqlConnection);
            cmdSalary.CommandType = CommandType.StoredProcedure;

            cmdSalary.Parameters.AddWithValue("@salarystructurename", logSalaryStructure.salarystructurename);
            cmdSalary.Parameters.AddWithValue("@salarystructurevalue", logSalaryStructure.salarystructurevalue);
            cmdSalary.Parameters.AddWithValue("@minvalue", logSalaryStructure.minvalue);
            cmdSalary.Parameters.AddWithValue("@maxvalue", logSalaryStructure.maxvalue);           


            sqlConnection.Open();
            cmdSalary.ExecuteNonQuery();
            sqlConnection.Close();
        }
    }
}
