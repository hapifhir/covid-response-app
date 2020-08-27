import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:selftrackingapp/PlainQuestionnaireResponseViewer.dart';
import 'package:selftrackingapp/helpers/FutureHelper.dart';

import 'package:selftrackingapp/models/FHIR.dart';
import 'package:selftrackingapp/pages/PatientListPage.dart';

import 'PatientAssessmentFormPage.dart';

class PatientAssessmentListPage extends StatefulWidget {
  final String title = 'Assessment List';
  final Patient patient;
  final List<QuestionnaireResponse> assessments;

  PatientAssessmentListPage(this.patient, this.assessments);

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
    Future<List<QuestionnaireResponse>> assessments = PatientListPage.getAssessments(int.parse(widget.patient.id));
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
      body: FutureHelper.getStandardFutureBuilder(assessments, (data) => _getWidget(data)),
    );
  }

  Widget _getWidget(List<QuestionnaireResponse> assessments) {
    int assessmentCount = assessments?.length ?? 0;
    return Center(
      child: assessmentCount == 0 ?
          Text('No registered assessments') :
          ListView.builder(
            itemCount: assessmentCount,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return _generateAssessmentListItemWidget(assessments[index]);
            }
          ),
    );
  }

  final DateFormat _dateFormat = DateFormat('EEE, MMM d, HH:mm');

  Widget _generateAssessmentListItemWidget(QuestionnaireResponse response) {
    return Card(
      child: ListTile(
        title: Text(_dateFormat.format(DateTime.parse(response.authored)).toString()),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (ctx) => PlainQuestionnaireResponseViewer(response, 'Assessment'),
            ),
          ).then((_) => setState(() => _));
        }
      )
    );
  }
}