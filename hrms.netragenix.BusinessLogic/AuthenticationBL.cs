using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using hrms.netragenix.DataAccess;
using hrms.netragenix.BusinessEntities;

namespace hrms.netragenix.BusinessLogic
{
    public class AuthenticationBL
    {
        AuthenticationDB authenticationDB = new AuthenticationDB();

        public Authentication GetAuthenticationDetails(string UserName, string Password)
        {
            Authentication authentication = new Authentication();

            authentication = authenticationDB.GetAuthenticationDetails(UserName,Password);

            return authentication;
        }
    }
}
