import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selftrackingapp/QuestionnaireRetriever.dart';
import 'package:selftrackingapp/helpers/FutureHelper.dart';

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
    PatientListPage.registerAssessment(int.parse(widget.patient.id), response);
    Future<List<QuestionnaireResponse>> assessments = PatientListPage.getAssessments(int.parse(widget.patient.id));
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) {
          return FutureHelper.getStandardFutureBuilder(assessments, (data) => PatientListPage());
        },
      ),
      ModalRoute.withName('/')
    );
  }
}