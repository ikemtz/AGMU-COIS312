using Microsoft.AspNetCore.Mvc;
using AGMU.WebApi.Models;

namespace AGMU.WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AcademicProgramsController : ControllerBase
    {
        private static List<AcademicProgram> myPrograms = new List<AcademicProgram>();

        [HttpGet]
        public IEnumerable<AcademicProgram> Get()
        {
            return myPrograms.OrderByDescending(t => t.Id);
        }

        [HttpPost]
        public ActionResult Post([FromBody] AcademicProgram request)
        {
            myPrograms.Add(request);
            return Ok();
        }
        [HttpPut]
        public ActionResult Put([FromBody] AcademicProgram request)
        {
            if (myPrograms.Any(t => t.Id == request.Id))
            {
                _ = myPrograms.Remove(myPrograms.First(t => t.Id == request.Id));
                myPrograms.Add(request);
                return Ok();
            }
            return NotFound("This is an invalid student id, not found in memory!!");
        }

        [HttpDelete]
        public ActionResult Delete([FromQuery] int studentId)
        {
            if (myPrograms.Any(t => t.Id == studentId))
            {
                _ = myPrograms.Remove(myPrograms.First(t => t.Id == studentId));
                return Ok();
            }
            return NotFound("This is an invalid student id, not found in memory!!");
        }
    }
}
