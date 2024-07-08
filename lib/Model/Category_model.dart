// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    List<Categories> categories;
    bool status;

    CategoryModel({
        required this.categories,
        required this.status,
    });

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: List<Categories>.from(json["categories"].map((x) => Categories.fromJson(x))),
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "status": status,
    };
}

class Categories {
    int id;
    String title;
    String image;

    Categories({
        required this.id,
        required this.title,
        required this.image,
    });

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json["id"],
        title: json["title"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
    };
}
