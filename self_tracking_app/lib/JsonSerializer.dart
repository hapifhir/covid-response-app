import 'dart:convert';

import 'FHIR.dart';

abstract class JsonResourceSerializer {
  IResource fromJson(String json);
  String toJson(IResource resource);
}

class JsonSerializer {

  static Map<String, JsonResourceSerializer> _generateSerializerList() {
    return {
      'Patient': PatientSerializer(),
    };
  }

  static final Map<String, JsonResourceSerializer> map = _generateSerializerList();

  static T deserialize<T extends IResource>(String json) {
    Map<String, dynamic> resource = jsonDecode(json);
    String resourceType = resource['resourceType'];

    if (resourceType == null)
      throw StateError('No serializer for ResourceType $resourceType');

    return map[resourceType].fromJson(json);
  }

  static String serialize<T extends IResource>(T resource) {
    return map[resource.resourceType].toJson(resource);
  }
}

class PatientSerializer extends JsonResourceSerializer {
  @override
  Patient fromJson(String json) {
    return _$PatientFromJson(json);
  }

  @override
  String toJson(Patient resource) {
    return _$PatientToJson(resource);
  }
}