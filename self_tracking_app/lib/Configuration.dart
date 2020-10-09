import 'dart:convert';
import 'package:flutter/services.dart';

class Configuration {
  final String fhirEndpoint;

  Configuration({
    this.fhirEndpoint,
  });

  static Future<Configuration> getConfiguration(String env) async {
    env = env ?? 'dev';

    final contents = await rootBundle.loadString(
      'assets/config/$env.json',
    );

    final json = jsonDecode(contents);

    return Configuration(
        fhirEndpoint: json['fhirEndpoint'],
    );
  }


}