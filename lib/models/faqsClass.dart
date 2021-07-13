// To parse this JSON data, do
//
//     final faQs = faQsFromJson(jsonString);

import 'dart:convert';

List<FaQs> faQsFromJson(String str) => List<FaQs>.from(json.decode(str).map((x) => FaQs.fromJson(x)));

String faQsToJson(List<FaQs> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FaQs {
    FaQs({
        this.question,
        this.answer,
    });

    String question;
    String answer;

    factory FaQs.fromJson(Map<String, dynamic> json) => FaQs(
        question: json["question"],
        answer: json["answer"],
    );

    Map<String, dynamic> toJson() => {
        "question": question,
        "answer": answer,
    };
}
