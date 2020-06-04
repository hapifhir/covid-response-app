import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:selftrackingapp/DBService.dart';
import 'package:selftrackingapp/models/UserDefaults.dart';
import 'package:selftrackingapp/shared/NavDrawer.dart';

class UserSettingsPage extends StatefulWidget {
  @override
  _UserSettingsPageState createState() {
    return _UserSettingsPageState();
  }
}

class _UserSettingsPageState extends State<UserSettingsPage> {
  Country _selectedCountry;
  final _userSettingsForm = GlobalKey<FormState>();
  bool _notificationsCheckBox = false;
  bool _reportCheckBox = false;
  List<UserDefaults> _currentPerferences = new List<UserDefaults>();
  bool _valuesUpdated = false;
  @override
  void initState() {
    getCurrentPreferences();
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
                          _selectedCountry = country;
                          this.updateValues('countrySelected', country.isoCode);
                        });
                      },
                      selectedCountry: _selectedCountry,
                    ),
                    CheckboxListTile(
                      title: Text("Would you like to receive notifications ?"),
                      value: _notificationsCheckBox,
                      onChanged: (newValue) {
                        setState(() {
                          _notificationsCheckBox = newValue;
                          this.updateValues('notificationEnabled', newValue.toString());
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
                          this.updateValues('reportingEnabled', newValue.toString());
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, //  <-- leading Checkbox
                    ),
                    RaisedButton(
                        child: Text('Save'),
                        onPressed: () {
                          this.saveSettings();
                        })
                  ],
                ))),
        drawer: NavDrawer());
  }

  void saveSettings() async {
    this._userSettingsForm.currentState.save();
    var dbService = DBService();
    String currentNotificationPref = this._notificationsCheckBox.toString();
    String currentReportPref = this._reportCheckBox.toString();
    String currentCountryPref = this._selectedCountry.isoCode;
    var res = await dbService.getBySqlQuery('SELECT * FROM UserDefaults');
    // if no defaults found then create db entries
    // else update them
    if (res.length <= 0) {
      var notificationEnabled = new UserDefaults(
          preferenceOption: 'notificationEnabled',
          preferenceValue: currentNotificationPref);
      var reportingEnabled = new UserDefaults(
          preferenceOption: 'reportingEnabled',
          preferenceValue: currentReportPref);
      var countrySelected = new UserDefaults(
          preferenceOption: 'countrySelected',
          preferenceValue: currentCountryPref);
      dbService.saveUserDefaults(notificationEnabled);
      dbService.saveUserDefaults(reportingEnabled);
      dbService.saveUserDefaults(countrySelected);
    } else {
      this._currentPerferences.forEach((element) {
        if (this._valuesUpdated) {
          dbService.updateUserDefaults(element);
        }
      });
    }
    Navigator.pushNamed(context, '/');
  }

  // checking if there are any existing user defaults
  void getCurrentPreferences() async {
    var dbService = DBService();
    var res = await dbService.getBySqlQuery('SELECT * FROM UserDefaults');
    if (res.length > 0) {
      List.generate(res.length, (i) {
        this._currentPerferences.insert(
            i,
            UserDefaults(
                id: res[i]['id'],
                preferenceOption: res[i]['preferenceOption'],
                preferenceValue: res[i]['preferenceValue']));
        setState(() {
          if (res[i]['preferenceOption'] == 'notificationEnabled') {
            this._notificationsCheckBox = res[i]['preferenceValue'] == 'true';
          } else if (res[i]['preferenceOption'] == 'reportingEnabled') {
            this._reportCheckBox = res[i]['preferenceValue'] == 'true';
          } else if (res[i]['preferenceOption'] == 'countrySelected') {
            this._selectedCountry =
                Country.findByIsoCode(res[i]['preferenceValue']);
          }
        });
      });
      // print(res); // uncomment to see the db table
    }
  }

  // updating values of the user preference by key
  void updateValues(String key, String newValue) {
    if (this._currentPerferences.length > 0) {
      var entryToUpdate = this._currentPerferences.firstWhere(
          (userPref) => userPref.preferenceOption == key,
          orElse: null);
      if (entryToUpdate != null) {
        setState(() {
          this._valuesUpdated = true;
          entryToUpdate.preferenceValue = newValue;
        });
      }
    }
  }
}
