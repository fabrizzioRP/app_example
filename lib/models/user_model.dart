class UserModel {
  final int id;
  final String name;
  final String email;
  final String urlImg;
  bool? isFollowers;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.urlImg,
    this.isFollowers = false,
  });
}
