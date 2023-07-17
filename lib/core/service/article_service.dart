import 'dart:convert';

import 'package:media_probe_mobile_app/core/models/article_model.dart';
import 'package:http/http.dart' as http;

class ArticleService {
  Future<List<Articles>> fetchArticles({
    required String apiKey,
    required int period,
  }) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.nytimes.com/svc/mostpopular/v2/viewed/$period.json?api-key=$apiKey'));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return List.from(
              jsonDecode(await response.stream.bytesToString())['results'])
          .map((e) => Articles.fromJson(e))
          .toList();
    } else {
      return [] as Future<List<Articles>>;
    }
  }
}
