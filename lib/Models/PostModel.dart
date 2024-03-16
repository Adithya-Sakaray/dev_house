class Post {
  final String id;
  final String postId;
  final String userId;
  final String content;
  final int likes;
  final String type;
  final String imageUrl;
  final String? postType; // Additional field for some posts
  final DateTime createdAt;

  Post({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    required this.likes,
    required this.type,
    required this.imageUrl,
    required this.postType,
    required this.createdAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id'],
      postId: json['postId'],
      userId: json['userId'],
      content: json['content'],
      likes: json['likes'],
      type: json['type'],
      imageUrl: json['imageUrl'],
      postType: json['postType'], // Additional field for some posts
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
