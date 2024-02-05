class UserModel {
  final int id;
  final String username;
  final String password;
  final String email;

  UserModel({
    required this.id,
    required this.username,
    required this.password,
    required this.email
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      email: json['email'],
    );
  }
}