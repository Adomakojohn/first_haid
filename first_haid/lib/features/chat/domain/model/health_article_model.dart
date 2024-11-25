class HealthArticle {
  final String title;
  final String description;
  final String url;
  final String imageUrl;
  final String content;

  HealthArticle({
    required this.title,
    required this.description,
    required this.content,
    required this.url,
    required this.imageUrl,
  });

  factory HealthArticle.fromJson(Map<String, dynamic> json) {
    return HealthArticle(
      title: json['title'] ?? 'No Title',
      description: json['description'] ?? 'No Description',
      content: json['content'] ?? 'No content found',
      url: json['url'] ?? '',
      imageUrl: json['urlToImage'] ?? '',
    );
  }
}
