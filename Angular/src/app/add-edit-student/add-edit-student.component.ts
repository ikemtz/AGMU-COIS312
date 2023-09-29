import { DatePipe } from '@angular/common';
import { HttpClient } from '@angular/common/http';
import { Component, Inject } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { MAT_DIALOG_DATA } from '@angular/material/dialog';
import { IStudent, IStudentForm, StudentFormGroupFac } from 'src/models';

@Component({
  selector: 'app-add-edit-student',
  templateUrl: './add-edit-student.component.html',
  styleUrls: ['./add-edit-student.component.scss']
})
export class AddEditStudentComponent {

  public studentFormGroup: FormGroup<IStudentForm>;

  constructor(
    private readonly httpClient: HttpClient,
    private readonly datePipe: DatePipe,
    @Inject(MAT_DIALOG_DATA) public student: IStudent) {
    this.studentFormGroup = StudentFormGroupFac();
    if (student) {
      this.editStudent(student);
    }
  }

  public editStudent(student: IStudent) {
    const dob = this.datePipe.transform(student.dateOfBirth, 'yyyy-MM-dd');
    this.studentFormGroup.controls.id.patchValue(student.id);
    this.studentFormGroup.controls.name.patchValue(student.name);
    this.studentFormGroup.controls.phoneNumber.patchValue(student.phoneNumber);
    this.studentFormGroup.controls.academicProgramId.patchValue(student.academicProgramId);
    if (dob) {
      this.studentFormGroup.controls.dateOfBirth.patchValue(dob as never as Date);
    }
  }
  public save() {
    const studentValue = this.studentFormGroup.value;
    studentValue.academicProgram = undefined;
    studentValue.studentClasses = undefined;
    if (this.student) {
      this.httpClient.put('http://localhost:5161/Students', studentValue).subscribe();
    } else {
      studentValue.id = 0;
      this.httpClient.post('http://localhost:5161/Students', studentValue).subscribe();
    }
  }
}
