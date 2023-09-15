using System;
using System.Collections.Generic;

namespace AGMU.WebApi.Models;

public partial class Course
{
    public int Id { get; set; }

    public int? ProgramId { get; set; }

    public string? Name { get; set; }

    public virtual ICollection<Class> Classes { get; set; } = new List<Class>();

    public virtual AcademicProgram? Program { get; set; }
}
