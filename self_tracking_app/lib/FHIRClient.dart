import 'dart:io';

import 'models/FHIR.dart';
import 'IFHIRClient.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'JsonSerializer.dart';

class FHIRClient extends IFHIRClient {
  String _baseUrl;
  static final JsonSerializer _jsonSerializer = JsonSerializer();

  FHIRClient(String baseUrl) {
    if (baseUrl != null) {
      this._baseUrl = baseUrl.endsWith('/')
          ? baseUrl.substring(0, baseUrl.length - 1)
          : baseUrl;
    }
  }

  Future<T> create<T extends IResource>(T resource) async {
    FHIRRequest request = processOnBeforeRequest(FHIRRequest(
      url: '$_baseUrl/${resource.resourceType}',
      headers: <String, String> {
        'Content-Type': 'application/fhir+json',
      },
      resource: resource,
      httpVerb: HttpVerb.POST,
      requestType: RequestType.CREATE,
    ));
    http.Response response = processOnAfterResponse(await http.post(
      request.url,
      headers: request.headers,
      body: _jsonSerializer.serialize(resource),
    ));
    if (response.statusCode == 201) {
      return _jsonSerializer.deserialize(response.body);
    } else {
      throw HttpException(response.body);
    }
  }

  Future<T> read<T extends IResource>(String id) async {
    FHIRRequest request = processOnBeforeRequest(FHIRRequest(
      url: '$_baseUrl/$id',
      headers: <String, String> {
        'Content-Type': 'application/fhir+json',
      },
      httpVerb: HttpVerb.GET,
      requestType: RequestType.READ,
    ));
    http.Response response = processOnAfterResponse(await http.get(
      request.url,
      headers: request.headers,
    ));
    if (response.statusCode == 200) {
      return _jsonSerializer.deserialize(response.body);
    } else {
      throw HttpException(response.body);
    }
  }

  Future<T> update<T extends IResource>(T resource) async {
    FHIRRequest request = processOnBeforeRequest(FHIRRequest(
      url: '$_baseUrl/${resource.resourceType}/${resource.id}',
      headers: <String, String> {
        'Content-Type': 'application/fhir+json',
      },
      httpVerb: HttpVerb.PUT,
      requestType: RequestType.UPDATE,
    ));
    http.Response response = processOnAfterResponse(await http.put(
      request.url,
      headers: request.headers,
      body: jsonEncode(request.resource.toJson()),
    ));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return _jsonSerializer.deserialize(response.body);
    } else {
      throw HttpException(response.body);
    }
  }

  Future<OperationOutcome> delete(String url) async {
    FHIRRequest request = processOnBeforeRequest(FHIRRequest(
      url: '$_baseUrl/$url',
      headers: <String, String> {
        'Content-Type': 'application/fhir+json',
      },
      httpVerb: HttpVerb.DELETE,
      requestType: RequestType.DELETE,
    ));
    http.Response response = processOnAfterResponse(await http.delete(
      request.url,
      headers: request.headers,
    ));
    if (response.statusCode == 200) {
      return _jsonSerializer.deserialize(response.body);
    } else {
      throw HttpException(response.body);
    }
  }

  Future<Bundle> search(String url) async {
    FHIRRequest request = processOnBeforeRequest(FHIRRequest(
      url: '$_baseUrl/$url',
      headers: <String, String> {
        'Content-Type': 'application/fhir+json',
      },
      httpVerb: HttpVerb.GET,
      requestType: RequestType.SEARCH,
    ));
    http.Response response = processOnAfterResponse(await http.get(
      request.url,
      headers: request.headers,
    ));
    if (response.statusCode == 200) {
      return _jsonSerializer.deserialize(response.body);
    } else {
      throw HttpException(response.body);
    }
  }

}