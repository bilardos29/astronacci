class UserModel {
  UserModel({
    this.id,
    required this.email,
    required this.fullname,
    required this.phone,
    required this.password,
    required this.profilePicture,
  });

  String? id;
  String? email;
  String? fullname;
  String? phone;
  String? password;
  String? profilePicture;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullname = json['fullname'];
    phone = json['phone'];
    password = json['password'];
    profilePicture = json['profilePicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['password'] = password;
    data['profilePicture'] = profilePicture;
    return data;
  }
}