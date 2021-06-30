// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

List<Posts> postsFromJson(String str) => List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
    Posts({
        this.postTitle,
        this.postBody,
        this.featuredImage,
        this.status,
        this.updatedAt,
    });

    String postTitle;
    String postBody;
    String featuredImage;
    bool status;
    DateTime updatedAt;

    factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        postTitle: json["post_title"],
        postBody: json["post_body"],
        featuredImage: json["featured_image"],
        status: json["status"],
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "post_title": postTitle,
        "post_body": postBody,
        "featured_image": featuredImage,
        "status": status,
        "updated_at": updatedAt.toIso8601String(),
    };
}
