import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'url.dart';

enum RequestType { Get, Post, Put, Delete }

class Api {
  ///url: string url end point \n
  ///type: request type \n
  ///body: body to passed to request
  ///header: defaults to {"Content-Type": "application/json;charset=UTF-8"}
  Future<dynamic> request({
    required String url,
    RequestType type = RequestType.Get,
    Map<String, dynamic> body = const {},
    dynamic body2,
    Map <String, String?> body3 = const{},
    Map<String, String> header = const {
      "Content-Type": "application/json;charset=UTF-8"
    },
  }) async {
    print(url);
    http.Response? response;
    switch (type) {
      case RequestType.Get:
        print(Uri.parse(Url.serverPath + url));
        response = await http.get(Uri.parse(Url.serverPath + url), headers: header);

        break;
      case RequestType.Post:
        print(Uri.parse(Url.serverPath + url));
        response = await http.post(Uri.parse(Url.serverPath + url),
            body: jsonEncode(body), headers: header);
        break;

      case RequestType.Delete:
        print(Uri.parse(Url.serverPath + url));
        response = await http.delete(Uri.parse(Url.serverPath + url),
            body: jsonEncode(body), headers: header);
        break;

      default:
    }
    if (response!.statusCode == 200 || response.statusCode == 401) {
      return response.body;
    }
    if (response.statusCode == 404)
      return {"error": "404", "message": response.reasonPhrase};
  }
}

class Error {
  final String error;
  Error({required this.error});
  @override
  String toString() => error;
}

