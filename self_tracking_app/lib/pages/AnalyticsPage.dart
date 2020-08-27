
import 'package:flutter/material.dart';
import 'package:selftrackingapp/shared/ChartPage.dart';
import 'package:selftrackingapp/shared/NavDrawer.dart';

class AnalyticsPage extends StatefulWidget {
  @override
  _AnalyticsPageState createState() {
    return _AnalyticsPageState();
  }
}

class _AnalyticsPageState extends State<AnalyticsPage> {
  ScrollController _scrollController;
  @override
  void initState() {
    this._scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('User Analytics'),
        ),
        body: Column(
          children: <Widget>[
            Text(
              'This is a test page, to showcase that an anlytics page can be included where implementors can generate visuals based on the user input. This is currently not coupled with the current app as that might make it harder for an implementer to decouple.'
            ),
            Expanded(
                flex: 10,
                child: ChartPage.withSampleData(),
        )]),
        drawer: NavDrawer());
  }
}