using System;
using System.Collections.Generic;

namespace AGMU.WebApi.Models;

public partial class Staff
{
    public int Id { get; set; }

    public string FullName { get; set; } = null!;

    public bool IsProfessor { get; set; }

    public bool IsDirector { get; set; }

    public virtual ICollection<Class> Classes { get; set; } = new List<Class>();
}
