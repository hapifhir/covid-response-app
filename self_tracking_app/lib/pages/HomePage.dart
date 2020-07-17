import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selftrackingapp/shared/NavDrawer.dart';

import '../DBService.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var dbService;
  @override
  void initState() {
    dbService = DBService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.person_add),
              title: Text('Register patient'),
              trailing: Icon(Icons.keyboard_arrow_right),
              subtitle: Text('Add a patient to track'),
              onTap: () =>
                  Navigator.pushNamed(context, '/patientRegistration'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.group),
              title: Text('View patients'),
              trailing: Icon(Icons.keyboard_arrow_right),
              subtitle: Text('Open a list of current patients'),
              onTap: () =>
                  Navigator.pushNamed(context, '/patientList'),
            ),
          ),
        ],
      ),
      drawer: NavDrawer(),
    );
  }
}