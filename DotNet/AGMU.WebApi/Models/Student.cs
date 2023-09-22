﻿namespace AGMU.WebApi.Models;

public partial class Student
{
    public int Id { get; set; }

    public int? AcademicProgramId { get; set; }

    public string Name { get; set; } = null!;

    public DateTime DateOfBirth { get; set; }

    public string? PhoneNumber { get; set; }

    public virtual AcademicProgram? AcademicProgram { get; set; }

    public virtual ICollection<StudentClass> StudentClasses { get; set; } = new List<StudentClass>();
}
