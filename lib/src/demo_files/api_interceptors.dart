import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';

class ApiResponseInterceptor extends ResponseInterceptor {
  @override
  FutureOr<Response> onResponse(Response response) {
    debugPrint("[Received Response] >> [${response.statusCode} FROM ${response.base.request!.url}]");
    debugPrint("[${response.base.request!.method}] >> [${response.bodyString}]");
    return response;
  }
}

class ApiRequestInterceptor extends RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    debugPrint("[Request sent to] >> [${request.url}]");
    if (request.method.contains(RegExp('POST|PUT|GET'))) {
      debugPrint("[Request body sent:] >> [${request.body}]");
    }
    if (request.parameters.isNotEmpty) {
      debugPrint("[Request query params sent:] >> [${request.parameters}]");
    }
    return request;
  }
}
