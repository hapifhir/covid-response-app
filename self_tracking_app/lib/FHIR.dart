import 'package:json_annotation/json_annotation.dart';
part 'FHIR.g.dart';

@JsonSerializable(includeIfNull: false)
class FHIRElement {
  String id;

  FHIRElement({
    this.id,
  });

  factory FHIRElement.fromJson(Map<String, dynamic> json) => _$FHIRElementFromJson(json);
  Map<String, dynamic> toJson() => _$FHIRElementToJson(this);
}

abstract class IResource {
  String resourceType;
  String id;
  Meta meta;
  String implicitRules;
  Code language;

  Map<String, dynamic> toJson();
}

@JsonSerializable(includeIfNull: false)
class BackboneElement extends FHIRElement {
  var modifierExtension;

  BackboneElement({
    this.modifierExtension,
  });

  factory BackboneElement.fromJson(Map<String, dynamic> json) => _$BackboneElementFromJson(json);
  Map<String, dynamic> toJson() => _$BackboneElementToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Code extends FHIRElement {
  String codeString;

  Code({
    this.codeString,
  });

  factory Code.fromJson(Map<String, dynamic> json) => _$CodeFromJson(json);
  Map<String, dynamic> toJson() => _$CodeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Coding extends FHIRElement {
  String system;
  String version;
  Code code;
  String display;
  bool userSelected;

  Coding({
    this.system,
    this.version,
    this.code,
    this.display,
    this.userSelected,
  });

  factory Coding.fromJson(Map<String, dynamic> json) => _$CodingFromJson(json);
  Map<String, dynamic> toJson() => _$CodingToJson(this);
}

@JsonSerializable(includeIfNull: false)
class HumanName extends FHIRElement {
  Code use;
  String text;
  String family;
  List<String> given;
  List<String> prefix;
  List<String> suffix;
  Period period;

  HumanName({
    this.use,
    this.text,
    this.family,
    this.given,
    this.prefix,
    this.suffix,
    this.period,
  });

  factory HumanName.fromJson(Map<String, dynamic> json) => _$HumanNameFromJson(json);
  Map<String, dynamic> toJson() => _$HumanNameToJson(this);
}

@JsonSerializable(includeIfNull: false)
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

  Extension({
    this.url,
    this.valueString,
    this.valueCode,
    this.valueAddress,
    this.valueBoolean,
    this.valueHumanName,
    this.valueReference,
    this.valueDate,
    this.valueIdentifier,
    this.valueDecimal,
  });

  factory Extension.fromJson(Map<String, dynamic> json) => _$ExtensionFromJson(json);
  Map<String, dynamic> toJson() => _$ExtensionToJson(this);
}

@JsonSerializable(includeIfNull: false)
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

  Address({
    this.use,
    this.type,
    this.text,
    this.line,
    this.city,
    this.district,
    this.state,
    this.postalCode,
    this.country,
    this.period,
  });

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Meta extends FHIRElement {
  String versionId;
  DateTime lastUpdated;
  String profile;
  Coding security;
  Coding tag;

  Meta({
    this.versionId,
    this.lastUpdated,
    this.profile,
    this.security,
    this.tag,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable(includeIfNull: false)
class CodeableConcept extends FHIRElement {
  List<Coding> coding;
  String text;

  CodeableConcept({
    this.coding,
    this.text,
  });

  factory CodeableConcept.fromJson(Map<String, dynamic> json) => _$CodeableConceptFromJson(json);
  Map<String, dynamic> toJson() => _$CodeableConceptToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Period extends FHIRElement {
  DateTime start;
  DateTime end;

  Period({
    this.start,
    this.end,
  });

  factory Period.fromJson(Map<String, dynamic> json) => _$PeriodFromJson(json);
  Map<String, dynamic> toJson() => _$PeriodToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Contact extends BackboneElement {
  List<CodeableConcept> relationship;
  HumanName name;
  List<ContactPoint> telecom;
  Address address;
  Code gender;
  Reference organization;
  Period period;

  Contact({
    this.relationship,
    this.name,
    this.telecom,
    this.address,
    this.gender,
    this.organization,
    this.period,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ContactPoint extends FHIRElement {
  String system;
  String value;
  String use;
  int rank;
  Period period;

  ContactPoint({
    this.system,
    this.value,
    this.use,
    this.rank,
    this.period,
  });

  factory ContactPoint.fromJson(Map<String, dynamic> json) => _$ContactPointFromJson(json);
  Map<String, dynamic> toJson() => _$ContactPointToJson(this);
}

@JsonSerializable(includeIfNull: false)
class ContactDetail extends FHIRElement {
  String name;
  ContactPoint telecom;

  ContactDetail({
    this.name,
    this.telecom,
  });

  factory ContactDetail.fromJson(Map<String, dynamic> json) => _$ContactDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ContactDetailToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Reference extends FHIRElement {
  String reference;
  Identifier identifier;
  String display;

  Reference({
    this.reference,
    this.identifier,
    this.display,
  });

  factory Reference.fromJson(Map<String, dynamic> json) => _$ReferenceFromJson(json);
  Map<String, dynamic> toJson() => _$ReferenceToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Identifier extends FHIRElement {
  String use;
  CodeableConcept type;
  String system;
  String value;
  Period period;
  Reference assigner;

  Identifier({
    this.use,
    this.type,
    this.system,
    this.value,
    this.period,
    this.assigner,
  });

  factory Identifier.fromJson(Map<String, dynamic> json) => _$IdentifierFromJson(json);
  Map<String, dynamic> toJson() => _$IdentifierToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Resource extends IResource {
  String resourceType;
  String id;
  Meta meta;
  String implicitRules;
  Code language;

  Resource({
    this.resourceType,
    this.id,
    this.meta,
    this.implicitRules,
    this.language,
  });

  factory Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);
  Map<String, dynamic> toJson() => _$ResourceToJson(this);
}

@JsonSerializable(includeIfNull: false)
class PatientCommunication extends BackboneElement {
  CodeableConcept language;
  bool preferred;

  PatientCommunication({
    this.language,
    this.preferred,
  });

  factory PatientCommunication.fromJson(Map<String, dynamic> json) => _$PatientCommunicationFromJson(json);
  Map<String, dynamic> toJson() => _$PatientCommunicationToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Link extends BackboneElement {
  Reference other;
  Code type;

  Link({
    this.other,
    this.type,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
  Map<String, dynamic> toJson() => _$LinkToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Patient extends DomainResource {
  final String resourceType = 'Patient';

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

  Patient({
    this.identifier,
    this.active,
    this.name,
    this.telecom,
    this.gender,
    this.birthDate,
    this.address,
    this.maritalStatus,
    this.contact,
    this.communication,
    this.generalPractitioner,
    this.managingOrganization,
    this.link,
  });

  factory Patient.fromJson(Map<String, dynamic> json) => _$PatientFromJson(json);
  Map<String, dynamic> toJson() => _$PatientToJson(this);
}

@JsonSerializable(includeIfNull: false)
class QuestionnaireResponseItem extends BackboneElement {
  String linkId;
  String definition;
  String text;
  List<Answer> answer;

  QuestionnaireResponseItem({
    this.linkId,
    this.definition,
    this.text,
    this.answer,
  });

  factory QuestionnaireResponseItem.fromJson(Map<String, dynamic> json) => _$QuestionnaireResponseItemFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionnaireResponseItemToJson(this);
}

@JsonSerializable(includeIfNull: false)
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

  Answer({
    this.valueBoolean,
    this.valueDecimal,
    this.valueInteger,
    this.valueDate,
    this.valueDateTime,
    this.valueTime,
    this.valueString,
    this.valueUri,
    this.valueAttachment,
    this.valueCoding,
    this.valueQuantity,
    this.valueReference,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => _$AnswerFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Attachment extends FHIRElement {
  Code contentType;
  Code language;
  String data;
  String url;
  double size;
  String hash;
  String title;
  String creation;

  Attachment({
    this.contentType,
    this.language,
    this.data,
    this.url,
    this.size,
    this.hash,
    this.title,
    this.creation,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) => _$AttachmentFromJson(json);
  Map<String, dynamic> toJson() => _$AttachmentToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Quantity extends FHIRElement {
  double value;
  Code comparator;
  String unit;
  String system;
  Code code;

  Quantity({
    this.value,
    this.comparator,
    this.unit,
    this.system,
    this.code,
  });

  factory Quantity.fromJson(Map<String, dynamic> json) => _$QuantityFromJson(json);
  Map<String, dynamic> toJson() => _$QuantityToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Questionnaire extends DomainResource {
  final String resourceType = 'Questionnaire';

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

  Questionnaire({
    this.url,
    this.identifier,
    this.version,
    this.name,
    this.title,
    this.status,
    this.experimental,
    this.subjectType,
    this.date,
    this.publisher,
    this.contact,
    this.description,
    this.useContext,
    this.jurisdiction,
    this.purpose,
    this.copyright,
    this.approvalDate,
    this.lastReviewDate,
    this.effectivePeriod,
    this.code,
    this.item,
  });

  factory Questionnaire.fromJson(Map<String, dynamic> json) => _$QuestionnaireFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionnaireToJson(this);
}

@JsonSerializable(includeIfNull: false)
class QuestionnaireResponse extends DomainResource {
  final String resourceType = 'QuestionnaireResponse';

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

  QuestionnaireResponse({
    this.identifier,
    this.basedOn,
    this.parent,
    this.questionnaire,
    this.status,
    this.context,
    this.authored,
    this.author,
    this.source,
    this.item,
    this.subject,
  });

  factory QuestionnaireResponse.fromJson(Map<String, dynamic> json) => _$QuestionnaireResponseFromJson(json);
  Map<String, dynamic> toJson() => _$QuestionnaireResponseToJson(this);
}

@JsonSerializable(includeIfNull: false)
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

  Item({
    this.linkId,
    this.definition,
    this.code,
    this.prefix,
    this.text,
    this.type,
    this.enableWhen,
    this.enableBehavior,
    this.required,
    this.repeats,
    this.readOnly,
    this.maxLength,
    this.answerValueSet,
    this.answerOption,
    this.initial,
    this.item,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable(includeIfNull: false)
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

  Initial({
    this.valueBoolean,
    this.valueDecimal,
    this.valueInteger,
    this.valueDate,
    this.valueDateTime,
    this.valueTime,
    this.valueString,
    this.valueUri,
    this.valueAttachment,
    this.valueCoding,
    this.valueQuantity,
    this.valueReference,
  });

  factory Initial.fromJson(Map<String, dynamic> json) => _$InitialFromJson(json);
  Map<String, dynamic> toJson() => _$InitialToJson(this);
}

@JsonSerializable(includeIfNull: false)
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

  EnableWhen({
    this.question,
    this.operator,
    this.answerBoolean,
    this.answerDecimal,
    this.answerInteger,
    this.answerDate,
    this.answerDateTime,
    this.answerTime,
    this.answerString,
    this.answerCoding,
    this.answerQuantity,
    this.answerReference,
  });

  factory EnableWhen.fromJson(Map<String, dynamic> json) => _$EnableWhenFromJson(json);
  Map<String, dynamic> toJson() => _$EnableWhenToJson(this);
}

@JsonSerializable(includeIfNull: false)
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

  ValueSet({
    this.url,
    this.identifier,
    this.version,
    this.name,
    this.title,
    this.status,
    this.experimental,
    this.date,
    this.publisher,
    this.contact,
    this.description,
    this.useContext,
    this.jurisdiction,
    this.immutable,
    this.purpose,
    this.copyright,
    this.compose,
    this.expansion,
  });

  factory ValueSet.fromJson(Map<String, dynamic> json) => _$ValueSetFromJson(json);
  Map<String, dynamic> toJson() => _$ValueSetToJson(this);
}

@JsonSerializable(includeIfNull: false)
class DomainResource extends Resource {
  Narrative text;
  List<Resource> contained;
  List<Extension> extension;
  List<Extension> modifierExtension;

  DomainResource({
    this.text,
    this.contained,
    this.extension,
    this.modifierExtension,
  });

  factory DomainResource.fromJson(Map<String, dynamic> json) => _$DomainResourceFromJson(json);
  Map<String, dynamic> toJson() => _$DomainResourceToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Narrative {
  Code status;
  String div;

  Narrative({
    this.status,
    this.div,
  });

  factory Narrative.fromJson(Map<String, dynamic> json) => _$NarrativeFromJson(json);
  Map<String, dynamic> toJson() => _$NarrativeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Compose extends BackboneElement {
  DateTime lockedDate;
  bool inactive;
  List<Include> include;

  Compose({
    this.lockedDate,
    this.inactive,
    this.include,
  });

  factory Compose.fromJson(Map<String, dynamic> json) => _$ComposeFromJson(json);
  Map<String, dynamic> toJson() => _$ComposeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Expansion extends BackboneElement {
  Identifier identifier;
  DateTime timestamp;
  int total;
  int offset;
  Parameter parameter;
  Contains contains;

  Expansion({
    this.identifier,
    this.timestamp,
    this.total,
    this.offset,
    this.parameter,
    this.contains,
  });

  factory Expansion.fromJson(Map<String, dynamic> json) => _$ExpansionFromJson(json);
  Map<String, dynamic> toJson() => _$ExpansionToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Filter extends BackboneElement {
  Code property;
  Code op;
  String value;

  Filter({
    this.property,
    this.op,
    this.value,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Include extends BackboneElement {
  String system;
  String version;
  Concept concept;
  Filter filter;

  Include({
    this.system,
    this.version,
    this.concept,
    this.filter,
  });

  factory Include.fromJson(Map<String, dynamic> json) => _$IncludeFromJson(json);
  Map<String, dynamic> toJson() => _$IncludeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Designation extends BackboneElement {
  Code language;
  Coding use;
  String value;

  Designation({
    this.language,
    this.use,
    this.value,
  });

  factory Designation.fromJson(Map<String, dynamic> json) => _$DesignationFromJson(json);
  Map<String, dynamic> toJson() => _$DesignationToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Concept extends BackboneElement {
  Code code;
  String display;
  List<Designation> designation;

  Concept({
    this.code,
    this.display,
    this.designation,
  });

  factory Concept.fromJson(Map<String, dynamic> json) => _$ConceptFromJson(json);
  Map<String, dynamic> toJson() => _$ConceptToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Contains extends BackboneElement {
  String system;
  bool abstract;
  bool inactive;
  String version;
  Code code;
  String display;
  List<Designation> designation;
  List<Contains> contains;

  Contains({
    this.system,
    this.abstract,
    this.inactive,
    this.version,
    this.code,
    this.display,
    this.designation,
    this.contains,
  });

  factory Contains.fromJson(Map<String, dynamic> json) => _$ContainsFromJson(json);
  Map<String, dynamic> toJson() => _$ContainsToJson(this);
}

@JsonSerializable(includeIfNull: false)
class FHIRRange extends FHIRElement {
  int low;
  int high;

  FHIRRange({
    this.low,
    this.high,
  });

  factory FHIRRange.fromJson(Map<String, dynamic> json) => _$FHIRRangeFromJson(json);
  Map<String, dynamic> toJson() => _$FHIRRangeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class UsageContext extends FHIRElement {
  Coding code;
  CodeableConcept valueCodeableConcept;
  Quantity valueQuantity;
  FHIRRange valueRange;

  UsageContext({
    this.code,
    this.valueCodeableConcept,
    this.valueQuantity,
    this.valueRange,
  });

  factory UsageContext.fromJson(Map<String, dynamic> json) => _$UsageContextFromJson(json);
  Map<String, dynamic> toJson() => _$UsageContextToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Parameter extends BackboneElement {
  String name;
  String valueString;
  bool valueBoolean;
  int valueInteger;
  double valueDecimal;
  String valueUri;
  Code valueCode;
  DateTime valueDateTime;

  Parameter({
    this.name,
    this.valueString,
    this.valueBoolean,
    this.valueInteger,
    this.valueDecimal,
    this.valueUri,
    this.valueCode,
    this.valueDateTime,
  });

  factory Parameter.fromJson(Map<String, dynamic> json) => _$ParameterFromJson(json);
  Map<String, dynamic> toJson() => _$ParameterToJson(this);
}

@JsonSerializable(includeIfNull: false)
class AnswerOption extends BackboneElement {
  DateTime valueDate;
  String valueTime;
  String valueString;
  Coding valueCoding;
  Reference valueReference;

  AnswerOption({
    this.valueDate,
    this.valueTime,
    this.valueString,
    this.valueCoding,
    this.valueReference,
  });

  factory AnswerOption.fromJson(Map<String, dynamic> json) => _$AnswerOptionFromJson(json);
  Map<String, dynamic> toJson() => _$AnswerOptionToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Bundle extends Resource {
  final String resourceType = 'Bundle';

  Identifier identifier;
  Code type;
  DateTime timestamp;
  int total;
  List<BundleLink> link;
  List<BundleEntry> entry;
  Signature signature;

  Bundle({
    this.identifier,
    this.type,
    this.timestamp,
    this.total,
    this.link,
    this.entry,
    this.signature,
  });

  factory Bundle.fromJson(Map<String, dynamic> json) => _$BundleFromJson(json);
  Map<String, dynamic> toJson() => _$BundleToJson(this);
}

@JsonSerializable(includeIfNull: false)
class BundleLink extends BackboneElement {
  String relation;
  String url;

  BundleLink({
    this.relation,
    this.url,
  });

  factory BundleLink.fromJson(Map<String, dynamic> json) => _$BundleLinkFromJson(json);
  Map<String, dynamic> toJson() => _$BundleLinkToJson(this);
}

@JsonSerializable(includeIfNull: false)
class BundleEntry extends BackboneElement {
  BundleLink link;
  String fullUrl;
  Resource resource;

  BundleEntry({
    this.link,
    this.fullUrl,
    this.resource,
  });

  factory BundleEntry.fromJson(Map<String, dynamic> json) => _$BundleEntryFromJson(json);
  Map<String, dynamic> toJson() => _$BundleEntryToJson(this);
}

@JsonSerializable(includeIfNull: false)
class BundleSearch extends BackboneElement {
  Code mode;
  double score;

  BundleSearch({
    this.mode,
    this.score,
  });

  factory BundleSearch.fromJson(Map<String, dynamic> json) => _$BundleSearchFromJson(json);
  Map<String, dynamic> toJson() => _$BundleSearchToJson(this);
}

@JsonSerializable(includeIfNull: false)
class BundleRequest extends BackboneElement {
  Code request;
  String url;
  String ifNoneMatch;
  DateTime ifModifiedSince;
  String ifMatch;
  String ifNoneExist;

  BundleRequest({
    this.request,
    this.url,
    this.ifNoneMatch,
    this.ifModifiedSince,
    this.ifMatch,
    this.ifNoneExist,
  });

  factory BundleRequest.fromJson(Map<String, dynamic> json) => _$BundleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$BundleRequestToJson(this);
}

@JsonSerializable(includeIfNull: false)
class BundleResponse extends BackboneElement {
  String status;
  String location;
  String etag;
  DateTime lastModified;
  Resource outcome;

  BundleResponse({
    this.status,
    this.location,
    this.etag,
    this.lastModified,
    this.outcome,
  });

  factory BundleResponse.fromJson(Map<String, dynamic> json) => _$BundleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BundleResponseToJson(this);
}

@JsonSerializable(includeIfNull: false)
class Signature extends FHIRElement {
  List<Coding> type;
  DateTime when;
  Reference who;
  Reference onBehalfOf;
  Code targetFormat;
  Code sigFormat;
  String data;

  Signature({
    this.type,
    this.when,
    this.who,
    this.onBehalfOf,
    this.targetFormat,
    this.sigFormat,
    this.data,
  });

  factory Signature.fromJson(Map<String, dynamic> json) => _$SignatureFromJson(json);
  Map<String, dynamic> toJson() => _$SignatureToJson(this);
}

@JsonSerializable(includeIfNull: false)
class OperationOutcome extends DomainResource {
  List<OperationOutcomeIssue> issue;

  OperationOutcome({
    this.issue,
  });

  factory OperationOutcome.fromJson(Map<String, dynamic> json) => _$OperationOutcomeFromJson(json);
  Map<String, dynamic> toJson() => _$OperationOutcomeToJson(this);
}

@JsonSerializable(includeIfNull: false)
class OperationOutcomeIssue extends BackboneElement {
  Code severity;
  Code code;
  CodeableConcept details;
  String diagnostics;
  List<String> location;
  List<String> expression;

  OperationOutcomeIssue({
    this.severity,
    this.code,
    this.details,
    this.diagnostics,
    this.location,
    this.expression,
  });

  factory OperationOutcomeIssue.fromJson(Map<String, dynamic> json) => _$OperationOutcomeIssueFromJson(json);
  Map<String, dynamic> toJson() => _$OperationOutcomeIssueToJson(this);
}