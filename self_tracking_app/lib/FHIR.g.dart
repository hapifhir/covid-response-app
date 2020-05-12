// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FHIR.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FHIRElement _$FHIRElementFromJson(Map<String, dynamic> json) {
  return FHIRElement(
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$FHIRElementToJson(FHIRElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  return val;
}

BackboneElement _$BackboneElementFromJson(Map<String, dynamic> json) {
  return BackboneElement(
    modifierExtension: json['modifierExtension'],
  )..id = json['id'] as String;
}

Map<String, dynamic> _$BackboneElementToJson(BackboneElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  return val;
}

Code _$CodeFromJson(Map<String, dynamic> json) {
  return Code(
    codeString: json['codeString'] as String,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$CodeToJson(Code instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('codeString', instance.codeString);
  return val;
}

Coding _$CodingFromJson(Map<String, dynamic> json) {
  return Coding(
    system: json['system'] as String,
    version: json['version'] as String,
    code: json['code'] == null
        ? null
        : Code.fromJson(json['code'] as Map<String, dynamic>),
    display: json['display'] as String,
    userSelected: json['userSelected'] as bool,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$CodingToJson(Coding instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('system', instance.system);
  writeNotNull('version', instance.version);
  writeNotNull('code', instance.code);
  writeNotNull('display', instance.display);
  writeNotNull('userSelected', instance.userSelected);
  return val;
}

HumanName _$HumanNameFromJson(Map<String, dynamic> json) {
  return HumanName(
    use: json['use'] == null
        ? null
        : Code.fromJson(json['use'] as Map<String, dynamic>),
    text: json['text'] as String,
    family: json['family'] as String,
    given: (json['given'] as List)?.map((e) => e as String)?.toList(),
    prefix: (json['prefix'] as List)?.map((e) => e as String)?.toList(),
    suffix: (json['suffix'] as List)?.map((e) => e as String)?.toList(),
    period: json['period'] == null
        ? null
        : Period.fromJson(json['period'] as Map<String, dynamic>),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$HumanNameToJson(HumanName instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('use', instance.use);
  writeNotNull('text', instance.text);
  writeNotNull('family', instance.family);
  writeNotNull('given', instance.given);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('suffix', instance.suffix);
  writeNotNull('period', instance.period);
  return val;
}

Extension _$ExtensionFromJson(Map<String, dynamic> json) {
  return Extension(
    url: json['url'] as String,
    valueString: json['valueString'] as String,
    valueCode: json['valueCode'] as String,
    valueAddress: json['valueAddress'] == null
        ? null
        : Address.fromJson(json['valueAddress'] as Map<String, dynamic>),
    valueBoolean: json['valueBoolean'] as bool,
    valueHumanName: json['valueHumanName'] == null
        ? null
        : HumanName.fromJson(json['valueHumanName'] as Map<String, dynamic>),
    valueReference: json['valueReference'] == null
        ? null
        : Reference.fromJson(json['valueReference'] as Map<String, dynamic>),
    valueDate: json['valueDate'] == null
        ? null
        : DateTime.parse(json['valueDate'] as String),
    valueIdentifier: json['valueIdentifier'] as String,
    valueDecimal: (json['valueDecimal'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$ExtensionToJson(Extension instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  writeNotNull('valueString', instance.valueString);
  writeNotNull('valueCode', instance.valueCode);
  writeNotNull('valueAddress', instance.valueAddress);
  writeNotNull('valueBoolean', instance.valueBoolean);
  writeNotNull('valueHumanName', instance.valueHumanName);
  writeNotNull('valueReference', instance.valueReference);
  writeNotNull('valueDate', instance.valueDate?.toIso8601String());
  writeNotNull('valueIdentifier', instance.valueIdentifier);
  writeNotNull('valueDecimal', instance.valueDecimal);
  return val;
}

Address _$AddressFromJson(Map<String, dynamic> json) {
  return Address(
    use: json['use'] == null
        ? null
        : Code.fromJson(json['use'] as Map<String, dynamic>),
    type: json['type'] == null
        ? null
        : Code.fromJson(json['type'] as Map<String, dynamic>),
    text: json['text'] as String,
    line: (json['line'] as List)?.map((e) => e as String)?.toList(),
    city: json['city'] as String,
    district: json['district'] as String,
    state: json['state'] as String,
    postalCode: json['postalCode'] as String,
    country: json['country'] as String,
    period: json['period'] == null
        ? null
        : Period.fromJson(json['period'] as Map<String, dynamic>),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$AddressToJson(Address instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('use', instance.use);
  writeNotNull('type', instance.type);
  writeNotNull('text', instance.text);
  writeNotNull('line', instance.line);
  writeNotNull('city', instance.city);
  writeNotNull('district', instance.district);
  writeNotNull('state', instance.state);
  writeNotNull('postalCode', instance.postalCode);
  writeNotNull('country', instance.country);
  writeNotNull('period', instance.period);
  return val;
}

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    versionId: json['versionId'] as String,
    lastUpdated: json['lastUpdated'] == null
        ? null
        : DateTime.parse(json['lastUpdated'] as String),
    profile: json['profile'] as String,
    security: json['security'] == null
        ? null
        : Coding.fromJson(json['security'] as Map<String, dynamic>),
    tag: json['tag'] == null
        ? null
        : Coding.fromJson(json['tag'] as Map<String, dynamic>),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$MetaToJson(Meta instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('versionId', instance.versionId);
  writeNotNull('lastUpdated', instance.lastUpdated?.toIso8601String());
  writeNotNull('profile', instance.profile);
  writeNotNull('security', instance.security);
  writeNotNull('tag', instance.tag);
  return val;
}

CodeableConcept _$CodeableConceptFromJson(Map<String, dynamic> json) {
  return CodeableConcept(
    coding: (json['coding'] as List)
        ?.map((e) =>
            e == null ? null : Coding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    text: json['text'] as String,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$CodeableConceptToJson(CodeableConcept instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('coding', instance.coding);
  writeNotNull('text', instance.text);
  return val;
}

Period _$PeriodFromJson(Map<String, dynamic> json) {
  return Period(
    start:
        json['start'] == null ? null : DateTime.parse(json['start'] as String),
    end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$PeriodToJson(Period instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('start', instance.start?.toIso8601String());
  writeNotNull('end', instance.end?.toIso8601String());
  return val;
}

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    relationship: (json['relationship'] as List)
        ?.map((e) => e == null
            ? null
            : CodeableConcept.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    name: json['name'] == null
        ? null
        : HumanName.fromJson(json['name'] as Map<String, dynamic>),
    telecom: (json['telecom'] as List)
        ?.map((e) =>
            e == null ? null : ContactPoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    address: json['address'] == null
        ? null
        : Address.fromJson(json['address'] as Map<String, dynamic>),
    gender: json['gender'] == null
        ? null
        : Code.fromJson(json['gender'] as Map<String, dynamic>),
    organization: json['organization'] == null
        ? null
        : Reference.fromJson(json['organization'] as Map<String, dynamic>),
    period: json['period'] == null
        ? null
        : Period.fromJson(json['period'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$ContactToJson(Contact instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('relationship', instance.relationship);
  writeNotNull('name', instance.name);
  writeNotNull('telecom', instance.telecom);
  writeNotNull('address', instance.address);
  writeNotNull('gender', instance.gender);
  writeNotNull('organization', instance.organization);
  writeNotNull('period', instance.period);
  return val;
}

ContactPoint _$ContactPointFromJson(Map<String, dynamic> json) {
  return ContactPoint(
    system: json['system'] as String,
    value: json['value'] as String,
    use: json['use'] as String,
    rank: json['rank'] as int,
    period: json['period'] == null
        ? null
        : Period.fromJson(json['period'] as Map<String, dynamic>),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$ContactPointToJson(ContactPoint instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('system', instance.system);
  writeNotNull('value', instance.value);
  writeNotNull('use', instance.use);
  writeNotNull('rank', instance.rank);
  writeNotNull('period', instance.period);
  return val;
}

ContactDetail _$ContactDetailFromJson(Map<String, dynamic> json) {
  return ContactDetail(
    name: json['name'] as String,
    telecom: json['telecom'] == null
        ? null
        : ContactPoint.fromJson(json['telecom'] as Map<String, dynamic>),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$ContactDetailToJson(ContactDetail instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('name', instance.name);
  writeNotNull('telecom', instance.telecom);
  return val;
}

Reference _$ReferenceFromJson(Map<String, dynamic> json) {
  return Reference(
    reference: json['reference'] as String,
    identifier: json['identifier'] == null
        ? null
        : Identifier.fromJson(json['identifier'] as Map<String, dynamic>),
    display: json['display'] as String,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$ReferenceToJson(Reference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('reference', instance.reference);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('display', instance.display);
  return val;
}

Identifier _$IdentifierFromJson(Map<String, dynamic> json) {
  return Identifier(
    use: json['use'] as String,
    type: json['type'] == null
        ? null
        : CodeableConcept.fromJson(json['type'] as Map<String, dynamic>),
    system: json['system'] as String,
    value: json['value'] as String,
    period: json['period'] == null
        ? null
        : Period.fromJson(json['period'] as Map<String, dynamic>),
    assigner: json['assigner'] == null
        ? null
        : Reference.fromJson(json['assigner'] as Map<String, dynamic>),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$IdentifierToJson(Identifier instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('use', instance.use);
  writeNotNull('type', instance.type);
  writeNotNull('system', instance.system);
  writeNotNull('value', instance.value);
  writeNotNull('period', instance.period);
  writeNotNull('assigner', instance.assigner);
  return val;
}

Resource _$ResourceFromJson(Map<String, dynamic> json) {
  return Resource(
    resourceType: json['resourceType'] as String,
    id: json['id'] as String,
    meta: json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
    implicitRules: json['implicitRules'] as String,
    language: json['language'] == null
        ? null
        : Code.fromJson(json['language'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResourceToJson(Resource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resourceType', instance.resourceType);
  writeNotNull('id', instance.id);
  writeNotNull('meta', instance.meta);
  writeNotNull('implicitRules', instance.implicitRules);
  writeNotNull('language', instance.language);
  return val;
}

PatientCommunication _$PatientCommunicationFromJson(Map<String, dynamic> json) {
  return PatientCommunication(
    language: json['language'] == null
        ? null
        : CodeableConcept.fromJson(json['language'] as Map<String, dynamic>),
    preferred: json['preferred'] as bool,
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$PatientCommunicationToJson(
    PatientCommunication instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('language', instance.language);
  writeNotNull('preferred', instance.preferred);
  return val;
}

Link _$LinkFromJson(Map<String, dynamic> json) {
  return Link(
    other: json['other'] == null
        ? null
        : Reference.fromJson(json['other'] as Map<String, dynamic>),
    type: json['type'] == null
        ? null
        : Code.fromJson(json['type'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$LinkToJson(Link instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('other', instance.other);
  writeNotNull('type', instance.type);
  return val;
}

Patient _$PatientFromJson(Map<String, dynamic> json) {
  return Patient(
    identifier: (json['identifier'] as List)
        ?.map((e) =>
            e == null ? null : Identifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    active: json['active'] as bool,
    name: (json['name'] as List)
        ?.map((e) =>
            e == null ? null : HumanName.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    telecom: (json['telecom'] as List)
        ?.map((e) =>
            e == null ? null : ContactPoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    gender: json['gender'] == null
        ? null
        : Code.fromJson(json['gender'] as Map<String, dynamic>),
    birthDate: json['birthDate'] == null
        ? null
        : DateTime.parse(json['birthDate'] as String),
    address: (json['address'] as List)
        ?.map((e) =>
            e == null ? null : Address.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    maritalStatus: json['maritalStatus'] == null
        ? null
        : CodeableConcept.fromJson(
            json['maritalStatus'] as Map<String, dynamic>),
    contact: (json['contact'] as List)
        ?.map((e) =>
            e == null ? null : Contact.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    communication: (json['communication'] as List)
        ?.map((e) => e == null
            ? null
            : PatientCommunication.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    generalPractitioner: (json['generalPractitioner'] as List)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    managingOrganization: json['managingOrganization'] == null
        ? null
        : Reference.fromJson(
            json['managingOrganization'] as Map<String, dynamic>),
    link: (json['link'] as List)
        ?.map(
            (e) => e == null ? null : Link.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..id = json['id'] as String
    ..meta = json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>)
    ..implicitRules = json['implicitRules'] as String
    ..language = json['language'] == null
        ? null
        : Code.fromJson(json['language'] as Map<String, dynamic>)
    ..text = json['text'] == null
        ? null
        : Narrative.fromJson(json['text'] as Map<String, dynamic>)
    ..contained = (json['contained'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..extension = (json['extension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..modifierExtension = (json['modifierExtension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$PatientToJson(Patient instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('meta', instance.meta);
  writeNotNull('implicitRules', instance.implicitRules);
  writeNotNull('language', instance.language);
  writeNotNull('text', instance.text);
  writeNotNull('contained', instance.contained);
  writeNotNull('extension', instance.extension);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('active', instance.active);
  writeNotNull('name', instance.name);
  writeNotNull('telecom', instance.telecom);
  writeNotNull('gender', instance.gender);
  writeNotNull('birthDate', instance.birthDate?.toIso8601String());
  writeNotNull('address', instance.address);
  writeNotNull('maritalStatus', instance.maritalStatus);
  writeNotNull('contact', instance.contact);
  writeNotNull('communication', instance.communication);
  writeNotNull('generalPractitioner', instance.generalPractitioner);
  writeNotNull('managingOrganization', instance.managingOrganization);
  writeNotNull('link', instance.link);
  return val;
}

QuestionnaireResponseItem _$QuestionnaireResponseItemFromJson(
    Map<String, dynamic> json) {
  return QuestionnaireResponseItem(
    linkId: json['linkId'] as String,
    definition: json['definition'] as String,
    text: json['text'] as String,
    answer: (json['answer'] as List)
        ?.map((e) =>
            e == null ? null : Answer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$QuestionnaireResponseItemToJson(
    QuestionnaireResponseItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('linkId', instance.linkId);
  writeNotNull('definition', instance.definition);
  writeNotNull('text', instance.text);
  writeNotNull('answer', instance.answer);
  return val;
}

Answer _$AnswerFromJson(Map<String, dynamic> json) {
  return Answer(
    valueBoolean: json['valueBoolean'] as bool,
    valueDecimal: (json['valueDecimal'] as num)?.toDouble(),
    valueInteger: json['valueInteger'] as int,
    valueDate: json['valueDate'] == null
        ? null
        : DateTime.parse(json['valueDate'] as String),
    valueDateTime: json['valueDateTime'] == null
        ? null
        : DateTime.parse(json['valueDateTime'] as String),
    valueTime: json['valueTime'] == null
        ? null
        : DateTime.parse(json['valueTime'] as String),
    valueString: json['valueString'] as String,
    valueUri: json['valueUri'] as String,
    valueAttachment: json['valueAttachment'] == null
        ? null
        : Attachment.fromJson(json['valueAttachment'] as Map<String, dynamic>),
    valueCoding: json['valueCoding'] == null
        ? null
        : Coding.fromJson(json['valueCoding'] as Map<String, dynamic>),
    valueQuantity: json['valueQuantity'] == null
        ? null
        : Quantity.fromJson(json['valueQuantity'] as Map<String, dynamic>),
    valueReference: json['valueReference'] == null
        ? null
        : Reference.fromJson(json['valueReference'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$AnswerToJson(Answer instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('valueBoolean', instance.valueBoolean);
  writeNotNull('valueDecimal', instance.valueDecimal);
  writeNotNull('valueInteger', instance.valueInteger);
  writeNotNull('valueDate', instance.valueDate?.toIso8601String());
  writeNotNull('valueDateTime', instance.valueDateTime?.toIso8601String());
  writeNotNull('valueTime', instance.valueTime?.toIso8601String());
  writeNotNull('valueString', instance.valueString);
  writeNotNull('valueUri', instance.valueUri);
  writeNotNull('valueAttachment', instance.valueAttachment);
  writeNotNull('valueCoding', instance.valueCoding);
  writeNotNull('valueQuantity', instance.valueQuantity);
  writeNotNull('valueReference', instance.valueReference);
  return val;
}

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return Attachment(
    contentType: json['contentType'] == null
        ? null
        : Code.fromJson(json['contentType'] as Map<String, dynamic>),
    language: json['language'] == null
        ? null
        : Code.fromJson(json['language'] as Map<String, dynamic>),
    data: json['data'] as String,
    url: json['url'] as String,
    size: (json['size'] as num)?.toDouble(),
    hash: json['hash'] as String,
    title: json['title'] as String,
    creation: json['creation'] as String,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$AttachmentToJson(Attachment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('contentType', instance.contentType);
  writeNotNull('language', instance.language);
  writeNotNull('data', instance.data);
  writeNotNull('url', instance.url);
  writeNotNull('size', instance.size);
  writeNotNull('hash', instance.hash);
  writeNotNull('title', instance.title);
  writeNotNull('creation', instance.creation);
  return val;
}

Quantity _$QuantityFromJson(Map<String, dynamic> json) {
  return Quantity(
    value: (json['value'] as num)?.toDouble(),
    comparator: json['comparator'] == null
        ? null
        : Code.fromJson(json['comparator'] as Map<String, dynamic>),
    unit: json['unit'] as String,
    system: json['system'] as String,
    code: json['code'] == null
        ? null
        : Code.fromJson(json['code'] as Map<String, dynamic>),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$QuantityToJson(Quantity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('value', instance.value);
  writeNotNull('comparator', instance.comparator);
  writeNotNull('unit', instance.unit);
  writeNotNull('system', instance.system);
  writeNotNull('code', instance.code);
  return val;
}

Questionnaire _$QuestionnaireFromJson(Map<String, dynamic> json) {
  return Questionnaire(
    url: json['url'] as String,
    identifier: (json['identifier'] as List)
        ?.map((e) =>
            e == null ? null : Identifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
    name: json['name'] as String,
    title: json['title'] as String,
    status: json['status'] == null
        ? null
        : Code.fromJson(json['status'] as Map<String, dynamic>),
    experimental: json['experimental'] as bool,
    subjectType: (json['subjectType'] as List)
        ?.map(
            (e) => e == null ? null : Code.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    publisher: json['publisher'] as String,
    contact: (json['contact'] as List)
        ?.map((e) => e == null
            ? null
            : ContactDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
    useContext: (json['useContext'] as List)
        ?.map((e) =>
            e == null ? null : UsageContext.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jurisdiction: (json['jurisdiction'] as List)
        ?.map((e) => e == null
            ? null
            : CodeableConcept.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    purpose: json['purpose'] as String,
    copyright: json['copyright'] as String,
    approvalDate: json['approvalDate'] == null
        ? null
        : DateTime.parse(json['approvalDate'] as String),
    lastReviewDate: json['lastReviewDate'] == null
        ? null
        : DateTime.parse(json['lastReviewDate'] as String),
    effectivePeriod: json['effectivePeriod'] == null
        ? null
        : Period.fromJson(json['effectivePeriod'] as Map<String, dynamic>),
    code: (json['code'] as List)
        ?.map(
            (e) => e == null ? null : Code.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    item: (json['item'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..id = json['id'] as String
    ..meta = json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>)
    ..implicitRules = json['implicitRules'] as String
    ..language = json['language'] == null
        ? null
        : Code.fromJson(json['language'] as Map<String, dynamic>)
    ..text = json['text'] == null
        ? null
        : Narrative.fromJson(json['text'] as Map<String, dynamic>)
    ..contained = (json['contained'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..extension = (json['extension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..modifierExtension = (json['modifierExtension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$QuestionnaireToJson(Questionnaire instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('meta', instance.meta);
  writeNotNull('implicitRules', instance.implicitRules);
  writeNotNull('language', instance.language);
  writeNotNull('text', instance.text);
  writeNotNull('contained', instance.contained);
  writeNotNull('extension', instance.extension);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('url', instance.url);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('version', instance.version);
  writeNotNull('name', instance.name);
  writeNotNull('title', instance.title);
  writeNotNull('status', instance.status);
  writeNotNull('experimental', instance.experimental);
  writeNotNull('subjectType', instance.subjectType);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('publisher', instance.publisher);
  writeNotNull('contact', instance.contact);
  writeNotNull('description', instance.description);
  writeNotNull('useContext', instance.useContext);
  writeNotNull('jurisdiction', instance.jurisdiction);
  writeNotNull('purpose', instance.purpose);
  writeNotNull('copyright', instance.copyright);
  writeNotNull('approvalDate', instance.approvalDate?.toIso8601String());
  writeNotNull('lastReviewDate', instance.lastReviewDate?.toIso8601String());
  writeNotNull('effectivePeriod', instance.effectivePeriod);
  writeNotNull('code', instance.code);
  writeNotNull('item', instance.item);
  return val;
}

QuestionnaireResponse _$QuestionnaireResponseFromJson(
    Map<String, dynamic> json) {
  return QuestionnaireResponse(
    identifier: json['identifier'] == null
        ? null
        : Identifier.fromJson(json['identifier'] as Map<String, dynamic>),
    basedOn: (json['basedOn'] as List)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    parent: (json['parent'] as List)
        ?.map((e) =>
            e == null ? null : Reference.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    questionnaire: json['questionnaire'] as String,
    status: json['status'] as String,
    context: json['context'] == null
        ? null
        : Reference.fromJson(json['context'] as Map<String, dynamic>),
    authored: json['authored'] == null
        ? null
        : DateTime.parse(json['authored'] as String),
    author: json['author'] == null
        ? null
        : Reference.fromJson(json['author'] as Map<String, dynamic>),
    source: json['source'] == null
        ? null
        : Reference.fromJson(json['source'] as Map<String, dynamic>),
    item: (json['item'] as List)
        ?.map((e) => e == null
            ? null
            : QuestionnaireResponseItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    subject: json['subject'] == null
        ? null
        : Reference.fromJson(json['subject'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..meta = json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>)
    ..implicitRules = json['implicitRules'] as String
    ..language = json['language'] == null
        ? null
        : Code.fromJson(json['language'] as Map<String, dynamic>)
    ..text = json['text'] == null
        ? null
        : Narrative.fromJson(json['text'] as Map<String, dynamic>)
    ..contained = (json['contained'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..extension = (json['extension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..modifierExtension = (json['modifierExtension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$QuestionnaireResponseToJson(
    QuestionnaireResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('meta', instance.meta);
  writeNotNull('implicitRules', instance.implicitRules);
  writeNotNull('language', instance.language);
  writeNotNull('text', instance.text);
  writeNotNull('contained', instance.contained);
  writeNotNull('extension', instance.extension);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('basedOn', instance.basedOn);
  writeNotNull('parent', instance.parent);
  writeNotNull('questionnaire', instance.questionnaire);
  writeNotNull('status', instance.status);
  writeNotNull('context', instance.context);
  writeNotNull('authored', instance.authored?.toIso8601String());
  writeNotNull('author', instance.author);
  writeNotNull('source', instance.source);
  writeNotNull('item', instance.item);
  writeNotNull('subject', instance.subject);
  return val;
}

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    linkId: json['linkId'] as String,
    definition: json['definition'] as String,
    code: (json['code'] as List)
        ?.map((e) =>
            e == null ? null : Coding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    prefix: json['prefix'] as String,
    text: json['text'] as String,
    type: json['type'] == null
        ? null
        : Code.fromJson(json['type'] as Map<String, dynamic>),
    enableWhen: (json['enableWhen'] as List)
        ?.map((e) =>
            e == null ? null : EnableWhen.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    enableBehavior: json['enableBehavior'] == null
        ? null
        : Code.fromJson(json['enableBehavior'] as Map<String, dynamic>),
    required: json['required'] as bool,
    repeats: json['repeats'] as bool,
    readOnly: json['readOnly'] as bool,
    maxLength: json['maxLength'] as int,
    answerValueSet: json['answerValueSet'] == null
        ? null
        : ValueSet.fromJson(json['answerValueSet'] as Map<String, dynamic>),
    answerOption: (json['answerOption'] as List)
        ?.map((e) =>
            e == null ? null : AnswerOption.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    initial: (json['initial'] as List)
        ?.map((e) =>
            e == null ? null : Initial.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    item: (json['item'] as List)
        ?.map(
            (e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$ItemToJson(Item instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('linkId', instance.linkId);
  writeNotNull('definition', instance.definition);
  writeNotNull('code', instance.code);
  writeNotNull('prefix', instance.prefix);
  writeNotNull('text', instance.text);
  writeNotNull('type', instance.type);
  writeNotNull('enableWhen', instance.enableWhen);
  writeNotNull('enableBehavior', instance.enableBehavior);
  writeNotNull('required', instance.required);
  writeNotNull('repeats', instance.repeats);
  writeNotNull('readOnly', instance.readOnly);
  writeNotNull('maxLength', instance.maxLength);
  writeNotNull('answerValueSet', instance.answerValueSet);
  writeNotNull('answerOption', instance.answerOption);
  writeNotNull('initial', instance.initial);
  writeNotNull('item', instance.item);
  return val;
}

Initial _$InitialFromJson(Map<String, dynamic> json) {
  return Initial(
    valueBoolean: json['valueBoolean'] as bool,
    valueDecimal: (json['valueDecimal'] as num)?.toDouble(),
    valueInteger: json['valueInteger'] as int,
    valueDate: json['valueDate'] == null
        ? null
        : DateTime.parse(json['valueDate'] as String),
    valueDateTime: json['valueDateTime'] == null
        ? null
        : DateTime.parse(json['valueDateTime'] as String),
    valueTime: json['valueTime'] == null
        ? null
        : DateTime.parse(json['valueTime'] as String),
    valueString: json['valueString'] as String,
    valueUri: json['valueUri'] as String,
    valueAttachment: json['valueAttachment'] == null
        ? null
        : Attachment.fromJson(json['valueAttachment'] as Map<String, dynamic>),
    valueCoding: json['valueCoding'] == null
        ? null
        : Coding.fromJson(json['valueCoding'] as Map<String, dynamic>),
    valueQuantity: json['valueQuantity'] == null
        ? null
        : Quantity.fromJson(json['valueQuantity'] as Map<String, dynamic>),
    valueReference: json['valueReference'] == null
        ? null
        : Reference.fromJson(json['valueReference'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$InitialToJson(Initial instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('valueBoolean', instance.valueBoolean);
  writeNotNull('valueDecimal', instance.valueDecimal);
  writeNotNull('valueInteger', instance.valueInteger);
  writeNotNull('valueDate', instance.valueDate?.toIso8601String());
  writeNotNull('valueDateTime', instance.valueDateTime?.toIso8601String());
  writeNotNull('valueTime', instance.valueTime?.toIso8601String());
  writeNotNull('valueString', instance.valueString);
  writeNotNull('valueUri', instance.valueUri);
  writeNotNull('valueAttachment', instance.valueAttachment);
  writeNotNull('valueCoding', instance.valueCoding);
  writeNotNull('valueQuantity', instance.valueQuantity);
  writeNotNull('valueReference', instance.valueReference);
  return val;
}

EnableWhen _$EnableWhenFromJson(Map<String, dynamic> json) {
  return EnableWhen(
    question: json['question'] as String,
    operator: json['operator'] as String,
    answerBoolean: json['answerBoolean'] as bool,
    answerDecimal: (json['answerDecimal'] as num)?.toDouble(),
    answerInteger: json['answerInteger'] as int,
    answerDate: json['answerDate'] == null
        ? null
        : DateTime.parse(json['answerDate'] as String),
    answerDateTime: json['answerDateTime'] == null
        ? null
        : DateTime.parse(json['answerDateTime'] as String),
    answerTime: json['answerTime'] == null
        ? null
        : DateTime.parse(json['answerTime'] as String),
    answerString: json['answerString'] as String,
    answerCoding: json['answerCoding'] == null
        ? null
        : Coding.fromJson(json['answerCoding'] as Map<String, dynamic>),
    answerQuantity: json['answerQuantity'] == null
        ? null
        : Quantity.fromJson(json['answerQuantity'] as Map<String, dynamic>),
    answerReference: json['answerReference'] == null
        ? null
        : Reference.fromJson(json['answerReference'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$EnableWhenToJson(EnableWhen instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('question', instance.question);
  writeNotNull('operator', instance.operator);
  writeNotNull('answerBoolean', instance.answerBoolean);
  writeNotNull('answerDecimal', instance.answerDecimal);
  writeNotNull('answerInteger', instance.answerInteger);
  writeNotNull('answerDate', instance.answerDate?.toIso8601String());
  writeNotNull('answerDateTime', instance.answerDateTime?.toIso8601String());
  writeNotNull('answerTime', instance.answerTime?.toIso8601String());
  writeNotNull('answerString', instance.answerString);
  writeNotNull('answerCoding', instance.answerCoding);
  writeNotNull('answerQuantity', instance.answerQuantity);
  writeNotNull('answerReference', instance.answerReference);
  return val;
}

ValueSet _$ValueSetFromJson(Map<String, dynamic> json) {
  return ValueSet(
    url: json['url'] as String,
    identifier: (json['identifier'] as List)
        ?.map((e) =>
            e == null ? null : Identifier.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    version: json['version'] as String,
    name: json['name'] as String,
    title: json['title'] as String,
    status: json['status'] == null
        ? null
        : Code.fromJson(json['status'] as Map<String, dynamic>),
    experimental: json['experimental'] as bool,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    publisher: json['publisher'] as String,
    contact: (json['contact'] as List)
        ?.map((e) => e == null
            ? null
            : ContactDetail.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
    useContext: (json['useContext'] as List)
        ?.map((e) =>
            e == null ? null : UsageContext.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    jurisdiction: (json['jurisdiction'] as List)
        ?.map((e) => e == null
            ? null
            : CodeableConcept.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    immutable: json['immutable'] as bool,
    purpose: json['purpose'] as String,
    copyright: json['copyright'] as String,
    compose: json['compose'] == null
        ? null
        : Compose.fromJson(json['compose'] as Map<String, dynamic>),
    expansion: json['expansion'] == null
        ? null
        : Expansion.fromJson(json['expansion'] as Map<String, dynamic>),
  )
    ..resourceType = json['resourceType'] as String
    ..id = json['id'] as String
    ..meta = json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>)
    ..implicitRules = json['implicitRules'] as String
    ..language = json['language'] == null
        ? null
        : Code.fromJson(json['language'] as Map<String, dynamic>)
    ..text = json['text'] == null
        ? null
        : Narrative.fromJson(json['text'] as Map<String, dynamic>)
    ..contained = (json['contained'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..extension = (json['extension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..modifierExtension = (json['modifierExtension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ValueSetToJson(ValueSet instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resourceType', instance.resourceType);
  writeNotNull('id', instance.id);
  writeNotNull('meta', instance.meta);
  writeNotNull('implicitRules', instance.implicitRules);
  writeNotNull('language', instance.language);
  writeNotNull('text', instance.text);
  writeNotNull('contained', instance.contained);
  writeNotNull('extension', instance.extension);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('url', instance.url);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('version', instance.version);
  writeNotNull('name', instance.name);
  writeNotNull('title', instance.title);
  writeNotNull('status', instance.status);
  writeNotNull('experimental', instance.experimental);
  writeNotNull('date', instance.date?.toIso8601String());
  writeNotNull('publisher', instance.publisher);
  writeNotNull('contact', instance.contact);
  writeNotNull('description', instance.description);
  writeNotNull('useContext', instance.useContext);
  writeNotNull('jurisdiction', instance.jurisdiction);
  writeNotNull('immutable', instance.immutable);
  writeNotNull('purpose', instance.purpose);
  writeNotNull('copyright', instance.copyright);
  writeNotNull('compose', instance.compose);
  writeNotNull('expansion', instance.expansion);
  return val;
}

DomainResource _$DomainResourceFromJson(Map<String, dynamic> json) {
  return DomainResource(
    text: json['text'] == null
        ? null
        : Narrative.fromJson(json['text'] as Map<String, dynamic>),
    contained: (json['contained'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    extension: (json['extension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    modifierExtension: (json['modifierExtension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..resourceType = json['resourceType'] as String
    ..id = json['id'] as String
    ..meta = json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>)
    ..implicitRules = json['implicitRules'] as String
    ..language = json['language'] == null
        ? null
        : Code.fromJson(json['language'] as Map<String, dynamic>);
}

Map<String, dynamic> _$DomainResourceToJson(DomainResource instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resourceType', instance.resourceType);
  writeNotNull('id', instance.id);
  writeNotNull('meta', instance.meta);
  writeNotNull('implicitRules', instance.implicitRules);
  writeNotNull('language', instance.language);
  writeNotNull('text', instance.text);
  writeNotNull('contained', instance.contained);
  writeNotNull('extension', instance.extension);
  writeNotNull('modifierExtension', instance.modifierExtension);
  return val;
}

Narrative _$NarrativeFromJson(Map<String, dynamic> json) {
  return Narrative(
    status: json['status'] == null
        ? null
        : Code.fromJson(json['status'] as Map<String, dynamic>),
    div: json['div'] as String,
  );
}

Map<String, dynamic> _$NarrativeToJson(Narrative instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('status', instance.status);
  writeNotNull('div', instance.div);
  return val;
}

Compose _$ComposeFromJson(Map<String, dynamic> json) {
  return Compose(
    lockedDate: json['lockedDate'] == null
        ? null
        : DateTime.parse(json['lockedDate'] as String),
    inactive: json['inactive'] as bool,
    include: (json['include'] as List)
        ?.map((e) =>
            e == null ? null : Include.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$ComposeToJson(Compose instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('lockedDate', instance.lockedDate?.toIso8601String());
  writeNotNull('inactive', instance.inactive);
  writeNotNull('include', instance.include);
  return val;
}

Expansion _$ExpansionFromJson(Map<String, dynamic> json) {
  return Expansion(
    identifier: json['identifier'] == null
        ? null
        : Identifier.fromJson(json['identifier'] as Map<String, dynamic>),
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    total: json['total'] as int,
    offset: json['offset'] as int,
    parameter: json['parameter'] == null
        ? null
        : Parameter.fromJson(json['parameter'] as Map<String, dynamic>),
    contains: json['contains'] == null
        ? null
        : Contains.fromJson(json['contains'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$ExpansionToJson(Expansion instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull('total', instance.total);
  writeNotNull('offset', instance.offset);
  writeNotNull('parameter', instance.parameter);
  writeNotNull('contains', instance.contains);
  return val;
}

Filter _$FilterFromJson(Map<String, dynamic> json) {
  return Filter(
    property: json['property'] == null
        ? null
        : Code.fromJson(json['property'] as Map<String, dynamic>),
    op: json['op'] == null
        ? null
        : Code.fromJson(json['op'] as Map<String, dynamic>),
    value: json['value'] as String,
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('property', instance.property);
  writeNotNull('op', instance.op);
  writeNotNull('value', instance.value);
  return val;
}

Include _$IncludeFromJson(Map<String, dynamic> json) {
  return Include(
    system: json['system'] as String,
    version: json['version'] as String,
    concept: json['concept'] == null
        ? null
        : Concept.fromJson(json['concept'] as Map<String, dynamic>),
    filter: json['filter'] == null
        ? null
        : Filter.fromJson(json['filter'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$IncludeToJson(Include instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('system', instance.system);
  writeNotNull('version', instance.version);
  writeNotNull('concept', instance.concept);
  writeNotNull('filter', instance.filter);
  return val;
}

Designation _$DesignationFromJson(Map<String, dynamic> json) {
  return Designation(
    language: json['language'] == null
        ? null
        : Code.fromJson(json['language'] as Map<String, dynamic>),
    use: json['use'] == null
        ? null
        : Coding.fromJson(json['use'] as Map<String, dynamic>),
    value: json['value'] as String,
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$DesignationToJson(Designation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('language', instance.language);
  writeNotNull('use', instance.use);
  writeNotNull('value', instance.value);
  return val;
}

Concept _$ConceptFromJson(Map<String, dynamic> json) {
  return Concept(
    code: json['code'] == null
        ? null
        : Code.fromJson(json['code'] as Map<String, dynamic>),
    display: json['display'] as String,
    designation: (json['designation'] as List)
        ?.map((e) =>
            e == null ? null : Designation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$ConceptToJson(Concept instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('code', instance.code);
  writeNotNull('display', instance.display);
  writeNotNull('designation', instance.designation);
  return val;
}

Contains _$ContainsFromJson(Map<String, dynamic> json) {
  return Contains(
    system: json['system'] as String,
    abstract: json['abstract'] as bool,
    inactive: json['inactive'] as bool,
    version: json['version'] as String,
    code: json['code'] == null
        ? null
        : Code.fromJson(json['code'] as Map<String, dynamic>),
    display: json['display'] as String,
    designation: (json['designation'] as List)
        ?.map((e) =>
            e == null ? null : Designation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    contains: (json['contains'] as List)
        ?.map((e) =>
            e == null ? null : Contains.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$ContainsToJson(Contains instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('system', instance.system);
  writeNotNull('abstract', instance.abstract);
  writeNotNull('inactive', instance.inactive);
  writeNotNull('version', instance.version);
  writeNotNull('code', instance.code);
  writeNotNull('display', instance.display);
  writeNotNull('designation', instance.designation);
  writeNotNull('contains', instance.contains);
  return val;
}

FHIRRange _$FHIRRangeFromJson(Map<String, dynamic> json) {
  return FHIRRange(
    low: json['low'] as int,
    high: json['high'] as int,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$FHIRRangeToJson(FHIRRange instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('low', instance.low);
  writeNotNull('high', instance.high);
  return val;
}

UsageContext _$UsageContextFromJson(Map<String, dynamic> json) {
  return UsageContext(
    code: json['code'] == null
        ? null
        : Coding.fromJson(json['code'] as Map<String, dynamic>),
    valueCodeableConcept: json['valueCodeableConcept'] == null
        ? null
        : CodeableConcept.fromJson(
            json['valueCodeableConcept'] as Map<String, dynamic>),
    valueQuantity: json['valueQuantity'] == null
        ? null
        : Quantity.fromJson(json['valueQuantity'] as Map<String, dynamic>),
    valueRange: json['valueRange'] == null
        ? null
        : FHIRRange.fromJson(json['valueRange'] as Map<String, dynamic>),
  )..id = json['id'] as String;
}

Map<String, dynamic> _$UsageContextToJson(UsageContext instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('code', instance.code);
  writeNotNull('valueCodeableConcept', instance.valueCodeableConcept);
  writeNotNull('valueQuantity', instance.valueQuantity);
  writeNotNull('valueRange', instance.valueRange);
  return val;
}

Parameter _$ParameterFromJson(Map<String, dynamic> json) {
  return Parameter(
    name: json['name'] as String,
    valueString: json['valueString'] as String,
    valueBoolean: json['valueBoolean'] as bool,
    valueInteger: json['valueInteger'] as int,
    valueDecimal: (json['valueDecimal'] as num)?.toDouble(),
    valueUri: json['valueUri'] as String,
    valueCode: json['valueCode'] == null
        ? null
        : Code.fromJson(json['valueCode'] as Map<String, dynamic>),
    valueDateTime: json['valueDateTime'] == null
        ? null
        : DateTime.parse(json['valueDateTime'] as String),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$ParameterToJson(Parameter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('name', instance.name);
  writeNotNull('valueString', instance.valueString);
  writeNotNull('valueBoolean', instance.valueBoolean);
  writeNotNull('valueInteger', instance.valueInteger);
  writeNotNull('valueDecimal', instance.valueDecimal);
  writeNotNull('valueUri', instance.valueUri);
  writeNotNull('valueCode', instance.valueCode);
  writeNotNull('valueDateTime', instance.valueDateTime?.toIso8601String());
  return val;
}

AnswerOption _$AnswerOptionFromJson(Map<String, dynamic> json) {
  return AnswerOption(
    valueDate: json['valueDate'] == null
        ? null
        : DateTime.parse(json['valueDate'] as String),
    valueTime: json['valueTime'] as String,
    valueString: json['valueString'] as String,
    valueCoding: json['valueCoding'] == null
        ? null
        : Coding.fromJson(json['valueCoding'] as Map<String, dynamic>),
    valueReference: json['valueReference'] == null
        ? null
        : Reference.fromJson(json['valueReference'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$AnswerOptionToJson(AnswerOption instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('valueDate', instance.valueDate?.toIso8601String());
  writeNotNull('valueTime', instance.valueTime);
  writeNotNull('valueString', instance.valueString);
  writeNotNull('valueCoding', instance.valueCoding);
  writeNotNull('valueReference', instance.valueReference);
  return val;
}

Bundle _$BundleFromJson(Map<String, dynamic> json) {
  return Bundle(
    identifier: json['identifier'] == null
        ? null
        : Identifier.fromJson(json['identifier'] as Map<String, dynamic>),
    type: json['type'] == null
        ? null
        : Code.fromJson(json['type'] as Map<String, dynamic>),
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
    total: json['total'] as int,
    link: (json['link'] as List)
        ?.map((e) =>
            e == null ? null : BundleLink.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    entry: (json['entry'] as List)
        ?.map((e) =>
            e == null ? null : BundleEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    signature: json['signature'] == null
        ? null
        : Signature.fromJson(json['signature'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..meta = json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>)
    ..implicitRules = json['implicitRules'] as String
    ..language = json['language'] == null
        ? null
        : Code.fromJson(json['language'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BundleToJson(Bundle instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('meta', instance.meta);
  writeNotNull('implicitRules', instance.implicitRules);
  writeNotNull('language', instance.language);
  writeNotNull('identifier', instance.identifier);
  writeNotNull('type', instance.type);
  writeNotNull('timestamp', instance.timestamp?.toIso8601String());
  writeNotNull('total', instance.total);
  writeNotNull('link', instance.link);
  writeNotNull('entry', instance.entry);
  writeNotNull('signature', instance.signature);
  return val;
}

BundleLink _$BundleLinkFromJson(Map<String, dynamic> json) {
  return BundleLink(
    relation: json['relation'] as String,
    url: json['url'] as String,
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$BundleLinkToJson(BundleLink instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('relation', instance.relation);
  writeNotNull('url', instance.url);
  return val;
}

BundleEntry _$BundleEntryFromJson(Map<String, dynamic> json) {
  return BundleEntry(
    link: json['link'] == null
        ? null
        : BundleLink.fromJson(json['link'] as Map<String, dynamic>),
    fullUrl: json['fullUrl'] as String,
    resource: json['resource'] == null
        ? null
        : Resource.fromJson(json['resource'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$BundleEntryToJson(BundleEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('link', instance.link);
  writeNotNull('fullUrl', instance.fullUrl);
  writeNotNull('resource', instance.resource);
  return val;
}

BundleSearch _$BundleSearchFromJson(Map<String, dynamic> json) {
  return BundleSearch(
    mode: json['mode'] == null
        ? null
        : Code.fromJson(json['mode'] as Map<String, dynamic>),
    score: (json['score'] as num)?.toDouble(),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$BundleSearchToJson(BundleSearch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('mode', instance.mode);
  writeNotNull('score', instance.score);
  return val;
}

BundleRequest _$BundleRequestFromJson(Map<String, dynamic> json) {
  return BundleRequest(
    request: json['request'] == null
        ? null
        : Code.fromJson(json['request'] as Map<String, dynamic>),
    url: json['url'] as String,
    ifNoneMatch: json['ifNoneMatch'] as String,
    ifModifiedSince: json['ifModifiedSince'] == null
        ? null
        : DateTime.parse(json['ifModifiedSince'] as String),
    ifMatch: json['ifMatch'] as String,
    ifNoneExist: json['ifNoneExist'] as String,
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$BundleRequestToJson(BundleRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('request', instance.request);
  writeNotNull('url', instance.url);
  writeNotNull('ifNoneMatch', instance.ifNoneMatch);
  writeNotNull('ifModifiedSince', instance.ifModifiedSince?.toIso8601String());
  writeNotNull('ifMatch', instance.ifMatch);
  writeNotNull('ifNoneExist', instance.ifNoneExist);
  return val;
}

BundleResponse _$BundleResponseFromJson(Map<String, dynamic> json) {
  return BundleResponse(
    status: json['status'] as String,
    location: json['location'] as String,
    etag: json['etag'] as String,
    lastModified: json['lastModified'] == null
        ? null
        : DateTime.parse(json['lastModified'] as String),
    outcome: json['outcome'] == null
        ? null
        : Resource.fromJson(json['outcome'] as Map<String, dynamic>),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$BundleResponseToJson(BundleResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('status', instance.status);
  writeNotNull('location', instance.location);
  writeNotNull('etag', instance.etag);
  writeNotNull('lastModified', instance.lastModified?.toIso8601String());
  writeNotNull('outcome', instance.outcome);
  return val;
}

Signature _$SignatureFromJson(Map<String, dynamic> json) {
  return Signature(
    type: (json['type'] as List)
        ?.map((e) =>
            e == null ? null : Coding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    when: json['when'] == null ? null : DateTime.parse(json['when'] as String),
    who: json['who'] == null
        ? null
        : Reference.fromJson(json['who'] as Map<String, dynamic>),
    onBehalfOf: json['onBehalfOf'] == null
        ? null
        : Reference.fromJson(json['onBehalfOf'] as Map<String, dynamic>),
    targetFormat: json['targetFormat'] == null
        ? null
        : Code.fromJson(json['targetFormat'] as Map<String, dynamic>),
    sigFormat: json['sigFormat'] == null
        ? null
        : Code.fromJson(json['sigFormat'] as Map<String, dynamic>),
    data: json['data'] as String,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$SignatureToJson(Signature instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('type', instance.type);
  writeNotNull('when', instance.when?.toIso8601String());
  writeNotNull('who', instance.who);
  writeNotNull('onBehalfOf', instance.onBehalfOf);
  writeNotNull('targetFormat', instance.targetFormat);
  writeNotNull('sigFormat', instance.sigFormat);
  writeNotNull('data', instance.data);
  return val;
}

OperationOutcome _$OperationOutcomeFromJson(Map<String, dynamic> json) {
  return OperationOutcome(
    issue: (json['issue'] as List)
        ?.map((e) => e == null
            ? null
            : OperationOutcomeIssue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  )
    ..resourceType = json['resourceType'] as String
    ..id = json['id'] as String
    ..meta = json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>)
    ..implicitRules = json['implicitRules'] as String
    ..language = json['language'] == null
        ? null
        : Code.fromJson(json['language'] as Map<String, dynamic>)
    ..text = json['text'] == null
        ? null
        : Narrative.fromJson(json['text'] as Map<String, dynamic>)
    ..contained = (json['contained'] as List)
        ?.map((e) =>
            e == null ? null : Resource.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..extension = (json['extension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..modifierExtension = (json['modifierExtension'] as List)
        ?.map((e) =>
            e == null ? null : Extension.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$OperationOutcomeToJson(OperationOutcome instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resourceType', instance.resourceType);
  writeNotNull('id', instance.id);
  writeNotNull('meta', instance.meta);
  writeNotNull('implicitRules', instance.implicitRules);
  writeNotNull('language', instance.language);
  writeNotNull('text', instance.text);
  writeNotNull('contained', instance.contained);
  writeNotNull('extension', instance.extension);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('issue', instance.issue);
  return val;
}

OperationOutcomeIssue _$OperationOutcomeIssueFromJson(
    Map<String, dynamic> json) {
  return OperationOutcomeIssue(
    severity: json['severity'] == null
        ? null
        : Code.fromJson(json['severity'] as Map<String, dynamic>),
    code: json['code'] == null
        ? null
        : Code.fromJson(json['code'] as Map<String, dynamic>),
    details: json['details'] == null
        ? null
        : CodeableConcept.fromJson(json['details'] as Map<String, dynamic>),
    diagnostics: json['diagnostics'] as String,
    location: (json['location'] as List)?.map((e) => e as String)?.toList(),
    expression: (json['expression'] as List)?.map((e) => e as String)?.toList(),
  )
    ..id = json['id'] as String
    ..modifierExtension = json['modifierExtension'];
}

Map<String, dynamic> _$OperationOutcomeIssueToJson(
    OperationOutcomeIssue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('modifierExtension', instance.modifierExtension);
  writeNotNull('severity', instance.severity);
  writeNotNull('code', instance.code);
  writeNotNull('details', instance.details);
  writeNotNull('diagnostics', instance.diagnostics);
  writeNotNull('location', instance.location);
  writeNotNull('expression', instance.expression);
  return val;
}
