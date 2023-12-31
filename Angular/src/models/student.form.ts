/* eslint-disable @typescript-eslint/no-unused-vars */
/* istanbul ignore file */
/**
 * This file is generated by the openapi-ts-generator
 * #form.ts.hbs
 * For issues or feature request, visit the repo: https://github.com/ikemtz/openapi-ts-generator
 * Do not edit.
 */
import { FormControl, FormArray, FormGroup } from '@angular/forms'; //NOSONAR
import { IAcademicProgramForm } from './academic-program.form';
import { IStudentClassForm } from './student-class.form';

export interface IStudentForm {
    id: FormControl<number | null | undefined>;
    academicProgramId: FormControl<number | null | undefined>;
    name: FormControl<string | null | undefined>;
    dateOfBirth: FormControl<Date | null | undefined>;
    phoneNumber: FormControl<string | null | undefined>;
    academicProgram: FormGroup<IAcademicProgramForm>;
    studentClasses: FormArray<FormGroup<IStudentClassForm>>;
}
