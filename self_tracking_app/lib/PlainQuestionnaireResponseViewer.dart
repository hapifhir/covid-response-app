import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selftrackingapp/models/FHIR.dart';

class PlainQuestionnaireResponseViewer extends StatefulWidget {
  final QuestionnaireResponse response;
  final String title;

  PlainQuestionnaireResponseViewer(this.response, this.title);

  _PlainQuestionnaireResponseViewerState createState() {
    return _PlainQuestionnaireResponseViewerState();
  }
}

class _PlainQuestionnaireResponseViewerState extends State<PlainQuestionnaireResponseViewer> {
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
      body: ListView(
        children: _getWidgets(context),
        scrollDirection: Axis.vertical,
      )
    );
  }

  static dynamic _getAnswerValue(Answer answer) {
    return answer.valueReference ??
        answer.valueCoding ??
        answer.valueDate ??
        answer.valueString ??
        answer.valueTime;
  }

  static dynamic _getAnswerDisplay(Answer answer) {
    return answer.valueCoding?.display ??
        answer.valueReference?.display ??
        answer.valueDate               ??
        answer.valueTime               ??
        answer.valueString             ??
        '[EMPTY]';
  }

  List<Widget> _getWidgets(BuildContext context) {
    List<Widget> result = [];

    if (widget.response == null || widget.response.item == null)
      return result;

    for (QuestionnaireResponseItem item in widget.response.item) {
      if (item == null)
        continue;
      List<TextSpan> children = [];
      for (Answer answer in item.answer) {
        children.add(
          TextSpan(
            text: _getAnswerDisplay(answer) ?? '',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
          )
        );
        result.add(
          Card(
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontStyle: FontStyle.normal, fontSize: 18.0),
                text: '${item.linkId}: ',
                children: children,
              )
            )
          )
        );
      }
    }
    return result;
  }
}