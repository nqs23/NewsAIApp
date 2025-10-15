class NewsItem {
  final String title;
  final String description;
  final DateTime date;
  final String? source;
  final String? url;

  NewsItem({
    required this.title,
    required this.description,
    required this.date,
    this.source,
    this.url,
  });

  factory NewsItem.fromJson(Map<String, dynamic> json) {
    return NewsItem(
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] != null
          ? DateTime.parse(json['date'] as String)
          : DateTime.now(),
      source: json['source'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date.toIso8601String(),
      'source': source,
      'url': url,
    };
  }

  @override
  String toString() {
    return 'NewsItem(title: $title, date: $date, source: $source)';
  }
}
