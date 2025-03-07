import "dart:convert";

import "package:http/http.dart" as http;

import "../model/news_response/news_response.dart";
import "../model/soureces_response/soureces_response.dart";
import "api_constants.dart";

class APIService {
  static Future<SourecesResponse> getSources(String categoryId) async {
    Uri uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sourceEndpoint,
      {
        "apiKey": ApiConstants.apiKey,
        "category": categoryId,
      },
    );
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return SourecesResponse.fromJson(json);
  }

  static Future<NewsResponse> getNews(String soureceId,
      {String pageNumber = '1'}) async {
    Uri uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.newsEndpoint,
      {
        "apiKey": ApiConstants.apiKey,
        "sources": soureceId,
        "pageSize": '3',
        'page': pageNumber
      },
    );
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }

  static Future<NewsResponse> getNewsByQuery(
    String? query,
  ) async {
    Uri uri;
    uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.everythingEndpoint,
      {
        "apiKey": ApiConstants.apiKey,
        "q": query,
      },
    );
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return NewsResponse.fromJson(json);
  }
}
