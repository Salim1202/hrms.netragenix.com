using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class TrainingBL
    {
        TrainingDB trainingDB = new TrainingDB();
        public string GetTrainingDetails(string UserType, int EmployeeID)
        {
            string trainingString = string.Empty;
            List<Training> trainingList = trainingDB.GetTrainingDetails(UserType, EmployeeID);

            foreach (var training in trainingList)
            {
                trainingString += "<tr>";
                trainingString += "<td>" + training.employeecode + "</td>";
                trainingString += "<td>" + training.firstname + " " + training.lastname + "</td>";
                trainingString += "<td>" + training.trainingdate + "</td>";
                trainingString += "<td>" + training.scheduledate + "</td>";
                trainingString += "<td>" + training.particulars + "</td>";
                trainingString += "<td>" + training.raisedbyfirstname + " " + training.raisedbylastname + "</td>";
                trainingString += "</tr>";
            }

            return trainingString;
        }

        public void LogTraining(TrainingLog trainingLog)
        {
            trainingDB.LogTraining(trainingLog);
        }
    }
}
