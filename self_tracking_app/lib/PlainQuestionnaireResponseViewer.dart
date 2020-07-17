import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selftrackingapp/models/FHIR.dart';

class PlainQuestionnaireResponseViewer extends StatefulWidget {
  final QuestionnaireResponse response;
  final String title;

  PlainQuestionnaireResponseViewer(this.response, {this.title});

  _PlainQuestionnaireResponseViewerState createState() {
    return _PlainQuestionnaireResponseViewerState();
  }
}

class _PlainQuestionnaireResponseViewerState extends State<PlainQuestionnaireResponseViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title) ?? '',
      ),
    );
  }
}