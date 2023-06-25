class User {
  String id;
  String name;
  String profilePic;
  bool? invited;

  User({
    required this.id,
    required this.name,
    this.profilePic = '',
    this.invited = false,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'] as String,
      name: json['name'] as String,
      profilePic: json['profile_pic'] as String? ?? '',
    );
  }
}
