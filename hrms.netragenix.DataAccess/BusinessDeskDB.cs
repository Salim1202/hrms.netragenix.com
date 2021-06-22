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
    public class BusinessDeskDB
    {
        CommonDB commonDB = new CommonDB();
        public List<BusinessDeskEmployees> GetBusinessDeskEmployees()
        {
            List<BusinessDeskEmployees> businessDeskEmployeesList = new List<BusinessDeskEmployees>();
            SqlDataReader sqlDataReaderEmployee = commonDB.getDataReaderFromSQL("SELECT * FROM vwGetBusinessDeskEmployees");

            if(sqlDataReaderEmployee.HasRows)
            {
                while (sqlDataReaderEmployee.Read())
                {
                    BusinessDeskEmployees businessDeskEmployees = new BusinessDeskEmployees();

                    businessDeskEmployees.employeecode = sqlDataReaderEmployee.GetString(0);
                    businessDeskEmployees.firstname = sqlDataReaderEmployee.GetString(1);
                    businessDeskEmployees.lastname = sqlDataReaderEmployee.GetString(2);
                    businessDeskEmployees.departmentname = sqlDataReaderEmployee.GetString(3);
                    businessDeskEmployees.positionname = sqlDataReaderEmployee.GetString(4);
                    businessDeskEmployees.status = sqlDataReaderEmployee.GetString(5);

                    businessDeskEmployeesList.Add(businessDeskEmployees);
                }
            }

            return businessDeskEmployeesList;
        }
    }
}
