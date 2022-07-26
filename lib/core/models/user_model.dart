class UserModel {
  String username;
  String password;
  String email;

  UserModel({
    required this.username,
    required this.password,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> data, String username) {
    return UserModel(
      username: username,
      password: data["password"],
      email: data["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "email": email,
      "password": password,
    };
  }
}
