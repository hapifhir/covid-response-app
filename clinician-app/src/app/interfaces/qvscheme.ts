export class QvScheme {
    resourceType: string;
    id: string;
    meta: Meta;
    identifier?: (IdentifierEntity)[] | null;
    name: string;
    title: string;
    description: string;
    item?: (ItemGroupEntity)[] | null;
  }
  export class Meta {
    versionId: string;
    lastUpdated: string;
    source: string;
  }
  export class IdentifierEntity {
    value: string;
  }
  export class ItemEntity {
    linkId: string;
    text: string;
    type: string;
    required?: boolean | null;
    answerOption?: (AnswerOptionEntity)[] | null;
    enableWhen?: (EnableWhenEntity)[] | null;
    value: string=""; //nota - add questionnari json values
    
  }
  
  export class ItemGroupEntity {
    linkId: string;
    text: string;
    type: string;
    item: (ItemEntity)[] | null;
    
}
 
  export class AnswerOptionEntity {
    valueCoding: ValueCodingOrAnswerCoding;
  }
  export class ValueCodingOrAnswerCoding {
    system: string;
    code: string;
    display: string;
  }
  export class EnableWhenEntity {
    question: string;
    operator: string;
    answerBoolean?: boolean | null;
    answerCoding?: ValueCodingOrAnswerCoding | null;
  }
  
  
    

