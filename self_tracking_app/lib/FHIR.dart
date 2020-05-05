library fhir_r4;

class FHIRElement {
  String id;
}

class BackboneElement extends FHIRElement {
  var modifierExtension;
}

class Code extends FHIRElement {
  String codeString;
}

class Coding extends FHIRElement {
  String system;
  String version;
  Code code;
  String display;
  bool userSelected;
}

class HumanName extends FHIRElement {
  Code use;
  String text;
  String family;
  List<String> given;
  List<String> prefix;
  List<String> suffix;
  Period period;
}

class Extension {
  String url;
  String valueString;
  String valueCode;
  Address valueAddress;
  bool valueBoolean;
  HumanName valueHumanName;
  Reference valueReference;
  DateTime valueDate;
  String valueIdentifier;
  double valueDecimal;
}

class Address extends FHIRElement {
  Code use;
  Code type;
  String text;
  List<String> line;
  String city;
  String district;
  String state;
  String postalCode;
  String country;
  Period period;
}

class Meta extends FHIRElement {
  String versionId;
  DateTime lastUpdated;
  String profile;
  Coding security;
  Coding tag;
}

class CodeableConcept extends FHIRElement {
  List<Coding> coding;
  String text;
}

class Period extends FHIRElement {
  DateTime start;
  DateTime end;
}

class Contact extends BackboneElement {
  List<CodeableConcept> relationship;
  HumanName name;
  List<ContactPoint> telecom;
  Address address;
  Code gender;
  Reference organization;
  Period period;
}

class ContactPoint extends FHIRElement {
  String system;
  String value;
  String use;
  int rank;
  Period period;
}

class ContactDetail extends FHIRElement {
  String name;
  ContactPoint telecom;
}

class Reference extends FHIRElement {
  String reference;
  Identifier identifier;
  String display;
}

class Identifier extends FHIRElement {
  String use;
  CodeableConcept type;
  String system;
  String value;
  Period period;
  Reference assigner;
}

class Resource {
  String resourceType;
  String id;
  Meta meta;
  String implicitRules;
  Code language;
}

class PatientCommunication extends BackboneElement {
  CodeableConcept language;
  bool preferred;
}

class Link extends BackboneElement {
  Reference other;
  Code type;
}

class Patient extends Resource {
  List<Identifier> identifier;
  bool active;
  List<HumanName> name;
  List<ContactPoint> telecom;
  Code gender;
  DateTime birthDate;
  List<Address> address;
  CodeableConcept maritalStatus;
  List<Contact> contact;
  List<PatientCommunication> communication;
  List<Reference> generalPractitioner;
  Reference managingOrganization;
  List<Link> link;
}
