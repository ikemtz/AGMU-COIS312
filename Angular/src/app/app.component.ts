import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable, delay } from 'rxjs';
import { IStudent, StudentProperties } from 'src/models';
import { MatDialog } from '@angular/material/dialog';
import { AddEditStudentComponent } from './add-edit-student/add-edit-student.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent {
  public studentData$: Observable<IStudent[]>;
  public props = StudentProperties;

  public readonly displayedColumns: string[] = [
    StudentProperties.ID,
    StudentProperties.ACADEMIC_PROGRAM_ID,
    StudentProperties.NAME,
    'edit'
  ];
  constructor(
    private readonly httpClient: HttpClient,
    private readonly dialog: MatDialog) {
    this.studentData$ = this.httpClient.get<IStudent[]>('http://localhost:5161/Students');
  }

  private openDialog(student?: IStudent) {
    const dialogRef = this.dialog.open(AddEditStudentComponent, {
      data: student,
      height: '500px',
      width: '600px',
    });

    dialogRef.afterClosed().pipe(delay(2000)).subscribe(() => {
      this.studentData$ = this.httpClient.get<IStudent[]>('http://localhost:5161/Students');
    });
  }

  public addNewStudent() {
    this.openDialog();
  }
  public editStudent(student: IStudent) {
    this.openDialog(student);
  }
}
