import 'dart:convert';

import 'FHIR.dart';
import 'ISerializer.dart';

abstract class IResourceSerializer<T extends IResource> {
  T fromJson(String json);
  String toJson(T resource);
}

class JsonSerializer implements ISerializer {

  static Map<String, IResourceSerializer> _generateSerializerList() {
    return {
      'Bundle':                 BundleSerializer(),
      'OperationOutcome':       OperationOutcomeSerializer(),
      'Patient':                PatientSerializer(),
      'Questionnaire':          QuestionnaireSerializer(),
      'QuestionnaireResponse':  QuestionnaireResponseSerializer(),
      'ValueSet':               ValueSetSerializer(),
    };
  }

  static final Map<String, IResourceSerializer> map = _generateSerializerList();

  T deserialize<T extends IResource>(String json) {
    Map<String, dynamic> resource = jsonDecode(json);
    String resourceType = resource['resourceType'];

    if (resourceType == null)
      throw StateError('No serializer for ResourceType $resourceType');

    T result = map[resourceType].fromJson(json);
    return result;
  }

  String serialize<T extends IResource>(T resource, {bool pretty}) {
    Map<String, dynamic> json = jsonDecode(map[resource.resourceType].toJson(resource));
    JsonEncoder encoder;

    if (pretty)
      encoder = JsonEncoder.withIndent('  ');
    else
      encoder = JsonEncoder();

    return encoder.convert(json);
  }
}

class PatientSerializer extends IResourceSerializer<Patient> {
  @override
  Patient fromJson(String json) {
    return Patient.fromJson(jsonDecode(json));
  }

  @override
  String toJson(Patient resource) {
    return jsonEncode(resource.toJson());
  }
}

class ValueSetSerializer extends IResourceSerializer<ValueSet> {
  @override
  ValueSet fromJson(String json) {
    return ValueSet.fromJson(jsonDecode(json));
  }

  @override
  String toJson(ValueSet resource) {
    return jsonEncode(resource.toJson());
  }
}

class QuestionnaireResponseSerializer extends IResourceSerializer<QuestionnaireResponse> {
  @override
  QuestionnaireResponse fromJson(String json) {
    return QuestionnaireResponse.fromJson(jsonDecode(json));
  }

  @override
  String toJson(QuestionnaireResponse resource) {
    return jsonEncode(resource.toJson());
  }
}

class QuestionnaireSerializer extends IResourceSerializer<Questionnaire> {
  @override
  Questionnaire fromJson(String json) {
    return Questionnaire.fromJson(jsonDecode(json));
  }

  @override
  String toJson(Questionnaire resource) {
    return jsonEncode(resource.toJson());
  }
}

class BundleSerializer extends IResourceSerializer<Bundle> {
  @override
  Bundle fromJson(String json) {
    return Bundle.fromJson(jsonDecode(json));
  }

  @override
  String toJson(Bundle resource) {
    return jsonEncode(resource.toJson());
  }
}

class OperationOutcomeSerializer extends IResourceSerializer<OperationOutcome> {
  @override
  OperationOutcome fromJson(String json) {
    return OperationOutcome.fromJson(jsonDecode(json));
  }

  @override
  String toJson(OperationOutcome resource) {
    return jsonEncode(resource.toJson());
  }
}