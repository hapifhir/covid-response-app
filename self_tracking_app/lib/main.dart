import 'package:flutter/material.dart';
import 'package:selftrackingapp/DBService.dart';
import 'package:selftrackingapp/pages/HomePage.dart';
import 'package:selftrackingapp/pages/PatientListPage.dart';
import 'package:selftrackingapp/pages/PatientRegistrationPage.dart';
import 'package:selftrackingapp/pages/UserSettingsPage.dart';
import 'package:selftrackingapp/pages/UserTrackingPage.dart';
import 'package:selftrackingapp/shared/NavDrawer.dart';
import 'TestScreen.dart';

void main() => runApp(SelfTrackingApp());

class SelfTrackingApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: {
          '/testScreen': (context) => TestScreen(),
          '/userSettings': (context) => UserSettingsPage(),
          '/userTracking': (context) => UserTrackingPage(),
          '/patientRegistration': (context) => PatientRegistrationPage(),
          '/patientList': (context) => PatientListPage(),
        },
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: HomePage(title: 'Home'));
  }
}
