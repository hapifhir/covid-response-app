import 'package:flutter/cupertino.dart';
import 'package:selftrackingapp/QuestionnaireRetriever.dart';

import 'package:selftrackingapp/models/FHIR.dart';

import 'PatientListPage.dart';

class PatientAssessmentPage extends StatefulWidget {
  final Patient patient;

  PatientAssessmentPage(this.patient);

  @override
  _PatientAssessmentPageState createState() {
    return _PatientAssessmentPageState();
  }
}

class _PatientAssessmentPageState extends State<PatientAssessmentPage> {
  @override
  Widget build(BuildContext context) {
    return QuestionnaireRetriever.getQuestionnaireFormWidget(
        'Self_Assessment_Daily_Assessment.json',
        onSubmit: [onDone]
    );
  }

  void onDone(QuestionnaireResponse response, Map<String, List<FHIRType>> answers) {
    PatientListPage.registerAssessment(widget.patient, response);
  }
}