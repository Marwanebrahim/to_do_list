class User {
  final String email;
  final String fullName;
  final String password;

  User({required this.email, required this.fullName, required this.password});

  Map<String, dynamic> toMap() {
    return {"email": email, "name": fullName, "password": password};
  }
   factory User.fromMap(Map<dynamic, dynamic> map) {
    return User(
      email: map['email'] ,
      fullName: map['name'] ,
      password: map['password'] ,
    );
  }
}
