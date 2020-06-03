import 'package:flutter/material.dart';
import 'package:selftrackingapp/models/UserTracking.dart';


typedef OnDelete();

class UserTrackingForm extends StatefulWidget {
  final UserTracking userTracking;
  final OnDelete onDelete;


  UserTrackingForm({Key key, this.userTracking, this.onDelete}): super(key: key);

  var state =  _UserTrackingFormState();

  @override
  _UserTrackingFormState createState() {
    return this.state = new _UserTrackingFormState();
  } 
  bool isValid() => state.validate();
}

class _UserTrackingFormState extends State<UserTrackingForm> {
  final _userTrackingFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8),
        child: Form(
          key: _userTrackingFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              AppBar(
                leading: Icon(Icons.map),
                elevation: 0,
                title: Text('User Tracking'),
                backgroundColor: Theme.of(context).accentColor,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: widget.onDelete,
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                child: TextFormField(
                  initialValue: widget.userTracking.purpose,
                  onSaved: (val) => widget.userTracking.purpose = val,
                  validator: (val) =>
                      val.length > 1 ? null : 'Please enter a valid purpose',
                  decoration: InputDecoration(
                    labelText: 'Purpose of your trip',
                    icon: Icon(Icons.directions_walk),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: TextFormField(
                  initialValue: widget.userTracking.location,
                  onSaved: (val) => widget.userTracking.location = val,
                  validator: (val) =>
                      val.length > 1 ? null : 'Please enter a valid address',
                  decoration: InputDecoration(
                    labelText: 'Address',
                    icon: Icon(Icons.location_on),
                    isDense: true,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: TextFormField(
                  initialValue: widget.userTracking.peopleMet,
                  onSaved: (val) => widget.userTracking.peopleMet = val,
                  decoration: InputDecoration(
                    labelText: 'Human Contact',
                    icon: Icon(Icons.supervisor_account),
                    isDense: true,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool validate() {
    var valid = _userTrackingFormKey.currentState.validate();
    print(valid);
    if (valid) _userTrackingFormKey.currentState.save();
    return valid;
  }

}