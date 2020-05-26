import 'package:flutter/material.dart';
import 'package:selftrackingapp/FHIR.dart';
import 'package:selftrackingapp/JsonSerializer.dart';
import 'package:selftrackingapp/PlainQuestionnaireFormGenerator.dart';
import 'package:flutter/services.dart' show rootBundle;

//void main() => runApp(TestScreen());
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(TestApp());
}


class TestApp extends StatelessWidget {
  Future<Questionnaire> futureQuestionnaire = _foo();

  static Future<Questionnaire> _foo() async {
    JsonSerializer jsonSerializer = JsonSerializer();
    String data = await rootBundle.loadString('assets/questionnaires/Self_Assessment_Daily_Assessment.json');
    return jsonSerializer.deserialize<Questionnaire>(data);
  }

  TestApp() {
    futureQuestionnaire = _foo();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test',
      home: FutureBuilder(
        future: futureQuestionnaire,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return PlainQuestionnaireFormGenerator(snapshot.data);
          } else if (snapshot.hasError) {
            return Text(snapshot.error);
          }
          return CircularProgressIndicator();
        }
      )
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
          TextFormField(
          validator: (value) {
        if (value.isEmpty) {
        return 'Please enter some text';
        }
        return null;
        },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: RaisedButton(
            onPressed: () {
              // Validate returns true if the form is valid, or false
              // otherwise.
              if (_formKey.currentState.validate()) {
                // If the form is valid, display a Snackbar.
                Scaffold.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('Submit')
          ),
        )
          ]
      ), // This trailing comma makes auto-formatting nicer for build methods.
    )));
  }
}