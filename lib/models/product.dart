// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

ReqProductResponse reqProductResponseFromJson(String str) =>
    ReqProductResponse.fromJson(json.decode(str));

String productToJson(ReqProductResponse data) => json.encode(data.toJson());

class ReqProductResponse {
  ReqProductResponse({
    this.pageNumber,
    this.pageSize,
    this.data,
  });

  int pageNumber;
  int pageSize;
  List<Product> data;

  factory ReqProductResponse.fromJson(Map<String, dynamic> json) =>
      ReqProductResponse(
        pageNumber: json["pageNumber"],
        pageSize: json["pageSize"],
        data: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pageNumber": pageNumber,
        "pageSize": pageSize,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.flgDiscount,
    this.discount,
    this.quantity,
    this.flgAvailable,
    this.subcategoryId,
    this.brandId,
    this.petId,
    this.flgNovedad,
    this.productImage,
  });

  int id;
  String name;
  String slug;
  String description;
  double price;
  bool flgDiscount;
  double discount;
  int quantity;
  bool flgAvailable;
  int subcategoryId;
  int brandId;
  int petId;
  bool flgNovedad;
  List<ProductImage> productImage;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        price: json["price"],
        flgDiscount: json["flgDiscount"],
        discount: json["discount"],
        quantity: json["quantity"],
        flgAvailable: json["flgAvailable"],
        subcategoryId: json["subcategoryId"],
        brandId: json["brandId"],
        petId: json["petId"],
        flgNovedad: json["flgNovedad"],
        productImage: List<ProductImage>.from(
            json["productImage"].map((x) => ProductImage.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "price": price,
        "flgDiscount": flgDiscount,
        "discount": discount,
        "quantity": quantity,
        "flgAvailable": flgAvailable,
        "subcategoryId": subcategoryId,
        "brandId": brandId,
        "petId": petId,
        "flgNovedad": flgNovedad,
        "productImage": List<dynamic>.from(productImage.map((x) => x.toJson())),
      };
}

class ProductImage {
  ProductImage({
    this.id,
    this.url,
    this.description,
    this.productId,
  });

  int id;
  String url;
  String description;
  int productId;

  factory ProductImage.fromJson(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        url: json["url"],
        description: json["description"],
        productId: json["productId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "description": description,
        "productId": productId,
      };
}
