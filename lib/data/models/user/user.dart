class User {
  User({
    this.avatarUrl,
    required this.id,
    required this.login,
    this.name,
    this.surname,
  });
  String id;
  String? name;
  String? surname;
  String login;
  String? avatarUrl;
}
