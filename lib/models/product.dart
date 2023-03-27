import 'dart:convert';

class Product {
  Product({
    required this.id,
    required this.name,
    required this.permalink,
    required this.type,
    required this.status,
    required this.catalogVisibility,
    required this.description,
    required this.shortDescription,
    required this.sku,
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.onSale,
    required this.purchasable,
    required this.manageStock,
    required this.stockQuantity,
    required this.averageRating,
    required this.ratingCount,
    required this.categories,
    required this.tags,
    required this.images,
    required this.stockStatus,
  });

  int id;
  String name;
  String permalink;
  String type;
  String status;
  String catalogVisibility;
  String description;
  String shortDescription;
  String sku;
  String price;
  String regularPrice;
  String salePrice;
  bool onSale;
  bool purchasable;
  bool manageStock;
  int stockQuantity;
  String averageRating;
  int ratingCount;
  List<Category> categories;
  List<dynamic> tags;
  List<Image> images;
  String stockStatus;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        permalink: json["permalink"],
        type: json["type"],
        status: json["status"],
        catalogVisibility: json["catalog_visibility"],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromMap(x))),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        images: List<Image>.from(json["images"].map((x) => Image.fromMap(x))),
        stockStatus: json["stock_status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "permalink": permalink,
        "type": type,
        "status": status,
        "catalog_visibility": catalogVisibility,
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "on_sale": onSale,
        "purchasable": purchasable,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "categories": List<dynamic>.from(categories.map((x) => x.toMap())),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "images": List<dynamic>.from(images.map((x) => x.toMap())),
        "stock_status": stockStatus,
      };
}

class Category {
  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  int id;
  String name;
  String slug;

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Image {
  Image({
    required this.id,
    required this.src,
    required this.name,
  });

  int id;
  String src;
  String name;

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        id: json["id"],
        src: json["src"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "src": src,
        "name": name,
      };
}
