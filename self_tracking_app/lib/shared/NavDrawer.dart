import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {

  final Map<String, String> _navs = {
    'Home': '/',
    'Serializer': '/testScreen',
    'User Settings': '/userSettings',
    'User Tracking': '/userTracking',
    'Patient Registration': '/patientRegistration',
    'Patient List': '/patientList',
    'Analytics': '/analytics'
  };

  Widget _generateNavWidget(BuildContext context, String title, String route) {
    return ListTile(
      title: Text(title),
      onTap: () => Navigator.pushNamed(context, route),
    );
  }

  List<Widget> _generateTiles(BuildContext context) {
    List<Widget> result = [];
    _navs.forEach((k, v) => result.add(_generateNavWidget(context, k, v)));
    return result;
  }

  @override
  Widget build(BuildContext context) {
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
            ..._generateTiles(context)
          ],
        )
    );
  }

}