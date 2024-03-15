class Post {
  String id;
  String postId;
  String userId;
  String content;
  String type;
  DateTime createdAt;
  String imageUrl;

  Post({
    required this.id,
    required this.postId,
    required this.userId,
    required this.content,
    required this.type,
    required this.createdAt,
    required this.imageUrl,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['_id']['\$oid'],
      postId: json['postId'],
      userId: json['userId'],
      content: json['content'],
      type: json['type'],
      createdAt: DateTime.parse(json['createdAt']['\$date']),
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': {'\$oid': id},
      'postId': postId,
      'userId': userId,
      'content': content,
      'type': type,
      'createdAt': {'\$date': createdAt.toIso8601String()},
      'imageUrl': imageUrl,
    };
  }
}
