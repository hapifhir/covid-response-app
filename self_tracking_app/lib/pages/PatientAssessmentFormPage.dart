import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selftrackingapp/QuestionnaireRetriever.dart';

import 'package:selftrackingapp/models/FHIR.dart';
import 'package:selftrackingapp/pages/PatientAssessmentListPage.dart';

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

  void onDone(BuildContext context, QuestionnaireResponse response, Map<String, List<FHIRType>> answers) {
    response.authored = DateTime.now().toIso8601String();
    PatientListPage.registerAssessment(widget.patient, response);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (ctx) => PatientAssessmentListPage(widget.patient),
      ),
    ).then((_) => setState(() => _));
  }
}