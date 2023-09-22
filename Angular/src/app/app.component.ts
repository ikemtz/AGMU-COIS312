import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormGroup } from '@angular/forms';
import { Observable } from 'rxjs';
import { IStudent, IStudentForm, StudentFormGroupFac } from 'src/models';
import { DatePipe } from '@angular/common';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.sass']
})
export class AppComponent {
  title = 'Angular Is Awesome';
  public studentData$: Observable<IStudent[]>;
  public studentFormGroup: FormGroup<IStudentForm>;


  constructor(
    private readonly httpClient: HttpClient,
    private readonly datePipe: DatePipe) {
    this.studentData$ = this.httpClient.get<IStudent[]>('http://localhost:5161/Students');
    this.studentFormGroup = StudentFormGroupFac()
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
    this.httpClient.put('http://localhost:5161/Students', studentValue).subscribe();
  }
  public AddNew() {
    const studentValue = this.studentFormGroup.value;
    studentValue.id = 0;
    studentValue.academicProgram = undefined;
    studentValue.studentClasses = undefined;
    this.httpClient.post('http://localhost:5161/Students', studentValue).subscribe();
  }
}
