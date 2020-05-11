import 'dart:convert';


import 'FHIR.dart';
import 'ISerializer.dart';

abstract class IResourceSerializer {
  IResource fromJson(String json);
  String toJson(IResource resource);
}

class JsonSerializer implements ISerializer {

  static Map<String, IResourceSerializer> _generateSerializerList() {
    return {
      'Patient': PatientSerializer(),
      'ValueSet': ValueSetSerializer(),
      'Questionnaire': QuestionnaireSerializer(),
      'QuestionnaireResponse': QuestionnaireResponseSerializer(),
    };
  }

  static final Map<String, IResourceSerializer> map = _generateSerializerList();

  T deserialize<T extends IResource>(String json) {
    Map<String, dynamic> resource = jsonDecode(json);
    String resourceType = resource['resourceType'];

    if (resourceType == null)
      throw StateError('No serializer for ResourceType $resourceType');

    return map[resourceType].fromJson(json);
  }

  String serialize<T extends IResource>(T resource, {bool pretty}) {
    String json = map[resource.resourceType].toJson(resource);

    if (pretty) {
      json = JsonEncoder.withIndent('  ').convert(json);
    }

    return json;
  }
}

class PatientSerializer extends IResourceSerializer {
  @override
  Patient fromJson(String json) {
    return Patient.fromJson(jsonDecode(json));
  }

  @override
  String toJson(IResource resource) {
    return jsonEncode((resource as Patient).toJson());
  }
}

class ValueSetSerializer extends IResourceSerializer {
  @override
  ValueSet fromJson(String json) {
    return ValueSet.fromJson(jsonDecode(json));
  }

  @override
  String toJson(IResource resource) {
    return jsonEncode((resource as ValueSet).toJson());
  }
}

class QuestionnaireResponseSerializer extends IResourceSerializer {
  @override
  QuestionnaireResponse fromJson(String json) {
    return QuestionnaireResponse.fromJson(jsonDecode(json));
  }

  @override
  String toJson(IResource resource) {
    return jsonEncode((resource as QuestionnaireResponse).toJson());
  }
}

class QuestionnaireSerializer extends IResourceSerializer {
  @override
  Questionnaire fromJson(String json) {
    return Questionnaire.fromJson(jsonDecode(json));
  }

  @override
  String toJson(IResource resource) {
    return jsonEncode((resource as Questionnaire).toJson());
  }
}