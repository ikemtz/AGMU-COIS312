import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddEditStudentComponent } from './add-edit-student.component';
import { HttpClient } from '@angular/common/http';
import { DatePipe } from '@angular/common';
import { MAT_DIALOG_DATA, MatDialogModule } from '@angular/material/dialog';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatSelectModule } from '@angular/material/select';
import { ReactiveFormsModule } from '@angular/forms';
import { NoopAnimationsModule } from '@angular/platform-browser/animations';
import { IStudent, createTestStudent } from 'src/models';
import { of } from 'rxjs';

describe('AddEditStudentComponent', () => {
  let component: AddEditStudentComponent;
  let fixture: ComponentFixture<AddEditStudentComponent>;
  describe('EditStudentComponent', () => {
    const studentData: IStudent = createTestStudent();
    let httpClient: HttpClient;
    beforeEach(() => {
      TestBed.configureTestingModule({
        declarations: [AddEditStudentComponent],
        imports: [MatDialogModule, MatFormFieldModule, MatInputModule, MatDatepickerModule, MatNativeDateModule, MatSelectModule, ReactiveFormsModule,
          NoopAnimationsModule],
        providers: [
          {
            provide: HttpClient, useValue: {
              put: () => of(),
              post: () => of()
            }
          },
          { provide: DatePipe, useValue: { transform: () => new Date() } },
          { provide: MAT_DIALOG_DATA, useValue: studentData }
        ]
      });
      fixture = TestBed.createComponent(AddEditStudentComponent);
      httpClient = TestBed.inject(HttpClient);
      component = fixture.componentInstance;
      fixture.detectChanges();
    });

    it('should create', () => {
      expect(component).toBeTruthy();
      expect(component.studentFormGroup.value).toEqual(
        {
          id: 0,
          academicProgramId: 0,
          name: 'NAME',
          dateOfBirth: component.studentFormGroup.value.dateOfBirth,
          phoneNumber: 'PHONE_NUMBER',
          academicProgram: {
            id: null,
            name: '',
            courses: [],
            students: []
          },
          studentClasses: []
        }
      );
    });

    it('should save', () => {
      const putSpy = spyOn(httpClient, 'put').and.returnValue(of());
      const postSpy = spyOn(httpClient, 'post').and.returnValue(of());
      component.save();
      expect(putSpy).toHaveBeenCalledTimes(1);
      expect(putSpy).toHaveBeenCalledWith('http://localhost:5161/Students', {
        ...studentData,
        studentClasses: undefined,
        dateOfBirth: component.studentFormGroup.value.dateOfBirth,
      });
      expect(postSpy).toHaveBeenCalledTimes(0);
    });
  });
  describe('AddStudentComponent', () => {
    const studentData = undefined;
    let httpClient: HttpClient;
    beforeEach(() => {
      TestBed.configureTestingModule({
        declarations: [AddEditStudentComponent],
        imports: [MatDialogModule, MatFormFieldModule, MatInputModule, MatDatepickerModule, MatNativeDateModule, MatSelectModule, ReactiveFormsModule,
          NoopAnimationsModule],
        providers: [
          {
            provide: HttpClient, useValue: {
              put: () => of(),
              post: () => of()
            }
          },
          { provide: DatePipe, useValue: { transform: () => new Date() } },
          { provide: MAT_DIALOG_DATA, useValue: studentData }
        ]
      });
      fixture = TestBed.createComponent(AddEditStudentComponent);
      httpClient = TestBed.inject(HttpClient);
      component = fixture.componentInstance;
      fixture.detectChanges();
    });

    it('should create', () => {
      expect(component).toBeTruthy();
      expect(component.studentFormGroup.value).toEqual(
        {
          id: null,
          academicProgramId: null,
          name: null,
          dateOfBirth: component.studentFormGroup.value.dateOfBirth,
          phoneNumber: null,
          academicProgram: {
            id: null,
            name: '',
            courses: [],
            students: []
          },
          studentClasses: []
        }
      );
    });

    it('should save', () => {
      const putSpy = spyOn(httpClient, 'put').and.returnValue(of());
      const postSpy = spyOn(httpClient, 'post').and.returnValue(of());
      component.save();
      expect(putSpy).toHaveBeenCalledTimes(0);
      expect(postSpy).toHaveBeenCalledTimes(1);
      expect(postSpy).toHaveBeenCalledWith('http://localhost:5161/Students', {
        id: 0,
        academicProgramId: null,
        name: null, dateOfBirth: null,
        phoneNumber: null,
        academicProgram: undefined,
        studentClasses: undefined
      });
    });
  });
});
