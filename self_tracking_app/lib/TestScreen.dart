import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FHIR.dart';
import 'FHIRClient.dart';
import 'IFHIRClient.dart';
import 'IFHIRClient.dart';
import 'JsonSerializer.dart';
import 'JsonSerializer.dart';
import 'JsonSerializer.dart';
import 'JsonSerializer.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() {
    FHIRClient client = FHIRClient('http://hapi.fhir.org/baseR4');
    client.onBeforeRequest.add((f) {
      print('On before request');
      print(f.url);
      return f;
    });
    client.onAfterResponse.add((f) {
      print('On after response');
      print(f.body);
      print(JsonSerializer().deserialize(f.body));
      print('done');
      return f;
    });
    return _TestScreenState(client);
  }
}

class _TestScreenState extends State<TestScreen> {
  IFHIRClient _client;
  Future<IResource> _futureResource;

  ScrollController _scrollController;

  _TestScreenState(IFHIRClient client) {
    this._client = client;
  }

  @override
  void initState() {
    this._scrollController = ScrollController();
    this._futureResource = _client.read('Patient/622693');
    super.initState();
  }

  Widget _generateListView(String text) {
    return ListView(
      controller: _scrollController,
      children: <Widget>[
        RaisedButton(
          child: Text('Reload'),
          onPressed: () {
            setState(() => _futureResource = _client.read('Patient/622693'));
          },
        ),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<IResource>(
            future: _futureResource,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _generateListView(JsonSerializer().serialize(snapshot.data, pretty: true));
              } else if (snapshot.hasError) {
                return _generateListView(snapshot.error.toString());
              }
              return CircularProgressIndicator();
            }
          )
        )
      ),
    );
  }
}