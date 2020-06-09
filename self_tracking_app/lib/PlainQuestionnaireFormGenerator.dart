
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'models/FHIR.dart';

typedef ItemToWidgetFunc = Widget Function(Item);
typedef OnSubmitFunc = void Function(QuestionnaireResponse response, Map<String, List<FHIRType>>);

class PlainQuestionnaireFormGenerator extends StatefulWidget {
  final Questionnaire questionnaire;
  final Map<String, ItemToWidgetFunc> overrideWidgets;
  final List<OnSubmitFunc> onSubmit;

  PlainQuestionnaireFormGenerator(this.questionnaire, {
    this.overrideWidgets,
    this.onSubmit,
  });

  @override
  _PlainQuestionnaireFormGeneratorState createState() {
    return _PlainQuestionnaireFormGeneratorState();
  }
}

class _PlainQuestionnaireFormGeneratorState extends State<PlainQuestionnaireFormGenerator> {
  final _formKey = GlobalKey<FormState>();
  ScrollController _scrollController;
  Questionnaire _questionnaire;

  Map<String, ItemToWidgetFunc> _funcMap  = {};
  Map<String, bool> _isVisible            = {};
  Map<String, List<FHIRType>> _answers    = {};
  List<Item> _items                       = [];
  Map<String, ItemToWidgetFunc> _generateFuncMap() {
    return {
      'string': generateStringItem,
      'choice': generateChoiceItem,
      'date': generateDateItem,
    };
  }

  Widget generateDateItem(Item item) {
    final format = DateFormat("yyyy-MM-dd");
    return DateTimeField(
      enabled: _isVisible[item.linkId],
      format: format,
      decoration: InputDecoration(
        labelText: item.text,
      ),
      onShowPicker: (context, currentValue) {
        return showDatePicker(
            context: context,
            firstDate: DateTime(1900),
            initialDate: currentValue ?? DateTime.now(),
            lastDate: DateTime(2100));
      },
      onChanged: (val) {
        _answers[item.linkId] = [StringType(value: val?.toIso8601String())];
        updateEnabled();
      },
    );
  }

  Widget generateStringItem(Item item) {
    return Visibility(
      visible: _isVisible[item.linkId] != false,
      child: TextFormField(
        enabled: _isVisible[item.linkId],
        decoration: InputDecoration(
          labelText: item.text,
        ),
        validator: (value) {
          if (item.required == true && value.isEmpty)
            return 'Please enter some text';
          return null;
        },
        onChanged: (val) {
          _answers[item.linkId] = [StringType(value: val)];
          updateEnabled();
        },
      )
    );
  }

  Widget generateChoiceItem(Item item) {
    return Visibility(
      visible: _isVisible[item.linkId] != false,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: item.text,
        ),
        onChanged: (val) {
          _answers[item.linkId] = [val];
          updateEnabled();
        },
        validator: (value) {
          if (item.required == true && value == null)
            return 'Please choose a value';
          return null;
        },
        items: item.answerOption != null ?
        item.answerOption.map((val) {
          return DropdownMenuItem<dynamic>(
              value: _getOptionValue(val),
              child: Text(_getOptionDisplay(val))
          );
        }).toList() : [],
      ),
    );
  }

  bool _enableWhenEqual(FHIRType a, FHIRType b) {
    assert(a.runtimeType == b.runtimeType);
    switch (a.runtimeType) {
      case Coding:
        return (a as Coding).code == (b as Coding).code;
      case StringType:
        return (a as StringType).value == (b as StringType).value;
      default:
        return false;
    }
  }

  bool _isEnabled(Item item, EnableWhen enableWhen, List<FHIRType> answer) {
    bool visible = true;
    for (FHIRType val in answer) {
      switch (enableWhen.operator) {
        case "=":
          {
            visible = _enableWhenEqual(val, enableWhen.answer);
            break;
          }
        default:
          {
            visible = true;
            break;
          }
      }
      if (visible == true)
        return true;
    }
    return false;
  }

  void updateEnabled() {
    for (Item item in _items) {
      if (item.enableWhen == null)
        continue;

      for (EnableWhen enableWhen in item.enableWhen) {
        if (_answers[enableWhen.question] == null) {
          setState(() => _isVisible[item.linkId] = false);
          break;
        }
        List<FHIRType> enableAnswers = _answers[enableWhen.question];
        setState(() =>
            _isVisible[item.linkId] = _isEnabled(item, enableWhen, enableAnswers));
      }
    }
    _isVisible.forEach((key, val) {
      if (val == false)
        _answers[key] = null;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _questionnaire = widget.questionnaire;
    _funcMap = _generateFuncMap();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => updateEnabled());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text(_questionnaire.title),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.save), onPressed: () {
            if (_formKey.currentState.validate()) {
              widget.onSubmit?.forEach((f) => f(generateQuestionnaireResponse(), _answers));
            }
          }),
        ]
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: _getWidgets(),
          controller: _scrollController,
        ),
      ),
    );
  }

  Answer _generateAnswer(dynamic val) {
    Answer answer = Answer();
    if (val is Coding) {
      answer.valueCoding = val;
    } else if (val is QuestionnaireResponseItem) {
      answer.item = val;
    } else if (val is StringType) {
      answer.valueString = val.value;
    }
    return answer;
  }

  QuestionnaireResponse generateQuestionnaireResponse() {
    QuestionnaireResponse response = QuestionnaireResponse(item: []);
    _answers.forEach((key, val) {
      if (val == null)
        return;
      QuestionnaireResponseItem item = QuestionnaireResponseItem(linkId: key, answer: []);
      for (dynamic v in val) {
        item.answer.add(_generateAnswer(v));
      }
      response.item.add(item);
    });
    return response;
  }

  List<Widget> _getWidgets() {
    List<Widget> result = [];

    if (_questionnaire == null || _questionnaire.item == null)
      return result;

    for (Item item in _questionnaire.item) {
      if (widget.overrideWidgets != null &&
          widget.overrideWidgets.containsKey(item.linkId)) {
        _items.add(item);
        result.add(widget.overrideWidgets[item.linkId](item));
      } else if (_funcMap.containsKey(item.type)) {
        _items.add(item);
        result.add(_funcMap[item.type](item));
      }
    }

    return result;
  }

  static dynamic _getOptionValue(AnswerOption option) {
    return option.valueReference  ??
        option.valueCoding        ??
        option.valueDate          ??
        option.valueString        ??
        option.valueTime;
  }

  static String _getOptionDisplay(AnswerOption option) {
    return option.valueCoding?.display ??
        option.valueReference?.display ??
        option.valueDate               ??
        option.valueTime               ??
        option.valueString             ??
        '[EMPTY]';
  }
}