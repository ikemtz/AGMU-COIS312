using System;
using System.Data;
using System.Windows.Forms;
using static AGMU.WindowsForm.AGMUDataSet;

namespace AGMU.WindowsForm
{
  public partial class Form1 : Form
  {
    public Form1()
    {
      InitializeComponent();
    }

    private void Form1_Load(object sender, EventArgs e)
    {
      // TODO: This line of code loads data into the 'aGMUDataSet.AcademicPrograms' table. You can move, or remove it, as needed.
      _ = this.academicProgramsTableAdapter.Fill(this.aGMUDataSet.AcademicPrograms);
      // TODO: This line of code loads data into the 'aGMUDataSet.StudentClasses' table. You can move, or remove it, as needed.
      _ = this.studentClassesTableAdapter.Fill(this.aGMUDataSet.StudentClasses);
      // TODO: This line of code loads data into the 'aGMUDataSet.Courses' table. You can move, or remove it, as needed.
      _ = this.coursesTableAdapter.Fill(this.aGMUDataSet.Courses);
      // TODO: This line of code loads data into the 'aGMUDataSet.Staffs' table. You can move, or remove it, as needed.
      _ = this.staffsTableAdapter.Fill(this.aGMUDataSet.Staffs);
      // TODO: This line of code loads data into the 'aGMUDataSet.Classes' table. You can move, or remove it, as needed.
      _ = this.classesTableAdapter.Fill(this.aGMUDataSet.Classes); 
      // TODO: This line of code loads data into the 'aGMUDataSet.Students' table. You can move, or remove it, as needed.
      _ = this.studentsTableAdapter.Fill(this.aGMUDataSet.Students);

    }

    private void grdPrograms_RowEnter(object sender, DataGridViewCellEventArgs e)
    {
      if (this.grdPrograms.Rows[e.RowIndex].DataBoundItem is DataRowView dataRowView)
      {
        var program = dataRowView.Row as AcademicProgramsRow;
        subProgramStudentsBindingSrc.Filter = coursesBindingSource.Filter = $"AcademicProgramId = {program.Id}";
      }
    }

    private void grdClasses_RowEnter(object sender, DataGridViewCellEventArgs e)
    {
      if (grdClasses.Rows[e.RowIndex].DataBoundItem is DataRowView dataRowView)
      {
        var classesRow = dataRowView.Row as ClassesRow;
        var studentIds = aGMUDataSet.StudentClasses.Where(t => t.ClassId == classesRow.Id).Select(t => $" Id = {t.StudentId} ");
        subClassesStudentsBindingSrc.Filter = string.Join(" OR ", studentIds);
      }
    }

    private void btnSaveStudents_Click(object sender, EventArgs e)
    {
      _ = this.studentsTableAdapter.Update(this.aGMUDataSet.Students);
    }

    private void btnSaveClasses_Click(object sender, EventArgs e)
    {
      _ = this.classesTableAdapter.Update(this.aGMUDataSet.Classes);
      _ = this.studentsTableAdapter.Update(this.aGMUDataSet.Students);
    }

    private void btnSavePrograms_Click(object sender, EventArgs e)
    {
      _ = this.academicProgramsTableAdapter.Update(this.aGMUDataSet.AcademicPrograms);
      _ = this.coursesTableAdapter.Update(this.aGMUDataSet.Courses);
      _ = this.studentsTableAdapter.Update(this.aGMUDataSet.Students);
    }
  }
}
