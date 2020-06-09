class UserTracking {
  String location;
  String purpose;
  String peopleMet;

  UserTracking({this.location = '', this.purpose = '', this.peopleMet = ''});

  Map<String,dynamic> toJson(){
    return {
      "location": this.location,
      "purpose": this.purpose,
      "peopleMet": this.peopleMet
    };
  }
}