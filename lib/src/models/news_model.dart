class NewsModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  NewsModel(
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.content,
  );

  NewsModel.fromJson(Map<String, dynamic> json) {
    author = json["author"];
    title = json["title"];
    description = json["description"];
    url = json["url"];
    urlToImage = json["urlToImage"];
    content = json["content"];
  }
}
