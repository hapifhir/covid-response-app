
class FHIRElement {
  String id;
}

class BackboneElement extends FHIRElement {
  BackboneElement();
  var modifierExtension;
}

class Code extends FHIRElement {
  Code();
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

class QuestionnaireResponseItem extends BackboneElement {
  String linkId;
  String definition;
  String text;
  List<Answer> answer;
}

class Answer extends BackboneElement {
  bool valueBoolean;
  double valueDecimal;
  int valueInteger;
  DateTime valueDate;
  DateTime valueDateTime;
  DateTime valueTime;
  String valueString;
  String valueUri;
  Attachment valueAttachment;
  Coding valueCoding;
  Quantity valueQuantity;
  Reference valueReference;
}

class Attachment extends FHIRElement {
  Code contentType;
  Code language;
  String data;
  String url;
  double size;
  String hash;
  String title;
  String creation;
}

class Quantity extends FHIRElement {
  double value;
  Code comparator;
  String unit;
  String system;
  Code code;
}

class Questionnaire extends Resource {
  String url;
  List<Identifier> identifier;
  String version;
  String name;
  String title;
//  derivedFrom: Questionnaire;
  Code status;
  bool experimental;
  List<Code> subjectType;
  DateTime date;
  String publisher;
  List<ContactDetail> contact;
  String description;
  List<UsageContext> useContext;
  List<CodeableConcept> jurisdiction;
  String purpose;
  String copyright;
  DateTime approvalDate;
  DateTime lastReviewDate;
  Period effectivePeriod;
  List<Code> code;
  List<Item> item;
}

class QuestionnaireResponse extends Resource {
  Identifier identifier;
  List<Reference> basedOn;
  List<Reference> parent;
  String questionnaire;
  String status;
  Reference context;
  DateTime authored;
  Reference author;
  Reference source;
  List<QuestionnaireResponseItem> item;
  Reference subject;
}


class Item extends BackboneElement {
  String linkId;
  String definition;
  List<Coding> code;
  String prefix;
  String text;
  Code type;
  List<EnableWhen> enableWhen;
  Code enableBehavior;
  bool required;
  bool repeats;
  bool readOnly;
  int maxLength;
  ValueSet answerValueSet;
  List<AnswerOption> answerOption;
  List<Initial> initial;
  List<Item> item;
}

class Initial extends BackboneElement {
  bool valueBoolean;
  double valueDecimal;
  int valueInteger;
  DateTime valueDate;
  DateTime valueDateTime;
  DateTime valueTime;
  String valueString;
  String valueUri;
  Attachment valueAttachment;
  Coding valueCoding;
  Quantity valueQuantity;
  Reference valueReference;
}

class EnableWhen extends BackboneElement {
  String question;
  String operator;
  bool answerBoolean;
  double answerDecimal;
  int answerInteger;
  DateTime answerDate;
  DateTime answerDateTime;
  DateTime answerTime;
  String answerString;
  Coding answerCoding;
  Quantity answerQuantity;
  Reference answerReference;
}

class ValueSet extends DomainResource {
  String url;
  List<Identifier> identifier;
  String version;
  String name;
  String title;
  Code status;
  bool experimental;
  DateTime date;
  String publisher;
  List<ContactDetail> contact;
  String description;
  List<UsageContext> useContext;
  List<CodeableConcept> jurisdiction;
  bool immutable;
  String purpose;
  String copyright;
  Compose compose;
  Expansion expansion;
}

class DomainResource extends Resource {
  Narrative text;
  List<Resource> contained;
  List<Extension> extension;
  List<Extension> modifierExtension;
}

class Narrative {
  Code status;
  String div;
}

class Compose extends BackboneElement {
  DateTime lockedDate;
  bool inactive;
  List<Include> include;
}

class Expansion extends BackboneElement {
  Identifier identifier;
  DateTime timestamp;
  int total;
  int offset;
  Parameter parameter;
  Contains contains;
}

class Filter extends BackboneElement {
  Code property;
  Code op;
  String value;
}

class Include extends BackboneElement {
  String system;
  String version;
  Concept concept;
  Filter filter;
}

class Designation extends BackboneElement {
  Code language;
  Coding use;
  String value;
}

class Concept extends BackboneElement {
  Code code;
  String display;
  List<Designation> designation;
}

class Contains extends BackboneElement {
  String system;
  bool abstract;
  bool inactive;
  String version;
  Code code;
  String display;
  List<Designation> designation;
  List<Contains> contains;
}

class FHIRRange extends FHIRElement {
  int low;
  int high;
}

class UsageContext extends FHIRElement {
  Coding code;
  CodeableConcept valueCodeableConcept;
  Quantity valueQuantity;
  FHIRRange valueRange;
}

class Parameter extends BackboneElement {
  String name;
  String valueString;
  bool valueBoolean;
  int valueInteger;
  double valueDecimal;
  String valueUri;
  Code valueCode;
  DateTime valueDateTime;
}

class AnswerOption {
  DateTime valueDate;
  String valueTime;
  String valueString;
  Coding valueCoding;
  Reference valueReference;
}


















