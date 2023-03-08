// To parse this JSON data, do
//
//     final detailArticleModel = detailArticleModelFromJson(jsonString);

import 'dart:convert';

DetailArticleModel detailArticleModelFromJson(String str) => DetailArticleModel.fromJson(json.decode(str));

String detailArticleModelToJson(DetailArticleModel data) => json.encode(data.toJson());

class DetailArticleModel {
    DetailArticleModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    int? userId;
    int? id;
    String? title;
    String? body;

    factory DetailArticleModel.fromJson(Map<String, dynamic> json) => DetailArticleModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
