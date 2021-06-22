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
    public class CommonDB
    {
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());

        public SqlDataReader getDataReaderFromSQL(string strSQL)
        {
            if (sqlConnection.State == ConnectionState.Open)
                sqlConnection.Close();

            SqlCommand sqlCommand = new SqlCommand(strSQL, sqlConnection);
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            return sqlDataReader;
        }


        public SqlDataReader getDataReaderFromSQLStoredProcedure(string strSQL,string parameter1, string column1)
        {
            if (sqlConnection.State == ConnectionState.Open)
                sqlConnection.Close();

            SqlCommand sqlCommand = new SqlCommand(strSQL, sqlConnection);
            sqlCommand.CommandType = CommandType.StoredProcedure;
            sqlCommand.Parameters.AddWithValue(column1, parameter1);            
            sqlConnection.Open();
            SqlDataReader sqlDataReader = sqlCommand.ExecuteReader();
            return sqlDataReader;
        }

    }
}
