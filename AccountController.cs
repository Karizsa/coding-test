using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using CodingExam.Models;


namespace CodingExam.Controllers
{
    public class AccountController : ApiController
    {
        private AccountDbContext db = new AccountDbContext();
        
        // GET: api/Account
   
        public IEnumerable<vAccountDetail> GetAccount()
        {
            return db.vAccountDetails;
        }

        
    }
}
