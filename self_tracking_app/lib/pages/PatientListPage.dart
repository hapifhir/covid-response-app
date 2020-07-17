import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:selftrackingapp/models/FHIR.dart';
import 'package:selftrackingapp/pages/PatientAssessmentListPage.dart';
import 'package:selftrackingapp/pages/PatientAssessmentFormPage.dart';

List<Patient> _registeredPatients = [];
Map<Patient, List<QuestionnaireResponse>> _assessments = {};

class PatientListPage extends StatefulWidget {
  final String title = 'Patient List';

  static void registerPatient(Patient patient) {
    _registeredPatients.add(patient);
  }

  static List<QuestionnaireResponse> getAssessments(Patient patient) {
    return _assessments[patient];
  }

  static void registerAssessment(Patient patient, QuestionnaireResponse assessment) {
    if (_assessments[patient] == null) {
      _assessments[patient] = [];
    }

    _assessments[patient].add(assessment);
  }

  @override
  _PatientListPageState createState() {
    return _PatientListPageState();
  }

}

class _PatientListPageState extends State<PatientListPage> {
  ScrollController _scrollController;
  DateTime now;

  @override
  void initState() {
    _scrollController = ScrollController();
    now = DateTime.now();
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
        )
      )
    );
  }

  static String _generateAgeString(DateTime birthDate) {
    if (birthDate == null)
      return '?';
    DateTime now = DateTime.now();
    int years = now.year - birthDate.year - 1;
    int months = (now.month - birthDate.month) % 12;
    if (now.year  >= birthDate.year &&
        now.month >= birthDate.month &&
        now.day   >= birthDate.day) {
      years += 1;
    }
    if (months < 0) {
      months = months + 12;
    }
    return '$years year${years == 1 ? "" : "s"}, ' +
           '$months month${months == 1 ? "" : "s"}';
  }

  Widget _generatePatientListItemWidget(Patient patient) {
    int i = _assessments[patient]?.length ?? 0;
    return Card(
      child: ExpansionTile(
        title: Text('${patient?.name?.first?.given?.first} ${patient?.name?.first?.family}'),
        trailing: Icon(Icons.keyboard_arrow_down),
        subtitle: Text(
            'Age: ${_generateAgeString(DateTime.parse(patient?.birthDate))}\n' +
            'Total assessments: $i'
        ),
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Details'),
          ),
          ListTile(
            leading: Icon(Icons.view_list),
            title: Text('Assessments'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => PatientAssessmentListPage(patient),
                ),
              ).then((_) => setState(() => _));
            }
          ),
        ],
      )
    );
  }
}