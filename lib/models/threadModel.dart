class Author {
  final String id;
  final String name;

  Author({
    required this.id,
    required this.name,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
}

class Thread {
  final String id;
  final String title;
  final String content;
  final Author? author;
  final String createdAt;
  final int totalViews;
  final int totalPostComments;

  Thread({
    required this.id,
    required this.title,
    required this.content,
    required this.author,
    required this.createdAt,
    required this.totalViews,
    required this.totalPostComments,
  });

  factory Thread.fromJson(Map<String, dynamic> json) {
    return Thread(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
      author: json['author'] != null ? Author.fromJson(json['author']) : null,
      createdAt: json['createdAt'] ?? '',
      totalViews: json['totalViews'] ?? 0,
      totalPostComments: json['totalPostComments'] ?? 0,
    );
  }
}
