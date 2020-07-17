import 'dart:convert';

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
  ScrollController _scrollController;
  @override
  void initState() {
    this._scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // userTrackingForms.clear();

    return Scaffold(
        appBar: AppBar(
          title: Text('User Tracking'),
          actions: <Widget>[FlatButton(onPressed: onSave, child: Text('Save'))],
        ),
        body: Column(
          children: <Widget>[
            // FlatButton(onPressed: null, child: Text('Test')),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    controller: _scrollController,
                    addAutomaticKeepAlives: true,
                    itemCount: userTrackings.length,
                    itemBuilder: (_, i) => userTrackingForms[i]))
          ],
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
    // TODO: Add index at 0 fix
    if (index == 0) {
      userTrackings.removeAt(index);
      userTrackingForms.removeAt(index);
    } else if (index == (userTrackings.length - 1)) {
      userTrackings.removeLast();
      userTrackingForms.removeLast();
    } else {
      userTrackings.removeAt(index - 1);
      userTrackingForms.removeAt(index - 1);
    }

    setState(() {});
  }

  ///on form userTracking add
  void onAdd() {
    userTrackings.add(UserTracking());
    userTrackingForms.add(UserTrackingForm(
        key: GlobalKey(),
        userTracking: userTrackings[userTrackings.length - 1],
        onDelete: () => onDelete(userTrackings.length - 1)));
    setState(() {});
  }

  // on form save
  void onSave() {
    bool validForms = false;
    userTrackingForms.forEach((form) {
      if (!form.isValid()) {
        validForms = false;
      } else {
        validForms = true;
      }
    });
    if(validForms) {
      String valueAttachment = jsonEncode(userTrackings.map((e) => e.toString()).toList().toString());
      print(valueAttachment.toString());
    }
  }
}
