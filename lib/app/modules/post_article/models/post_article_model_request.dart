import 'dart:convert';

String postArticleModelRequestToJson(PostArticleModelRequest data) => json.encode(data.toJson());

class PostArticleModelRequest {
    PostArticleModelRequest({
        required this.title,
        required this.body,
        required this.userId,
    });

    String title;
    String body;
    String userId;

    Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "userId": userId,
    };
}
