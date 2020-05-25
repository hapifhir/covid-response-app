class UserDefaults {
  int id;
  String preferenceOption;
  String preferenceValue;

  UserDefaults({this.id, this.preferenceOption, this.preferenceValue});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'preferenceOption': preferenceOption,
      'preferenceOption': preferenceOption
    };
    return map;
  }
}
