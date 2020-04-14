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
  /* FHIR classes used in resources */
  export class Id {
    private id: string;
  
    constructor(input?: string) {
      const re = new RegExp('[A-Za-z0-9\\-\\.]{1,64}');
  
      if (re.test(input)) {
        this.id = input;
      } else {
        throw new RangeError('Not a valid Id string - must match reg exp [A-Za-z0-9\\-\\.]{1,64} Was provided: ' + input);
      }
    }
  }
  
  
  export class Code extends FHIRElement {
    private codeString: string;
    private codeRE = new RegExp('[^\\s]+([\\s]?[^\\s]+)*');
  
    constructor(input?: string) {
      super();
      this.setCode(input);
    }
  
    private setCode(input: string) {
      if (this.codeRE.test(input)) {
        this.codeString = input;
      } else {
        throw new RangeError('Not a valid Id string - must match reg exp [^\\s]+([\\s]?[^\\s]+)* Was provided: ' + input);
      }
    }
  
    get code(): string {
      return this.codeString;
    }
  
    set code(input: string) {
      this.setCode(input);
    }
  
    public toString(): string {
      return this.codeString;
    }
  
    deserialize(jsonObject: any): Code {
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
  
  export class Coding extends FHIRElement {
    system: string;
    version?: string;
    code: string;
    display: string;
    userSelected?: boolean;
  
    deserialize(jsonObject: any): Coding {
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
  
  export class HumanName extends FHIRElement {
    use: Code;
    text: string;
    family: string;
    given: string[];
    prefix: string[];
    suffix: string[];
    period: Period;
  
    deserialize(jsonObject: any): HumanName {
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
    use: Code;
    type: Code;
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
    versionId: Id;
    lastUpdated: Date;
    profile: string;
    security: Coding;
    tag: Coding;
  
    deserialize(jsonObject: any): Meta {
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
    comparator: Code;
    unit: string;
    system: string;
    code: Code;
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
    use: string;
    type: CodeableConcept;
    system: string;
    value: string;
    period: Period;
    assigner: Reference;
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
  
  export class Resource {
    resourceType: string;
    id: string;
    meta: Meta;
    implicitRules: string;
    language: Code;
    extension: Extension[]
  }
  
  export class QuestionnaireResponse extends Resource implements Serializable<QuestionnaireResponse> {
    identifier: Identifier;
    basedOn: Reference[];
    parent: Reference[];
    questionnaire: string;
    status: string;
    context: Reference;
    authored: Date;
    author: Reference;
    source: Reference;
    item: QuestionnaireResponseItem[];
    subject: Reference;
  
    deserialize(jsonObject: any): QuestionnaireResponse {
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
  
  