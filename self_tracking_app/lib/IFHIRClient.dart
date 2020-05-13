import 'FHIR.dart';
import 'package:http/http.dart' as http;

typedef RequestFunc = FHIRRequest Function(FHIRRequest);
typedef ResponseFunc = http.Response Function(http.Response);

abstract class IFHIRClient {
  List<RequestFunc> onBeforeRequest = [];
  List<ResponseFunc> onAfterResponse = [];

  FHIRRequest processOnBeforeRequest(FHIRRequest request) {
    if (onBeforeRequest == null)
      return request;
    for (RequestFunc f in onBeforeRequest) {
      request = f(request);
    }
    return request;
  }

  http.Response processOnAfterResponse(http.Response response) {
    if (onAfterResponse == null)
      return response;
    for (ResponseFunc f in onAfterResponse) {
      response = f(response);
    }
    return response;
  }

  Future<T> create<T extends IResource>(T resource);
  Future<T> read<T extends IResource>(String url);
  Future<T> update<T extends IResource>(T resource);
  Future<OperationOutcome> delete(String url);
  Future<Bundle> search(String url);
}

class FHIRRequest {
  String url;
  Map<String, String> headers;
  IResource resource;
  final HttpVerb httpVerb;
  final RequestType requestType;

  FHIRRequest({
    this.url,
    this.headers,
    this.resource,
    this.httpVerb,
    this.requestType,
  });
}

enum HttpVerb {
  GET,
  POST,
  PUT,
  DELETE,
  PATCH,
}

enum RequestType {
  SEARCH,
  READ,
  UPDATE,
  CREATE,
  DELETE,
}