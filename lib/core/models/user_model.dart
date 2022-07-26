class UserModel {
  String username;
  String password;

  UserModel({required this.username, required this.password});

  factory UserModel.fromJson(Map<String, dynamic> data, String username) {
    return UserModel(
      username: username,
      password: data["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "password": password,
    };
  }
}
