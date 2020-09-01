import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef WidgetFunc = Widget Function(dynamic);

class FutureHelper {
  static getStandardFutureBuilder<T> (Future<T> theFuture, WidgetFunc widgetFunc) {
    return FutureBuilder<T>(
      future: theFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData)
          return widgetFunc(snapshot.data);
        else if (snapshot.hasError)
          throw Exception(snapshot.error.toString());
        return CircularProgressIndicator();
      }
    );
  }
}