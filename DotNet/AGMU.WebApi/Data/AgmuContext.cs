using Microsoft.EntityFrameworkCore;
using AGMU.WebApi.Models;

namespace AGMU.WebApi.Data;

public partial class AgmuContext : DbContext
{
    public AgmuContext()
    {
    }

    public AgmuContext(DbContextOptions<AgmuContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Class> Classes { get; set; }

    public virtual DbSet<Course> Courses { get; set; }

    public virtual DbSet<AcademicProgram> AcademicPrograms { get; set; }

    public virtual DbSet<Staff> Staffs { get; set; }

    public virtual DbSet<Student> Students { get; set; }

    public virtual DbSet<StudentClass> StudentClasses { get; set; }
}
