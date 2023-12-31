/* istanbul ignore file */
/**
 * This file is generated by the openapi-ts-generator
 * #model.ts.hbs
 * For issues or feature request, visit the repo: https://github.com/ikemtz/openapi-ts-generator
 * Do not edit.
 */

import { ICourse } from './course.model';
import { IStudent } from './student.model';

// eslint-disable-next-line @typescript-eslint/no-empty-interface
export interface IAcademicProgram {
  id?: number | null;
  name?: string;
  courses?: Partial<ICourse[]>;
  students?: Partial<IStudent[]>;
}
