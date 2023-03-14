

class User {
  int id;
  String name;
  String? email;
  String? phone;
  User({required this.id, required this.name, this.email, this.phone});
  factory User.fromJson(Map<String,dynamic> json2) {
    return User(
      id: json2['id'],
      name: json2['name'],
      email: json2['email'] ?? 'pff',
      phone: json2['phone'] ?? '-',
    );
  }
}
