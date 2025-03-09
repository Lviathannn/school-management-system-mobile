class UserModel {
  final int id;
  final String name;
  final String phone;
  final String address;
  final String url;
  final String createdAt;
  final String role;

  UserModel({
    required this.id,
    required this.phone,
    required this.address,
    required this.url,
    required this.createdAt,
    required this.name,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phone: json['phone'],
      address: json['address'],
      url: json['url'],
      name: json['name'],
      role: json['role'],
      createdAt: json['created_at'],
    );
  }
}
