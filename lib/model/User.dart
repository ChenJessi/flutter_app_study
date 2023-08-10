

class User{

  User({this.id, this.login, this.avatar_url, this.name});

  int? id;
  String? login;
  String? avatar_url;
  String? name;

  User.empty();
}