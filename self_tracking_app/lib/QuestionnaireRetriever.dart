import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selftrackingapp/PlainQuestionnaireFormGenerator.dart';
import 'package:selftrackingapp/models/FHIR.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:selftrackingapp/JsonSerializer.dart';

class QuestionnaireRetriever {

  static Future<Questionnaire> getQuestionnaire(String filename) async {
    String questionnaireJson = await rootBundle.loadString('assets/questionnaires/$filename');
    return JsonSerializer().deserialize(questionnaireJson);
  }

  static String getDisplayOfFHIRType(FHIRType element) {
    if (element == null)
      return null;

    switch (element.runtimeType) {
      case StringType: return (element as StringType)?.value;
      case Coding: return (element as Coding)?.code;
    }

    return null;
  }

  static Future<PlainQuestionnaireFormGenerator> getQuestionnaireForm(String filename, {
    Map<String, ItemToWidgetFunc> overrideWidgets,
    List<OnSubmitFunc> onSubmit
  }) async {
    return PlainQuestionnaireFormGenerator(
      await getQuestionnaire(filename),
      overrideWidgets: overrideWidgets,
      onSubmit: onSubmit,
    );
  }

  static Widget getQuestionnaireFormWidget(String filename, {
    Map<String, ItemToWidgetFunc> overrideWidgets,
    List<OnSubmitFunc> onSubmit
  }) {
    return FutureBuilder<PlainQuestionnaireFormGenerator>(
      future: getQuestionnaireForm(filename, overrideWidgets: overrideWidgets, onSubmit: onSubmit),
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return snapshot.data;
        else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        return CircularProgressIndicator();
      }
    );
  }



}