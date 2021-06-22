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
    public class WorkforceDB
    {
        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());
        public List<WorkforceEmployees> GetWorkforceEmployees()
        {
            List<WorkforceEmployees> workforceEmployeesList = new List<WorkforceEmployees>();
            SqlDataReader sqlDataReaderEmployee = commonDB.getDataReaderFromSQL("SELECT * FROM vwGetWorkforceEmployees");

            if (sqlDataReaderEmployee.HasRows)
            {
                while (sqlDataReaderEmployee.Read())
                {
                    WorkforceEmployees workforceEmployees = new WorkforceEmployees();

                    workforceEmployees.employeecode = sqlDataReaderEmployee.GetString(0);
                    workforceEmployees.firstname = sqlDataReaderEmployee.GetString(1);
                    workforceEmployees.lastname = sqlDataReaderEmployee.GetString(2);
                    workforceEmployees.departmentname = sqlDataReaderEmployee.GetString(3);
                    workforceEmployees.positionname = sqlDataReaderEmployee.GetString(4);
                    workforceEmployees.status = sqlDataReaderEmployee.GetString(5);
                    workforceEmployees.employeeid = sqlDataReaderEmployee.GetInt32(8);

                    workforceEmployeesList.Add(workforceEmployees);
                }
            }

            return workforceEmployeesList;
        }

        public Employees GetWorkforceEmployeesRawData(string EmployeeCode)
        {
            Employees employees = new Employees();
            SqlDataReader sqlDataReaderEmployee = commonDB.getDataReaderFromSQL("SELECT * FROM vwGetWorkforceEmployeesRawData WHERE employeecode='" + EmployeeCode + "'");

            if (sqlDataReaderEmployee.HasRows)
            {
                while (sqlDataReaderEmployee.Read())
                {
                    employees.employeecode = sqlDataReaderEmployee.GetString(1);
                    employees.firstname = sqlDataReaderEmployee.GetString(2);
                    employees.lastname = sqlDataReaderEmployee.GetString(3);
                    employees.dateofbirth = sqlDataReaderEmployee.GetDateTime(4);
                    employees.joiningdate = sqlDataReaderEmployee.GetDateTime(5);
                    employees.mobile = sqlDataReaderEmployee.GetString(6);
                    employees.emailid = sqlDataReaderEmployee.GetString(7);
                    employees.gender = sqlDataReaderEmployee.GetString(8);
                    employees.maritalstatus = sqlDataReaderEmployee.GetString(9);
                    employees.employeetype = sqlDataReaderEmployee.GetString(10);
                    employees.departmentid = sqlDataReaderEmployee.GetInt32(11);
                    employees.positionid = sqlDataReaderEmployee.GetInt32(12);
                    employees.imagename = sqlDataReaderEmployee.GetString(13);
                    employees.username = sqlDataReaderEmployee.GetString(14);
                    employees.password = sqlDataReaderEmployee.GetString(15);
                    employees.usertype = sqlDataReaderEmployee.GetString(16);
                    employees.address = sqlDataReaderEmployee.GetString(17);
                    employees.status = sqlDataReaderEmployee.GetString(18);
                    employees.isactive = sqlDataReaderEmployee.GetBoolean(19);
                }
            }

            return employees;
        }

        public void InsertWorkforceEmployees(Employees employees)
        {
            SqlCommand cmdEmployee = new SqlCommand("spInsertWorkforceEmployees", sqlConnection);
            cmdEmployee.CommandType = CommandType.StoredProcedure;

            cmdEmployee.Parameters.AddWithValue("@employeecode", employees.employeecode);
            cmdEmployee.Parameters.AddWithValue("@firstname", employees.firstname);
            cmdEmployee.Parameters.AddWithValue("@lastname", employees.lastname);
            cmdEmployee.Parameters.AddWithValue("@dateofbirth", employees.dateofbirth);
            cmdEmployee.Parameters.AddWithValue("@joiningdate", employees.joiningdate);
            cmdEmployee.Parameters.AddWithValue("@mobile", employees.mobile);
            cmdEmployee.Parameters.AddWithValue("@emailid", employees.emailid);
            cmdEmployee.Parameters.AddWithValue("@gender", employees.gender);
            cmdEmployee.Parameters.AddWithValue("@maritalstatus", employees.maritalstatus);
            cmdEmployee.Parameters.AddWithValue("@employeetype", employees.employeetype);
            cmdEmployee.Parameters.AddWithValue("@departmentid", employees.departmentid);
            cmdEmployee.Parameters.AddWithValue("@positionid", employees.positionid);
            cmdEmployee.Parameters.AddWithValue("@imagename", employees.imagename);
            cmdEmployee.Parameters.AddWithValue("@username", employees.username);
            cmdEmployee.Parameters.AddWithValue("@password", employees.password);
            cmdEmployee.Parameters.AddWithValue("@usertype", employees.usertype);
            cmdEmployee.Parameters.AddWithValue("@address", employees.address);
            cmdEmployee.Parameters.AddWithValue("@status", employees.status);
            cmdEmployee.Parameters.AddWithValue("@isactive", employees.isactive);
            cmdEmployee.Parameters.AddWithValue("@isdeleted", employees.isdeleted);
            cmdEmployee.Parameters.AddWithValue("@createdby", employees.createdby);
            cmdEmployee.Parameters.AddWithValue("@createddate", employees.createddate);

            sqlConnection.Open();
            cmdEmployee.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public void UpdateWorkforceEmployees(Employees employees)
        {
            SqlCommand cmdEmployee = new SqlCommand("spUpdateWorkforceEmployees", sqlConnection);
            cmdEmployee.CommandType = CommandType.StoredProcedure;

            cmdEmployee.Parameters.AddWithValue("@employeecode", employees.employeecode);
            cmdEmployee.Parameters.AddWithValue("@firstname", employees.firstname);
            cmdEmployee.Parameters.AddWithValue("@lastname", employees.lastname);
            cmdEmployee.Parameters.AddWithValue("@dateofbirth", employees.dateofbirth);
            cmdEmployee.Parameters.AddWithValue("@joiningdate", employees.joiningdate);
            cmdEmployee.Parameters.AddWithValue("@mobile", employees.mobile);
            cmdEmployee.Parameters.AddWithValue("@emailid", employees.emailid);
            cmdEmployee.Parameters.AddWithValue("@gender", employees.gender);
            cmdEmployee.Parameters.AddWithValue("@maritalstatus", employees.maritalstatus);
            cmdEmployee.Parameters.AddWithValue("@employeetype", employees.employeetype);
            cmdEmployee.Parameters.AddWithValue("@departmentid", employees.departmentid);
            cmdEmployee.Parameters.AddWithValue("@positionid", employees.positionid);
            cmdEmployee.Parameters.AddWithValue("@imagename", employees.imagename);
            cmdEmployee.Parameters.AddWithValue("@username", employees.username);
            cmdEmployee.Parameters.AddWithValue("@password", employees.password);
            cmdEmployee.Parameters.AddWithValue("@usertype", employees.usertype);
            cmdEmployee.Parameters.AddWithValue("@address", employees.address);
            cmdEmployee.Parameters.AddWithValue("@status", employees.status);
            cmdEmployee.Parameters.AddWithValue("@isactive", employees.isactive);

            sqlConnection.Open();
            cmdEmployee.ExecuteNonQuery();
            sqlConnection.Close();
        }

        public void RemoveWorkforceEmployees(Employees employees)
        {
            SqlCommand cmdEmployee = new SqlCommand("spRemoveWorkforceEmployees", sqlConnection);
            cmdEmployee.CommandType = CommandType.StoredProcedure;

            cmdEmployee.Parameters.AddWithValue("@employeecode", employees.employeecode);

            sqlConnection.Open();
            cmdEmployee.ExecuteNonQuery();
            sqlConnection.Close();
        }


        public List<WorkforceEmployees> GetAllEmployees()
        {
            //SqlDatabase sqlDatabase = SqlDatabase.CreateDatabase();

            List<WorkforceEmployees> listItems = new List<WorkforceEmployees>();

            SqlCommand cmdEmployee = new SqlCommand("spGetAllEmployees",sqlConnection);
            cmdEmployee.CommandType = CommandType.StoredProcedure;
            sqlConnection.Open();
            using (SqlDataReader reader = cmdEmployee.ExecuteReader())
            {
                while (reader.Read())
                {
                    //Create a new Users
                    WorkforceEmployees item = new WorkforceEmployees();

                    item.employeeid = (reader.GetValue(0) == DBNull.Value) ? 0 : reader.GetInt32(0);
                    item.employeecode = (reader.GetValue(1) == DBNull.Value) ? String.Empty : reader.GetString(1);                    


                    listItems.Add(item);

                }
                reader.Close();
            }
            sqlConnection.Close();
            return listItems;
        }
    }
}
