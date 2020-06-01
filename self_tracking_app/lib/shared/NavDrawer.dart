import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text('Serializer'),
              onTap: () {
                Navigator.pushNamed(context, '/testScreen');
              },
            ),
            ListTile(
              title: Text('User Settings'),
              onTap: () {
                Navigator.pushNamed(context, '/userSettings');
              },
            ),
            ListTile(
              title: Text('User Tracking'),
              onTap: () {
                Navigator.pushNamed(context, '/userTracking');
              },
            ),
          ],
        )
    );
  }

}