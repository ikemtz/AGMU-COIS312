import { TestBed, fakeAsync, tick } from '@angular/core/testing';
import { RouterTestingModule } from '@angular/router/testing';
import { AppComponent } from './app.component';
import { HttpClient } from '@angular/common/http';
import { MatDialog } from '@angular/material/dialog';
import { of } from 'rxjs';
import { NO_ERRORS_SCHEMA } from '@angular/compiler';
import { CUSTOM_ELEMENTS_SCHEMA } from '@angular/core';
import { MatTableModule } from '@angular/material/table';
import { createTestStudent } from 'src/models';

describe('AppComponent', () => {
  beforeEach(() => TestBed.configureTestingModule({
    imports: [RouterTestingModule, MatTableModule],
    declarations: [AppComponent],
    providers: [
      { provide: HttpClient, useValue: { get: () => of([]) } },
      { provide: MatDialog, useValue: { open: () => undefined } }
    ],
    schemas: [NO_ERRORS_SCHEMA, CUSTOM_ELEMENTS_SCHEMA]
  }));

  it('should create the app', () => {
    const httpClient = TestBed.inject(HttpClient);
    const httpGetSpy = spyOn(httpClient, 'get').and.returnValue(
      of([])
    );
    const fixture = TestBed.createComponent(AppComponent);
    const app = fixture.componentInstance;
    expect(app).toBeTruthy();

    expect(httpGetSpy).toHaveBeenCalledWith('http://localhost:5161/Students');
    expect(httpGetSpy).toHaveBeenCalledTimes(1);
  });

  it('should open dialog for new student', fakeAsync(() => {
    const httpClient = TestBed.inject(HttpClient);
    const httpGetSpy = spyOn(httpClient, 'get').and.returnValue(
      of([])
    );
    const fixture = TestBed.createComponent(AppComponent);
    const dialog = TestBed.inject(MatDialog);
    const dialogOpenSpy = spyOn(dialog, 'open').and.returnValue(
      { afterClosed: () => of({}) } as never
    );

    const app = fixture.componentInstance;
    app.addNewStudent();
    tick(2000);
    expect(dialogOpenSpy).toHaveBeenCalledTimes(1);
    expect(httpGetSpy).toHaveBeenCalledWith('http://localhost:5161/Students');
    expect(httpGetSpy).toHaveBeenCalledTimes(2);
  }));


  it('should open dialog for editing a student', fakeAsync(() => {
    const httpClient = TestBed.inject(HttpClient);
    const httpGetSpy = spyOn(httpClient, 'get').and.returnValue(
      of([])
    );
    const fixture = TestBed.createComponent(AppComponent);
    const dialog = TestBed.inject(MatDialog);
    const dialogOpenSpy = spyOn(dialog, 'open').and.returnValue(
      { afterClosed: () => of({}) } as never
    );

    const app = fixture.componentInstance;
    app.editStudent(createTestStudent());
    tick(2000);
    expect(dialogOpenSpy).toHaveBeenCalledTimes(1);
    expect(httpGetSpy).toHaveBeenCalledWith('http://localhost:5161/Students');
    expect(httpGetSpy).toHaveBeenCalledTimes(2);
  }));
});
