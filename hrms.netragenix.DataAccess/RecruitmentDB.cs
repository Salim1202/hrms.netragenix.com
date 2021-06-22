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
    public class RecruitmentDB
    {
        CommonDB commonDB = new CommonDB();
        SqlConnection sqlConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["HRMSConnectionString"].ToString());

        public List<Recruitment> GetRecruitmentDetails()
        {
            List<Recruitment> recruitmentList = new List<Recruitment>();
            SqlDataReader sqlDataReaderRecruitment = commonDB.getDataReaderFromSQL("SELECT * FROM vwGetRecruitmentDetails");

            if (sqlDataReaderRecruitment.HasRows)
            {
                while (sqlDataReaderRecruitment.Read())
                {
                    Recruitment recruitment = new Recruitment();

                    recruitment.candidatename = sqlDataReaderRecruitment.GetString(0);
                    recruitment.interviewdate = sqlDataReaderRecruitment.GetDateTime(1);
                    recruitment.confirmationdate = sqlDataReaderRecruitment.GetDateTime(2);
                    recruitment.firstname = sqlDataReaderRecruitment.GetString(3);
                    recruitment.lastname = sqlDataReaderRecruitment.GetString(4);
                    recruitment.status = sqlDataReaderRecruitment.GetString(5);

                    recruitmentList.Add(recruitment);
                }
            }

            return recruitmentList;
        }

        public void LogRecruitment(LogRecruitment logRecruitment)
        {
            SqlCommand cmdRecruitment = new SqlCommand("spLogRecruitment", sqlConnection);
            cmdRecruitment.CommandType = CommandType.StoredProcedure;

            cmdRecruitment.Parameters.AddWithValue("@candidatename", logRecruitment.candidatename);
            cmdRecruitment.Parameters.AddWithValue("@interviewdate", logRecruitment.interviewdate);
            cmdRecruitment.Parameters.AddWithValue("@confirmationdate", logRecruitment.confirmationdate);
            cmdRecruitment.Parameters.AddWithValue("@takenby", logRecruitment.takenby);
            cmdRecruitment.Parameters.AddWithValue("@status", logRecruitment.status);
            cmdRecruitment.Parameters.AddWithValue("@createdby", logRecruitment.createdby);

            sqlConnection.Open();
            cmdRecruitment.ExecuteNonQuery();
            sqlConnection.Close(); 
        }
    }
}
