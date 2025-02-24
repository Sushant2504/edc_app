class Comment {
  final String id;
  final String articleId;
  final String userId;
  final String content;
  final DateTime createdAt;
  final UserInfo user;

  Comment({
    required this.id,
    required this.articleId,
    required this.userId,
    required this.content,
    required this.createdAt,
    required this.user,
  });
}

class UserInfo {
  final String name;
  final String avatarUrl;

  UserInfo({
    required this.name,
    required this.avatarUrl,
  });
}