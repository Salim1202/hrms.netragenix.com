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
    public class AuthenticationDB
    {
        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());
        public Authentication GetAuthenticationDetails(string UserName, string Password)
        {
            Authentication authentication = new Authentication();
            SqlDataReader sqlDataReaderAuthentication = commonDB.getDataReaderFromSQL("SELECT * FROM vwGetAuthenticationDetails WHERE username='" + UserName + "' AND password='" + Password + "'");

            if (sqlDataReaderAuthentication.HasRows)
            {
                while (sqlDataReaderAuthentication.Read())
                {
                    authentication.employeeid = sqlDataReaderAuthentication.GetInt32(0);
                    authentication.firstname = sqlDataReaderAuthentication.GetString(1);
                    authentication.lastname = sqlDataReaderAuthentication.GetString(2);
                    authentication.username = sqlDataReaderAuthentication.GetString(3);
                    authentication.password = sqlDataReaderAuthentication.GetString(4);
                    authentication.usertype = sqlDataReaderAuthentication.GetString(5);
                    authentication.imagename = sqlDataReaderAuthentication.GetString(6);
                    authentication.isactive = sqlDataReaderAuthentication.GetBoolean(7);
                    authentication.isdeleted = sqlDataReaderAuthentication.GetBoolean(8);
                }
            }

            return authentication;
        }
    }
}
