import 'dart:convert';

import 'package:http/http.dart';

import 'post.dart';

class YandereClient {
  final base_url = 'yande.re';

  final _client = Client();

  Future<T> _get<T>(Uri uri, T Function(dynamic) mapper) async {
    var response = await _client.get(uri).timeout(Duration(seconds: 120));
    if (response.statusCode != 200) {
      throw Exception(response.body); // TODO specialize
    }
    return mapper(json.decode(await response.body));
  }

  Future<List<Post>> getPosts({
    List<String> tags,
    int limit = 100,
    bool random = true,
  }) async {
    return await _get(
      Uri.https(
        base_url,
        '/post.json',
        {
          'tags': (tags ?? []).join(' '),
          'limit': '${limit}',
          'random': '${random}',
        },
      ),
      (d) => Post.listFromJsonArray(d),
    );
  }
}
