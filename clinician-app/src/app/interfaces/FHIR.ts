export interface Serializable<T> {
  deserialize(input: object): T;
}

/* This is base class from which other elements are derived */
export class FHIRElement {
  id: string;
  extension: Extension[];
}

export class BackboneElement extends FHIRElement {
  modifierExtension: any;
}

// export class Code extends FHIRElement {
//   private codeString: string;
//   private codeRE = new RegExp('[^\\s]+([\\s]?[^\\s]+)*');
// }

export class Coding extends FHIRElement {
  system: string;
  version?: string;
  code: string;
  display: string;
  userSelected?: boolean;
}

export class HumanName extends FHIRElement {
  use: string;
  text: string;
  family: string;
  given: string[];
  prefix: string[];
  suffix: string[];
  period: Period;
}

export class Extension {
  url: string;
  valueString: string;
  valueCode: string;
  valueAddress: Address;
  valueBoolean?: boolean;
  valueHumanName: HumanName;
  valueReference: Reference;
  valueDate: Date;
  valueIdentifier: string;
  valueDecimal?: number;
}

export class Address extends FHIRElement {
  use: string;
  type: string;
  text: string;
  line: string[];
  city: string;
  district: string;
  state: string;
  postalCode: string;
  country: string;
  period: Period;
}

export class Meta extends FHIRElement {
  versionId: string;
  lastUpdated: Date;
  profile: string;
  security: Coding;
  tag: Coding;
}

export class CodeableConcept extends FHIRElement {
  coding: Coding[];
  text: string;
}

export class Period extends FHIRElement {
  start: string;
  end: string;
}

export class Quantity extends FHIRElement {
  value: number;
  comparator: string;
  unit: string;
  system: string;
  code: string;
}

export class Attachment extends FHIRElement {

  // should be of type code
  contentType: string;
  // should be of type code
  language: string;
  data: string;
  url: string;
  size: number;
  hash: string;
  title: string;
  creation: string;
}

export class Reference extends FHIRElement {
  reference: string;
  identifier: Identifier;
  display: string;
}

export class Identifier extends FHIRElement {
  use?: string;
  type?: CodeableConcept;
  system?: string;
  value?: string;
  period?: Period;
  assigner?: Reference;
}

export class Answer extends BackboneElement {
  valueBoolean?: boolean;
  valueDecimal?: number;
  valueInteger?: number;
  valueDate?: Date;
  valueDateTime?: Date;
  valueTime?: string;
  valueString?: string;
  valueUri?: string;
  valueAttachment?: Attachment;
  valueCoding?: Coding;
  valueQuantity?: Quantity;
  valueReference?: Reference;
}

export class QuestionnaireResponseItem extends BackboneElement {
  linkId: string;
  definition: string;
  text: string;
  answer: Answer[];
}

export class QuestionnaireResponseGroupItem extends BackboneElement {
  linkId: string;
  definition: string;
  text: string;
  item: QuestionnaireResponseItem[];
}

export class Resource {
  resourceType: string;
  id: string;
  meta: Meta;
  implicitRules: string;
  language: string;
  extension: Extension[]
}

export class QuestionnaireResponse extends Resource {
  identifier: Identifier;
  basedOn: Reference[];
  parent: Reference[];
  questionnaire: string;
  status: string;
  context: Reference;
  authored: Date;
  author: Reference;
  source: Reference;
  item: QuestionnaireResponseGroupItem[];
  subject: Reference;
}

export class Patient extends Resource {
  identifier: Identifier[];
  active: boolean;
  name: HumanName[];
  telecom: ContactPoint[];
  gender: string;
  birthDate: string;
  address: Address[];
  maritalStatus: CodeableConcept;
  contact: Contact[];
  communication: PatientCommunication[];
  generalPractitioner: Reference[];
  managingOrganization: Reference;
  link: Link[];
}

export class Contact extends BackboneElement {
  relationship: CodeableConcept[];
  name: HumanName;
  telecom: ContactPoint[];
  address: Address;
  gender: string;
  organization: Reference;
  period: Period;
}

export class ContactPoint extends FHIRElement {
  system: string;
  value: string;
  use: string;
  rank: number;
  period: Period;
}

export class PatientCommunication extends BackboneElement {
  language: CodeableConcept;
  preferred: boolean;
}

export class Link extends BackboneElement {
  other: Reference;
  type: string;
}

export class Range extends FHIRElement {
  low: number;
  high: number;
} 

export class ServiceRequest extends Resource {
  identifier?: Identifier[];
  instantiatesCanonical?: string[];
  instantiatesUri?: string[];
  basedOn?: Reference[];
  replaces?: Reference[];
  requisition?: Identifier;
  status: string;
  intent: string;
  category?: CodeableConcept[];
  priority: string;
  doNotPerform?: boolean;
  code?: CodeableConcept;
  orderDetail?: CodeableConcept[];
  quantity?: Quantity | Ratio | Range;
  subject?: Reference;
  encounter?: Reference;
  occurence?: Period | Timing | Date;
  asNeeded?: boolean | CodeableConcept;
  authoredOn?: Date;
  requester?: Reference;
  performerType?: CodeableConcept;
  performer?: Reference[];
  locationCode?: CodeableConcept[];
  locationReference?: Reference[];
  reasonCode?: CodeableConcept[];
  reasonReference?: Reference[];
  insurance?: Reference[];
  supportingInfo?: Reference[];
  specimen?: Reference[];
  bodySite?: CodeableConcept[];
  note?: Annotation[];
  patientInstuction?: string;
  relevantHistory?: Reference[];
}

export class Annotation extends FHIRElement {
  authorReference: Reference;
  authorString: string;
  time: Date;
  text: string;
}
export class Timing extends FHIRElement {
  event: Date;
  // TODO work on a Timing object
  repeat: string;
  location: Reference;
  performer: Reference[];
  productCodeableConcept: CodeableConcept;
  productReference: Reference;
  dailyAmount: string;
  quantity: string;
  description: string;
}

export class Ratio extends FHIRElement {
  numerator: Quantity;
  denominator: Quantity;
}


export class Questionnaire extends Resource{
  identifier?: (Identifier)[] | null;
  name: string;
  title: string;
  description: string;
  item?: (QuestionnaireItemGroup)[] | null;
}
export class QuestionnaireItem {
  linkId: string;
  text: string;
  type: string;
  required?: boolean | null;
  answerOption?: (AnswerOption)[] | null;
  enableWhen?: (EnableWhen)[] | null;
  value: string=""; //nota - add questionnari json values
  
}

export class QuestionnaireItemGroup {
  linkId: string;
  text: string;
  type: string;
  item: (QuestionnaireItem)[] | null;
  
}
export class AnswerOption {
  valueCoding: Coding;
}
export class EnableWhen {
  question: string;
  operator: string;
  answerBoolean?: boolean | null;
  answerCoding?: Coding | null;
}

export class Bundle extends Resource implements Serializable<Bundle> {
  identifier: Identifier;
  type: string;
  timestamp: string;
  total: number;
  link: BundleLink[];
  entry: Entry[];
  signature: Signature;

  deserialize(jsonObject: any): Bundle {
    const that = this;
    Object.entries(jsonObject).forEach((value) => {
      if (!(typeof value[1] === 'object')) {
        that[value[0]] = value[1];
      } else {
        (that[value[0]].deserialize(value[1]));
      }
    });
    return this;
  }
}

export class BundleLink extends BackboneElement {
  relation: string;
  url: string;
}

export class Entry extends BackboneElement {
  link: BundleLink[];
  fullUrl: string;
  resource: Resource;
  search: Search;
  request: Request;
  response: Response;
}

export class Signature extends FHIRElement {
  type: Coding[];
  when: string;
  who: Reference;
  targetFormat: string;
  sigFormat: string;
  data: string;
}

export class Search extends BackboneElement {
  mode: string;
  score: number;
}

export class Request extends BackboneElement {
  method: string;
  url: string;
  ifNoneMatch: string;
  ifModifiedSince: number;
  ifMatch: number;
  ifNoneExist: number;
}