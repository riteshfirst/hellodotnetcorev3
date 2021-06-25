using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using HelloDotnetcore.Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace hellodotnetcore.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class EmployeeController : ControllerBase
    {
        private readonly Datacontext context;

        public EmployeeController(Datacontext context)
        {
            this.context = context;
        }

        [HttpGet]
        public IEnumerable<employee> GetEmployees()
        {

            return context.employees ;
        }
    }

}