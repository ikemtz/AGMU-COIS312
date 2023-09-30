using System.ComponentModel.DataAnnotations;

namespace AGMU.WebApi.Models;

/// <summary>
/// Mapped from the Academic Programs Table
/// </summary>
public partial class AcademicProgram
{
    public int Id { get; set; }

    [Required]
    [MaxLength(50)]
    public string? Name { get; set; }

    public virtual ICollection<Course> Courses { get; set; } = new List<Course>();

    public virtual ICollection<Student> Students { get; set; } = new List<Student>();
}
