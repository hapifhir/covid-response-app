import 'models/FHIR.dart';

abstract class ISerializer {
  T deserialize<T extends IResource>(String json);
  String serialize<T extends IResource>(T resource);
}