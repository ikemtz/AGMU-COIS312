/* istanbul ignore file */
/**
 * This file is generated by the openapi-ts-generator
 * #test-object-factory.ts.hbs
 * For issues or feature request, visit the repo: https://github.com/ikemtz/openapi-ts-generator
 * Do not edit.
 */

import { StudentClassProperties } from './student-class.properties';

export function createTestStudentClass() {
    return { 
      [StudentClassProperties.ID]: 0,
      [StudentClassProperties.STUDENT_ID]: 0,
      [StudentClassProperties.CLASS_ID]: 0,
      [StudentClassProperties.GRADE]: 'GRADE', 
      [StudentClassProperties.CLASS]: undefined,
      [StudentClassProperties.STUDENT]: undefined,
    };
}
