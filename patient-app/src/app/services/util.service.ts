import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UtilService {

  constructor() { }


  getAllIndexes(arr, val) {
    var indexes = [], i = -1;
    while ((i = arr.indexOf(val, i + 1)) != -1) {
      indexes.push(i);
    }
    return indexes;
  }

  compareValues(valueWithSpaces, staticValue) {
    const normalizedValue = this.getNormalizedValue(valueWithSpaces);
    return normalizedValue === staticValue;
  }

  getNormalizedValue(value) {
    return value.toLowerCase().replace(/ +/g, "");
  }

  extractAnswers(answerOption) {
    const valueObj: any = {};
    valueObj.code = answerOption.code[0].code;
    valueObj.system = answerOption.code[0].system;
    valueObj.display = answerOption.text;
    valueObj.linkId = answerOption.linkId;
    return valueObj;
  }

  randomString(length) {
    var result = '';
    const chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    for (var i = length; i > 0; --i) result += chars[Math.floor(Math.random() * chars.length)];
    return result;
  }
}
