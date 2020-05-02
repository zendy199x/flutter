//https://github.com/gothinkster/realworld/tree/master/api

class User {
  final String email;
  final String token;
  final String username;
  final String bio;
  final String image;

  User({this.email, this.token, this.username, this.bio, this.image});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'] as String,
      token: json['token'] as String,
      username: json['token'] as String,
      bio: json['bio'] as String,
      image: (json['image']?.isEmpty ?? true)
          ? "https://static.productionready.io/images/smiley-cyrus.jpg"
          : json['image'] as String,
    );
  }
}
