class User {
  String? pwd;
  String? email;

  User({
    this.pwd,
    this.email,
  });

  User.fromMap(dynamic obj) {
    email = obj['email'];
    pwd = obj['pwd'];
  }

  String get _email => email!;
  String get _pwd => pwd!;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map['email'] = _email;
    map['pwd'] = _pwd;
    return map;
  }
}
