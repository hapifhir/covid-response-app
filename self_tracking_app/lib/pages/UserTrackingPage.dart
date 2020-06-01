import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selftrackingapp/models/UserTracking.dart';
import 'package:selftrackingapp/shared/NavDrawer.dart';
import 'package:selftrackingapp/shared/UserTrackingForm.dart';

class UserTrackingPage extends StatefulWidget {
  @override
  _UserTrackingPageState createState() {
    return _UserTrackingPageState();
  }
}

class _UserTrackingPageState extends State<UserTrackingPage> {
  List<UserTracking> userTrackings = [];
  List<UserTrackingForm> userTrackingForms = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    userTrackingForms.clear();
    for (int i = 0; i < userTrackings.length; i++) {
      userTrackingForms.add(UserTrackingForm(key: GlobalKey(),userTracking: userTrackings[i],
      onDelete: () => onDelete(i)
      ));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('User Preferences'),
          actions: <Widget>[
            FlatButton(onPressed: onSave, child: Text('Save'))
          ],
        ),
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: userTrackings.length <= 0
              ? null
              : ListView.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: userTrackings.length,
                  itemBuilder: (_, i) => userTrackingForms[i]
                )
        ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAdd,
        foregroundColor: Colors.white,
      ),
        drawer: NavDrawer());
  }

  ///on form userTracking delete
  void onDelete(int index) {
    setState(() {
      userTrackings.removeAt(index);
    });
  }

  ///on form userTracking add
  void onAdd() {
    setState(() {
      userTrackings.add(UserTracking());
    });
  }

  // on form save
  void onSave() {
    userTrackingForms.forEach((form) {
      if(form.isValid()) {
        print(form);
      }
    } );
  }
}
