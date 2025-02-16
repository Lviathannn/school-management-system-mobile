class UserModel {
  final int id;
  final String name;
  final String phone;
  final String address;
  final String url;
  final String createdAt;

  UserModel({
    required this.id,
    required this.phone,
    required this.address,
    required this.url,
    required this.createdAt,
    required this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      phone: json['phone'],
      address: json['address'],
      url: json['url'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
