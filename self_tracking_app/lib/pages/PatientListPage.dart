import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selftrackingapp/DBService.dart';

import 'package:selftrackingapp/models/FHIR.dart';
import 'package:selftrackingapp/models/FHIRResources.dart';
import 'package:selftrackingapp/pages/PatientAssessmentPage.dart';
import 'package:uuid/uuid.dart';

List<Patient> _registeredPatients = [];
Map<Patient, List<QuestionnaireResponse>> _assessments = {};

class PatientListPage extends StatefulWidget {
  final String title = 'Patient List';
  final dbService = new DBService();

  static void registerPatient(Patient patient) {
    _registeredPatients.add(patient);
  }

  static void registerAssessment(
      Patient patient, QuestionnaireResponse assessment) {
    var uuid = new Uuid();
    if (_assessments[patient] == null) {
      _assessments[patient] = [];
    }
    FHIRResources fhirResources = new FHIRResources();
    _assessments[patient].add(assessment);
    List<String> questionnaireResponses = [];
    _assessments.forEach((key, value) => {
          if (key.id != null)
            {
              key.id = 'urn:uuid:' + uuid.v4(),
              fhirResources.patient = (key.toJson()).toString(),
              print(key.toJson()),
              for (var i = 0; i < value.length; i++)
                {
                  value[i].subject = new Reference(),
                  value[i].subject.reference = key.id,
                  questionnaireResponses.add(value[i].toJson().toString())
                },
                fhirResources.questionnaireResponse = questionnaireResponses.toString(),
                DBService().saveFHIRResources(fhirResources)
            }
        });
  }

  @override
  _PatientListPageState createState() {
    return _PatientListPageState();
  }
}

class _PatientListPageState extends State<PatientListPage> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: ListView.separated(
          itemCount: _registeredPatients.length,
          controller: _scrollController,
          itemBuilder: (context, index) {
            return _generatePatientListItemWidget(_registeredPatients[index]);
          },
          separatorBuilder: (context, index) {
            return Divider();
          },
        )));
  }

  Widget _generatePatientListItemWidget(Patient patient) {
    int i = _assessments[patient]?.length ?? 0;
    return ListTile(
        title: Text(
            '${patient?.name?.first?.given?.first} ${patient?.name?.first?.family} (Total assessments: $i)'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PatientAssessmentPage(patient),
            ),
          ).then((_) => setState(() => _));
        });
  }
}
