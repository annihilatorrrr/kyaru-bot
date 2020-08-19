import 'github_author.dart';

class GithubCommit {
  String sha;
  GithubAuthor author;
  String message;
  bool distinct;
  String url;

  GithubCommit(this.sha, this.author, this.message, this.distinct, this.url);

  factory GithubCommit.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;
    return GithubCommit(
      json['sha'],
      GithubAuthor.fromJson(json['author']),
      json['message'],
      json['distinct'],
      json['url'],
    );
  }

  static List<GithubCommit> listFromJsonArray(List<dynamic> jsonArray) {
    if (jsonArray == null) return null;
    return List.generate(jsonArray.length, (i) => GithubCommit.fromJson(jsonArray[i]));
  }
}
