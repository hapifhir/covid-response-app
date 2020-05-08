import { Component, OnInit, Input } from '@angular/core';
import { HttpService } from '../../services/http.service';
import { ActivatedRoute, Router } from '@angular/router';
import { environment } from '../../../environments/environment';
import { FhirOperationsService } from '../../services/fhir-operations.service'; 
import { v4 as uuidv4 } from 'uuid';
import * as FHIR from '../../interfaces/FHIR';

@Component({
  selector: 'app-admit-patient',
  templateUrl: './admit-patient.component.html',
  styleUrls: ['./admit-patient.component.css']
})
export class AdmitpatientComponent implements OnInit {
  questions: any;
  loadData: boolean;


  constructor(private httpService: HttpService, private route: ActivatedRoute, private fhirOperations: FhirOperationsService) { }

  ngOnInit(): void {
    this.loadForm();
  }

  loadForm() {
    this.httpService.getResourceByQueryParam('Questionnaire', '?identifier=WHO_Module_1').then(res => {
      const resource = res['entry'][0].resource;
      this.questions = resource;
      this.loadData = true;
    }).catch(error => {
      console.log(Promise.reject(error));
    });
  }

  async submitQuestionnaire(formQuestions: any) {
    console.log('formQuestions', formQuestions);

    // extract patient_demographics and save as Patient
    const patient_demographics = Object.assign({}, formQuestions.patient_demographics);
    delete formQuestions.patient_demographics;

    console.log('patient_demographics', patient_demographics);

    // create transaction bundle
    const transaction = new FHIR.Bundle();
    transaction.resourceType = 'Bundle';
    transaction.type = 'transaction';
    transaction.entry = [];

    // create patient resource
    const patientHL7 = this.fhirOperations.generatePatient(patient_demographics);
    const patient_temp_id = 'urn:uuid:' + uuidv4();
    const entry_one = new FHIR.Entry();
    entry_one.fullUrl = patient_temp_id;
    entry_one.resource = patientHL7;
    
    const req_one = new FHIR.Request();
    req_one.method = 'POST';
    req_one.url = 'Patient';

    entry_one.request = req_one;

    transaction.entry.push(entry_one);

    // create service request
    const serviceRequestHL7 = this.fhirOperations.generateServiceRequest(patient_temp_id);
    const serviceRequest_temp_id = 'urn:uuid:' + uuidv4();
    const entry_two = new FHIR.Entry();
    entry_two.fullUrl = serviceRequest_temp_id;
    entry_two.resource = serviceRequestHL7;

    const req_two = new FHIR.Request();
    req_two.method = 'POST';
    req_two.url = 'ServiceRequest';

    entry_two.request = req_two;

    transaction.entry.push(entry_two);
    
    // create question response resource
    const questionnaireResponse = this.fhirOperations.generateQuestionnaireResponse(formQuestions, this.questions, serviceRequest_temp_id);
    const entry_three = new FHIR.Entry();
    entry_three.resource = questionnaireResponse;

    const req_three = new FHIR.Request();
    req_three.method = 'POST';
    req_three.url = 'QuestionnaireResponse';

    entry_three.request = req_three;

    transaction.entry.push(entry_three);

    console.log('transaction', transaction);

    // const postQuestionnaireResponse = await this.httpService.postResource(questionnaireResponse);
    // start by collecting and submitting patient data to server

    const transactionResponse = await this.httpService.postTransaction(transaction);
    console.log('transactionResponse', transactionResponse);
  }

}


/*
PATIENT RESOURCE 
{
  "resourceType": "Patient",
  "extension": [
    {
      "url": "https://smilecdr.com/extensions/pregnant",
      "valueString": "yes"
    },
    {
      "url": "https://smilecdr.com/extensions/gestational-weeks-assessment",
      "valueString": "27"
    },
    {
      "url": "https://smilecdr.com/extensions/healthcare-worker",
      "valueString": "yes"
    },
    {
      "url": "https://smilecdr.com/extensions/laboratory-worker",
      "valueString": "no"
    }
  ],
  "active": true,
  "name": [
    {
      "family": "Farooqi",
      "given": [
        "Mohammad"
      ]
    }
  ],
  "gender": "female",
  "birthDate": "1964-05-15",
  "address": [
    {
      "line": [
        "1401-1850 Rathburn Road East"
      ],
      "city": "Mississauga",
      "state": "ON",
      "postalCode": "L4W 2X9",
      "country": "CA"
    }
  ]
}

SERVICE REQUEST
{
  "resourceType": "ServiceRequest",
  "status": "active",
  "intent": "order",
  "priority": "routine",
  "subject": {
    "reference": "Patient/example"
  },
  "authoredOn": "2013-05-02T16:16:00-07:00"
}

QUESTIONAIRE RESPONSE
{
  "resourceType": "QuestionnaireResponse",
  "extension": [
    {
      "url": "https://smilecdr.com/extensions/source-ip-address",
      "valueString": "99.235.112.176"
    }
  ],
  "basedOn": [
    {
      "reference": "ServiceRequest/123"
    }
  ],
  "questionnaire": "Questionnaire/360",
  "identifier": {
    "value": "SARS_Questionnaire_Response"
  },
  "status": "completed",
  "authored": "2020-05-06T19:34:01.643Z",
  "item": [
    {
      "linkId": "site_information",
      "text": "Site Information",
      "item": [
        {
          "linkId": "site_information_site_name",
          "answer": [
            {
              "valueString": "Test Hospital "
            }
          ]
        },
        {
          "linkId": "site_information_site_country",
          "answer": [
            {
              "valueString": "Canada"
            }
          ]
        }
      ]
    },
    {
      "linkId": "clinical_inclusion_criteria",
      "text": "Clinical Inclusion Criteria",
      "item": [
        {
          "linkId": "clinical_inclusion_criteria_proven_or_suspected_infected",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "clinical_inclusion_criteria_fever_history",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "clinical_inclusion_criteria_cough",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "clinical_inclusion_criteria_dyspnoea_tachypnoea",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "clinical_inclusion_criteria_clinical_suspicion_ari",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        }
      ]
    },
    {
      "linkId": "patient_demographics",
      "text": "Demographics",
      "item": [
        {
          "linkId": "patient_demographics_first_name",
          "answer": [
            {
              "valueString": "Mohammad"
            }
          ]
        },
        {
          "linkId": "patient_demographics_last_name",
          "answer": [
            {
              "valueString": "Farooqi"
            }
          ]
        },
        {
          "linkId": "patient_demographics_address_line_1",
          "answer": [
            {
              "valueString": "18 Abc Drive"
            }
          ]
        },
        {
          "linkId": "patient_demographics_address_city",
          "answer": [
            {
              "valueString": "Caledon"
            }
          ]
        },
        {
          "linkId": "patient_demographics_address_province",
          "answer": [
            {
              "valueString": "ON"
            }
          ]
        },
        {
          "linkId": "patient_demographics_address_postal_code",
          "answer": [
            {
              "valueString": "L7C3P6"
            }
          ]
        },
        {
          "linkId": "patient_demographics_address_country",
          "answer": [
            {
              "valueString": "Canada"
            }
          ]
        },
        {
          "linkId": "patient_demographics_sex_at_birth",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "male",
                "display": "Male"
              }
            }
          ]
        },
        {
          "linkId": "patient_demographics_date_of_birth",
          "answer": [
            {
              "valueDate": "1995-05-01T04:00:00.000Z"
            }
          ]
        },
        {
          "linkId": "patient_demographics_healthcare_worker",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "patient_demographics_laboratory_worker",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "unknown",
                "display": "Unknown"
              }
            }
          ]
        },
        {
          "linkId": "patient_demographics_pregnant",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "unknown",
                "display": "Unknown"
              }
            }
          ]
        }
      ]
    },
    {
      "linkId": "date_of_onset_and_admission_vital_signs",
      "text": "DATE OF ONSET ANDADMISSIONVITAL SIGNS (firstavailabledataatpresentation/admission)",
      "item": [
        {
          "linkId": "date_of_onset_and_admission_vital_signs_symptoms_onset",
          "answer": [
            {
              "valueDate": "2020-05-01T04:00:00.000Z"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_admission_date",
          "answer": [
            {
              "valueDate": "2020-05-02T04:00:00.000Z"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_temperature",
          "answer": [
            {
              "valueString": "21"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_heart_rate",
          "answer": [
            {
              "valueString": "22"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_respiratory_rate",
          "answer": [
            {
              "valueString": "12"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_bp_systolic",
          "answer": [
            {
              "valueString": "123"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_bp_diastolic",
          "answer": [
            {
              "valueString": "421"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_severe_dehydration",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_sternal_capillary_refill_time",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_oxygen_saturation",
          "answer": [
            {
              "valueString": "32"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_oxygen_saturation_on",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "oxygen_therapy",
                "display": "Oxygen Therapy"
              }
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_glascow_coma_score",
          "answer": [
            {
              "valueString": "23"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_malnutrition",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_mid_upper_arm_circumference",
          "answer": [
            {
              "valueString": "22"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_height",
          "answer": [
            {
              "valueString": "23"
            }
          ]
        },
        {
          "linkId": "date_of_onset_and_admission_vital_signs_weight",
          "answer": [
            {
              "valueString": "2"
            }
          ]
        }
      ]
    },
    {
      "linkId": "co_morbidities",
      "text": "CO-MORBIDITIES (existing prior to admission)(Unk= Unknown)",
      "item": [
        {
          "linkId": "co_morbidities_chronic_cardiac_disease",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_diabetes",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_hypertension",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_current_smoking",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_chronic_pulmonary_disease",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_tuberculosis",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_asthma",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_asplenia",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_chronic_kidney_disease",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "unknown",
                "display": "Unknown"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_malignant_neoplasm",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_chronic_liver_disease",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_chronic_neurological_disorder",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_hiv",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes_on_art",
                "display": "Yes-on-ART"
              }
            }
          ]
        },
        {
          "linkId": "co_morbidities_other",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        }
      ]
    },
    {
      "linkId": "pre_admission_and_chronic_medication",
      "text": "PRE-ADMISSION & CHRONIC MEDICATION (Were any of the following taken within 14 days of admission?)",
      "item": [
        {
          "linkId": "pre_admission_and_chronic_medication_ace_inhibitors",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "pre_admission_and_chronic_medication_arb",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "pre_admission_and_chronic_medication_nsaid",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        }
      ]
    },
    {
      "linkId": "signs_and_symptoms_on_admission",
      "text": "SIGNS AND SYMPTOMS ON ADMISSION(Unk = Unknown)",
      "item": [
        {
          "linkId": "signs_and_symptoms_on_admission_history_of_fever",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_cough",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_sore_throat",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_runny_nose",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_chest_pain",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_muscle_aches",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_joint_pain",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_fatigue_malaise",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_shortness_of_breath",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_inability_to_walk",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_lower_chest_wall_indrawing",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_headache",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_altered_consciousness_confusion",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_seizures",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_abdominal_pain",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_vomiting_nausea",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_diarrhoea",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_conjunctivities",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_skin_rash",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_skin_ulcers",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_lymphadenopathy",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "unknown",
                "display": "Unknown"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_bleeding",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "signs_and_symptoms_on_admission_other",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        }
      ]
    },
    {
      "linkId": "current_medication",
      "text": "MEDICATION",
      "item": [
        {
          "linkId": "current_medication_oral_orogastric_fluids",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "current_medication_intravenous_fluids",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "current_medication_antiviral",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "current_medication_antiviral_ribavirin",
          "answer": [
            {
              "valueBoolean": false
            }
          ]
        },
        {
          "linkId": "current_medication_antiviral_lopinavir_ritonavir",
          "answer": [
            {
              "valueBoolean": false
            }
          ]
        },
        {
          "linkId": "current_medication_antiviral_neuraminidase_inhibitor",
          "answer": [
            {
              "valueBoolean": false
            }
          ]
        },
        {
          "linkId": "current_medication_antiviral_interferon_beta",
          "answer": [
            {
              "valueBoolean": false
            }
          ]
        },
        {
          "linkId": "current_medication_antiviral_interferon_alpha",
          "answer": [
            {
              "valueBoolean": false
            }
          ]
        },
        {
          "linkId": "current_medication_antiviral_other",
          "answer": [
            {
              "valueBoolean": false
            }
          ]
        },
        {
          "linkId": "current_medication_corticosterold",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "current_medication_antibiotic",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "current_medication_antifungal_agent",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "current_medication_antimalarial_agent",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "current_medication_experimental_agent",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "current_medication_nsaid",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "current_medication_ace_inhibitors",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "current_medication_arbs",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        }
      ]
    },
    {
      "linkId": "supportive_care",
      "text": "Supportive Care",
      "item": [
        {
          "linkId": "supportive_care_icu_high_dependency_unit_admission",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "supportive_care_oxygen_therapy",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "supportive_care_non_invasive_ventilation",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        },
        {
          "linkId": "supportive_care_invasive_ventilation",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "supportive_care_inotropes_vasopressors",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "supportive_care_extracorporeal_support",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "supportive_care_prone_position",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "yes",
                "display": "Yes"
              }
            }
          ]
        }
      ]
    },
    {
      "linkId": "laboratory_results_on_admission",
      "text": "LABORATORY RESULTS ON ADMISSION",
      "item": [
        {
          "linkId": "laboratory_results_on_admission_haemoglobin_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_wbc_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_haematocrit_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_platelets_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_aptt_aptr_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_pt_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_inr_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_alt_sgpt_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_total_bilirubin_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_ast_sgot_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_urea_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_lactate_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_creatinine_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_sodium_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_potassium_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_procalcitonin_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_ldh_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_creatine_kinase_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_troponin_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_esr_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_d_dimer_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_ferritin_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        },
        {
          "linkId": "laboratory_results_on_admission_il_6_test_conducted",
          "answer": [
            {
              "valueCoding": {
                "system": "https://localhost/Questionnaire",
                "code": "no",
                "display": "No"
              }
            }
          ]
        }
      ]
    }
  ]
}
*/