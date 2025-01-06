class Users {
  String? id;
  String? name;
  String? address;
  String? phone;
  String? email;
  String? gender;
  String? password;
  String? userType;
  String? image;
  String? createdAt;
  String? token;

  Users(
      {this.id,
      this.name,
      this.address,
      this.phone,
      this.email,
      this.gender,
      this.password,
      this.userType,
      this.image,
      this.createdAt,
      this.token});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    phone = json['phone'];
    email = json['email'];
    gender = json['gender'];
    password = json['password'];
    userType = json['user_type'];
    image = json['image'];
    createdAt = json['created_at'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['phone'] = phone;
    data['email'] = email;
    data['gender'] = gender;
    data['password'] = password;
    data['user_type'] = userType;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['token'] = token;
    return data;
  }
}
