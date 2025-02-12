import 'source.dart';

class SourecesResponse {
  String? status;
  List<Source>? sources;

  SourecesResponse({this.status, this.sources});

  factory SourecesResponse.fromJson(Map<String, dynamic> json) {
    return SourecesResponse(
      status: json['status'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

}
