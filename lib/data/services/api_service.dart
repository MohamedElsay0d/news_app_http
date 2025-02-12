import "dart:convert";

import "package:http/http.dart" as http;

import "../model/soureces_response/soureces_response.dart";
import "api_constants.dart";

class APIService {
  Future<SourecesResponse> getSources(String categoryId) async {
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

  Future getNews(String soureceId) async {
    Uri uri = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.newsEndpoint,
      {
        "apiKey": ApiConstants.apiKey,
        "sources": soureceId,
      },
    );
    http.Response response = await http.get(uri);
    Map<String, dynamic> json = jsonDecode(response.body);
    return json;
  }
}
