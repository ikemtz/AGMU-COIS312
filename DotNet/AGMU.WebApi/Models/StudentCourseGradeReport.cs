namespace AGMU.WebApi.Models;

public partial class StudentCourseGradeReport
{
    public int StudentId { get; set; }

    public string StudentName { get; set; } = null!;

    public string? CourseName { get; set; }

    public string ProfessorName { get; set; } = null!;

    public DateTime? StartDate { get; set; }

    public string? Grade { get; set; }
}
