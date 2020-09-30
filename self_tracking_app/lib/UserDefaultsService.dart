import 'package:selftrackingapp/DBService.dart';
import 'package:sqflite/sqflite.dart';

class UserDefaultsService {

  static Future<bool> hasGivenConsent() async {
    List<Map<String, dynamic>> data = await DBService().getBySqlQuery('SELECT * FROM UserDefaults WHERE preferenceOption = "shareData"');
    for (Map<String, dynamic> entry in data) {
      if (entry['preferenceOption'] == 'shareData' && entry['preferenceValue'] == 'true') {
        return true;
      }
      return true;
    }
    return false;
  }

}