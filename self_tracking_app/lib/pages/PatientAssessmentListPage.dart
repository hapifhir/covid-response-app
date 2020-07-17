import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:selftrackingapp/models/FHIR.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

    );
  }
}