import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:selftrackingapp/models/FHIR.dart';
import 'package:selftrackingapp/pages/PatientListPage.dart';

import 'PatientAssessmentFormPage.dart';

class PatientAssessmentListPage extends StatefulWidget {
  final String title = 'Assessment List';
  final Patient patient;

  PatientAssessmentListPage(this.patient);

  @override
  _PatientAssessmentListPageState createState() {
    return _PatientAssessmentListPageState();
  }
}

class _PatientAssessmentListPageState extends State<PatientAssessmentListPage> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<QuestionnaireResponse> assessments = PatientListPage.getAssessments(widget.patient);
    int assessmentCount = assessments?.length ?? 0;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientAssessmentPage(widget.patient),
                ),
              ).then((_) => setState(() => _));
            },
          ),
        ],
      ),
      body: Center(
        child: assessmentCount == 0 ?
            Text('No registered assessments') :
            ListView.builder(
              itemCount: assessmentCount,
              controller: _scrollController,
              itemBuilder: (context, index) {
                return _generateAssessmentListItemWidget(assessments[index]);
              },
            ),
      )
    );
  }

  final DateFormat _dateFormat = DateFormat('EEE, MMM d, HH:mm');

  Widget _generateAssessmentListItemWidget(QuestionnaireResponse response) {
    return Card(
      child: ListTile(
        title: Text(_dateFormat.format(DateTime.parse(response.authored)).toString()),
        trailing: Icon(Icons.keyboard_arrow_right),
      )
    );
  }
}