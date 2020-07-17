import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selftrackingapp/QuestionnaireRetriever.dart';
import 'package:selftrackingapp/models/FHIR.dart';
import 'package:selftrackingapp/pages/PatientListPage.dart';

class PatientRegistrationPage extends StatefulWidget {
  @override
  _PatientRegistrationPageState createState() {
    return _PatientRegistrationPageState();
  }
}

class _PatientRegistrationPageState extends State<PatientRegistrationPage> {
  Patient generatePatientFromResponse(Map<String, List<FHIRType>> answers) {
    return Patient(
      name: [
        HumanName(
          given: [
            (answers['first_name']?.first as StringType)?.value,
          ],
          family: (answers['last_name']?.first as StringType)?.value,
        ),
      ],
      address: [
        Address(
          line: [
            (answers['address_line_1']?.first as StringType)?.value,
          ],
          city: (answers['address_city']?.first as StringType)?.value,
          state: (answers['address_province']?.first as StringType)?.value,
          postalCode: (answers['address_postal_code']?.first as StringType)?.value,
          country: (answers['address_country']?.first as StringType)?.value,
        ),
      ],
      gender: (answers['gender']?.first as Coding)?.code,
      birthDate: (answers['date_of_birth']?.first as StringType)?.value,
      telecom: answers.containsKey('email') ? [
        ContactPoint(
          system: 'email',
          value: (answers['email']?.first as StringType)?.value,
        ),
      ] : null,
    );
  }

  void onDone(BuildContext context, QuestionnaireResponse response, Map<String, List<FHIRType>> answers) {
    response.authored = DateTime.now().toIso8601String();
    PatientListPage.registerPatient(generatePatientFromResponse(answers));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => PatientListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return QuestionnaireRetriever.getQuestionnaireFormWidget(
      'Self_Assessment_Patient_Demographics.json',
      onSubmit: [onDone],
    );
  }
}