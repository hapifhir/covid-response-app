import { TestBed } from '@angular/core/testing';

import { FhirOperationsService } from './fhir-operations.service';

describe('FhirOperationsService', () => {
  let service: FhirOperationsService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(FhirOperationsService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
