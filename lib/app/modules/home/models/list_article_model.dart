// To parse this JSON data, do
//
//     final listArticleModel = listArticleModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ListArticleModel> listArticleModelFromJson(String str) => List<ListArticleModel>.from(json.decode(str).map((x) => ListArticleModel.fromJson(x)));

String listArticleModelToJson(List<ListArticleModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListArticleModel {
    ListArticleModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    int userId;
    int id;
    String title;
    String body;

    factory ListArticleModel.fromJson(Map<String, dynamic> json) => ListArticleModel(
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
