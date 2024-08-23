import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

// Source: https://stackoverflow.com/a/67493631

class GqlParser {
  final String rootPath;
  /// Provide the path relative to of the folder containing graphql queries, with no trailing or leading "/".
  /// For example, if entire project is inside the `my_app` folder, and graphql queries are inside `assets/graphql`,
  /// use `assets/graphql` as the argument.
  const GqlParser({this.rootPath = 'assets/graphql'});

  /// Return a json-encoded string of the request body for a graphql request, given the filename.
  Future<String> gqlRequestBody(
      String gqlFileName, Map<String, dynamic> variables) async {
    final body = {
      "query": await rootBundle.loadString('$rootPath/$gqlFileName'),
      "variables": variables
    };
    return jsonEncode(body);
  }
}
