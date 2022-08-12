// To parse this JSON data, do
//
//     final productListModel = productListModelFromJson(jsonString);

import 'dart:convert';

ProductListModel productListModelFromJson(String str) =>
    ProductListModel.fromJson(json.decode(str));

String productListModelToJson(ProductListModel data) =>
    json.encode(data.toJson());

class ProductListModel {
  ProductListModel({
    this.productImage,
    this.name,
    this.description,
    this.originalPrice,
    this.discountPrice,
    this.discountPercentage,
    this.offerPrice,
  });

  String? productImage;
  String? name;
  String? description;
  String? originalPrice;
  String? discountPrice;
  String? discountPercentage;
  String? offerPrice;

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        productImage: json["productImage"],
        name: json["name"],
        description: json["description"],
        originalPrice: json["originalPrice"],
        discountPrice: json["discountPrice"],
        discountPercentage: json["discountPercentage"],
        offerPrice: json["offerPrice"],
      );

  Map<String, dynamic> toJson() => {
        "productImage": productImage,
        "name": name,
        "description": description,
        "originalPrice": originalPrice,
        "discountPrice": discountPrice,
        "discountPercentage": discountPercentage,
        "offerPrice": offerPrice,
      };
}
