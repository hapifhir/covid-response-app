import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selftrackingapp/DBService.dart';
import 'package:selftrackingapp/JsonSerializer.dart';
import 'package:selftrackingapp/helpers/FutureHelper.dart';

import 'package:selftrackingapp/models/FHIRResources.dart';
import 'package:selftrackingapp/models/FHIR.dart';
import 'package:selftrackingapp/pages/PatientAssessmentPage.dart';
import 'package:uuid/uuid.dart';
import 'package:sqflite/sqflite.dart';

import 'PatientAssessmentListPage.dart';

class PatientListPage extends StatefulWidget {
  final String title = 'Patient List';
  final dbService = new DBService();

  static Future<int> registerPatient(Patient patient) async {
    if (patient == null)
      return null;
    FHIRResources resource = await DBService().saveFHIRResources(
        FHIRResources(
          patient: JsonSerializer().serialize(patient),
        )
    );
    return resource.patientId;
  }

  static Future<List<QuestionnaireResponse>> getAssessments(int patientId) async {
    Database db = await DBService().db;
    List<Map<String, dynamic>> data = await db.query('FHIRResources', where: 'patientId = ?', whereArgs: [patientId]);
    if (data?.length == 0 ?? true) {
      return [];
    }
    List<QuestionnaireResponse> result = [];
    for (Map<String, dynamic> json in data) {
      FHIRResources fhirResources = FHIRResources.fromJson(json);
      if (fhirResources.patientId == patientId) {
        List<dynamic> innerData;
        if (fhirResources?.questionnaireResponse?.isEmpty ?? true)
          innerData = [];
        else
          innerData = JsonDecoder().convert(fhirResources.questionnaireResponse);
        for (Map<String, dynamic> innerJson in innerData) {
          result.add(JsonSerializer().deserialize(JsonEncoder().convert(innerJson)));
        }
      }
    }
    print('total assessments = ${result.length}');
    return result;
  }

  static Future<int> registerAssessment(
      int patientId, QuestionnaireResponse assessment) async {
    Database db = await DBService().db;
    List<Map<String, dynamic>> result = await db.query('FHIRResources', where: 'patientId = ?', whereArgs: [patientId]);
    if (result?.length == 0 ?? true) {
      return null;
    }

    Map<String, dynamic> theJson = result.first;
    assessment.subject = Reference(reference: 'Patient/$patientId');
    FHIRResources fhirResources = FHIRResources.fromJson(theJson);

    List<QuestionnaireResponse> assessments = [];
    List<dynamic> assessmentsJson;
    if (fhirResources?.questionnaireResponse?.isEmpty ?? true)
      assessmentsJson = [];
    else
      assessmentsJson = JsonDecoder().convert(fhirResources.questionnaireResponse);
    if (assessmentsJson?.isNotEmpty ?? false) {
      for (Map<String, dynamic> json in assessmentsJson) {
        assessments.add(JsonSerializer().deserialize(JsonEncoder().convert(json)));
      }
    }
    assessments.add(assessment);

    List<Map<String, dynamic>> finishedJson = [];
    for (QuestionnaireResponse response in assessments) {
      finishedJson.add(JsonDecoder().convert(JsonSerializer().serialize(response)));
    }
    fhirResources.questionnaireResponse = JsonEncoder().convert(finishedJson);
    print(fhirResources.questionnaireResponse);

    return db.update('FHIRResources', fhirResources.toMap(), where: 'patientId = ?', whereArgs: [patientId]);
  }

  @override
  _PatientListPageState createState() {
    return _PatientListPageState();
  }

}

class _PatientListPageState extends State<PatientListPage> {
  ScrollController _scrollController;
  DateTime now;
  DBService _dbService = DBService();
  Future<List<FHIRResources>> _future;
  Future<List<List<QuestionnaireResponse>>> futureAssessments;

  @override
  void initState() {
    _scrollController = ScrollController();
    _future = _getResources();
    now = DateTime.now();
    super.initState();
  }

  Future<List<FHIRResources>> _getResources() async {
    List<Map<String, dynamic>> data = await _dbService.getBySqlQuery('SELECT * from FHIRResources');
    List<FHIRResources> result = [];
    for (Map<String, dynamic> json in data) {
      print(JsonEncoder.withIndent('   ').convert(json));
      FHIRResources fhirResources = FHIRResources.fromJson(json);
      result.add(fhirResources);
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureHelper.getStandardFutureBuilder(_future, (data) => _getWidget(data)),
    );
  }

  Widget _getWidget(List<FHIRResources> resources) {
    List<Patient> patients = _getPatients(resources);
    List<List<QuestionnaireResponse>> patientAssessments = _getAssessments(resources);
    return Center(
      child: ListView.separated(
        itemCount: patients.length,
        controller: _scrollController,
        itemBuilder: (context, index) {
          return _generatePatientListItemWidget(patients?.elementAt(index) ?? [], patientAssessments?.elementAt(index) ?? []);
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      )
    );
  }

  static List<List<QuestionnaireResponse>> _getAssessments(List<FHIRResources> resources) {
    List<List<QuestionnaireResponse>> result = [];
    for (FHIRResources resource in resources) {
      List<QuestionnaireResponse> assessments = [];
      List<dynamic> data;
      if (resource.questionnaireResponse?.isEmpty ?? true)
        data = [];
      else
        data = JsonDecoder().convert(resource.questionnaireResponse);
      if (data == null)
        data = [];
      for (Map<String, dynamic> innerJson in data) {
        assessments.add(JsonSerializer().deserialize(JsonEncoder().convert(innerJson)));
      }
      result.add(assessments);
    }
    return result;
  }

  static List<Patient> _getPatients(List<FHIRResources> resources) {
    List<Patient> result = [];
    for (FHIRResources resource in resources) {
      Patient patient = JsonSerializer().deserialize(resource.patient);
      patient.id = resource.patientId.toString();
      result.add(patient);
    }
    return result;
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

  Widget _generatePatientListItemWidget(Patient patient, List<QuestionnaireResponse> assessments) {
    int i = assessments?.length ?? 0;
    DateTime birthDate;
    if (patient?.birthDate != null)
      birthDate = DateTime.parse(patient?.birthDate);
    else
      birthDate = null;
    return Card(
        child: ExpansionTile(
          title: Text('${patient?.name?.first?.given?.first} ${patient?.name?.first?.family}'),
          trailing: Icon(Icons.keyboard_arrow_down),
          subtitle: Text(
              'Age: ${_generateAgeString(birthDate)}\n' +
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
                      builder: (ctx) => PatientAssessmentListPage(patient, assessments),
                    ),
                  ).then((_) => setState(() => _));
                }
            ),
          ],
        )
    );
  }
}