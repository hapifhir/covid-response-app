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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Preferences'),
        ),
        body: Container(
          margin: EdgeInsets.only(top: 50),
          child: userTrackings.length <= 0
              ? Center(
                  child: Text('Please add locations using the button',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16)))
              : ListView.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: userTrackings.length,
                  itemBuilder: (_, i) => UserTrackingForm(
                      userTracking: userTrackings[i],
                      onDelete: () => onDelete(i)),
                ),
        ),
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: onAdd,
        foregroundColor: Colors.white,
      ),
        drawer: NavDrawer());
  }

  ///on form userTracking deleted
  void onDelete(int index) {
    setState(() {
      userTrackings.removeAt(index);
    });
  }

  ///on form userTracking added
  void onAdd() {
    setState(() {
      userTrackings.add(UserTracking());
    });
  }
}
