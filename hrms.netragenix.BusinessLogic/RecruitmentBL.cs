using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class RecruitmentBL
    {
        RecruitmentDB recruitmentDB = new RecruitmentDB();
        public string GetRecruitmentDetails()
        {
            string RecruitmentString = string.Empty;
            List<Recruitment> recruitmentList = recruitmentDB.GetRecruitmentDetails();

            foreach (var recruitment in recruitmentList)
            {
                RecruitmentString += "<tr>";
                RecruitmentString += "<td>" + recruitment.candidatename + "</td>";
                RecruitmentString += "<td>" + recruitment.interviewdate + "</td>";
                RecruitmentString += "<td>" + recruitment.confirmationdate + "</td>";
                RecruitmentString += "<td>" + recruitment.firstname + " " + recruitment.lastname + "</td>";
                RecruitmentString += "<td><span class='text-success'>" + recruitment.status + "</span></td>";
                RecruitmentString += "</tr>";
            }

            return RecruitmentString;
        }

        public void LogRecruitment(LogRecruitment logRecruitment)
        {
            recruitmentDB.LogRecruitment(logRecruitment);
        }
    }
}
