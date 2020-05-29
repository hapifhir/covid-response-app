import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:selftrackingapp/shared/NavDrawer.dart';

class UserSettings extends StatefulWidget {
  @override
  _UserSettingsState createState() {
    return _UserSettingsState();
  }
}

class _UserSettingsState extends State<UserSettings> {
  Country _selected;
  final _userSettingsForm = GlobalKey<FormState>();
  bool _notificationsCheckBox = false;
  bool _reportCheckBox = false;
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
            child: Form(
                key: _userSettingsForm,
                child: Column(
                  children: <Widget>[
                    Text('Please select your country of residence',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 16)),
                    CountryPicker(
                      dense: false,
                      showFlag: true, //displays flag, true by default
                      showDialingCode:
                          false, //displays dialing code, false by default
                      showName: true, //displays country name, true by default
                      showCurrency: false, //eg. 'British pound'
                      showCurrencyISO: false, //eg. 'GBP'
                      onChanged: (Country country) {
                        setState(() {
                          _selected = country;
                        });
                      },
                      selectedCountry: _selected,
                    ),
                    CheckboxListTile(
                      title: Text("Would you like to receive notifications ?"),
                      value: _notificationsCheckBox,
                      onChanged: (newValue) {
                        setState(() {
                          _notificationsCheckBox = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    CheckboxListTile(
                      title: Text(
                          "Would you like to report technical issues or suggest new features ?"),
                      value: _reportCheckBox,
                      onChanged: (newValue) {
                        setState(() {
                          _reportCheckBox = newValue;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    RaisedButton(
                        child: Text('Save'),
                        onPressed: () {
                          Navigator.pushNamed(context, '/');
                        })
                  ],
                ))),
        drawer: NavDrawer());
  }
}
