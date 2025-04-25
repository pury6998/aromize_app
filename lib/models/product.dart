List<GetProduct> productFromJson(List<dynamic> productJson) =>
    List<GetProduct>.from(productJson
        .map((productListJson) => GetProduct.fromJson(productListJson)));

class GetProduct {
  String? id;
  String? name;
  int? price;
  String? description;

  int? quantity;
  String? image;
  String? categoryName;
  String? createdAt;
  int? averageRating;
  int? reviewCount;
  List<Reviews>? reviews;

  GetProduct(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.quantity,
      this.image,
      this.categoryName,
      this.createdAt,
      this.averageRating,
      this.reviewCount,
      this.reviews});

  GetProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    description = json['description'];
    quantity = json['quantity'];
    image = json['image'];
    categoryName = json['category_name'];
    createdAt = json['created_at'];
    averageRating = json['average_rating'];
    reviewCount = json['review_count'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['category_name'] = this.categoryName;
    data['created_at'] = this.createdAt;
    data['average_rating'] = this.averageRating;
    data['review_count'] = this.reviewCount;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  String? id;
  String? userName;
  String? userImage;
  String? comment;
  int? rate;
  String? createdAt;

  Reviews(
      {this.id,
      this.userName,
      this.userImage,
      this.comment,
      this.rate,
      this.createdAt});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    userImage = json['user_image'];
    comment = json['comment'];
    rate = json['rate'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_name'] = this.userName;
    data['user_image'] = this.userImage;
    data['comment'] = this.comment;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    return data;
  }
}
