import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/api/api_const.dart';
import 'package:news_app/api/api_endpoint.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManager {
  static Future<SourceResponse> getSources({String? categoryId}) async {
    Uri url = Uri.https(ApiConst.baseUrl, EndPoint.sourceApi, {
      'apiKey': ApiConst.apiKey,
      if (categoryId != null) 'category': categoryId,
      'language': 'en',
    });
    try {
      var response = await http.get(url);
      var sourceResponse = SourceResponse.fromJson(jsonDecode(response.body));
      return sourceResponse;
    } catch (e) {
      rethrow;
    }
  }

  static Future<NewsResponse> getSourcesByCategory({
    String? sourceId,
    String? searchQuery,
    int page = 1,
    int pageSize = 10,
  }) async {
    Uri url = Uri.https(ApiConst.baseUrl, EndPoint.newsApi, {
      'apiKey': ApiConst.apiKey,
      'sources': sourceId,
      'q': searchQuery,
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    });
    try {
      var response = await http.get(url);
      String responseBody = response.body;
      var json = jsonDecode(responseBody);
      return NewsResponse.fromJson(json);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<Articles>?> searchArticles({
    String? searchQuery,
    int page = 1,
    int pageSize = 10,
  }) async {
    Uri url = Uri.https(ApiConst.baseUrl, EndPoint.newsApi, {
      'apiKey': ApiConst.apiKey,
      'q': searchQuery,
      'page': page.toString(),
      'pageSize': pageSize.toString(),
    });
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final newsResponse = NewsResponse.fromJson(json);
        return newsResponse.articles;
      } else {
        debugPrint('Error: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Error in searchArticles: $e');
      return null;
    }
  }
}
