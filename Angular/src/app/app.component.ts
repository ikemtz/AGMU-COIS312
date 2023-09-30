import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { Observable, delay } from 'rxjs';
import { ClassProperties, IStudent, StudentClassProperties, StudentProperties } from 'src/models';
import { MatDialog } from '@angular/material/dialog';
import { AddEditStudentComponent } from './add-edit-student/add-edit-student.component';
import { trigger, state, style, transition, animate } from '@angular/animations';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss'],
  animations: [
    trigger('detailExpand', [
      state('collapsed', style({ height: '0px', minHeight: '0' })),
      state('expanded', style({ height: '*' })),
      transition('expanded <=> collapsed', animate('225ms cubic-bezier(0.4, 0.0, 0.2, 1)')),
    ]),]
})
export class AppComponent {
  public studentData$: Observable<IStudent[]>;
  public props = StudentProperties;

  public expandedElement: IStudent | null = null;
  public readonly columnsToDisplay: string[] = [
    'expand',
    StudentProperties.ID,
    StudentProperties.ACADEMIC_PROGRAM_ID,
    StudentProperties.NAME,
    StudentProperties.PHONE_NUMBER,
    StudentProperties.DATE_OF_BIRTH,
    'edit'
  ];
  public readonly subColumnsToDisplay: string[] = [
    StudentClassProperties.CLASS,
    StudentClassProperties.GRADE,
    ClassProperties.STAFF
  ];

  constructor(
    private readonly httpClient: HttpClient,
    private readonly dialog: MatDialog) {
    this.studentData$ = this.httpClient.get<IStudent[]>('http://localhost:5161/Students');
  }

  private openDialog(student?: IStudent) {
    const dialogRef = this.dialog.open(AddEditStudentComponent, {
      data: student,
      height: '320px',
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
  public expandRow(element: IStudent) {
    if (this.expandedElement == element) {
      this.expandedElement = null;
    } else {
      this.expandedElement = element;
    }
  }
}
