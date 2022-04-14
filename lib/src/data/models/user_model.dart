class UserModel {
  int? id;
  String name;
  int age;
  String email;

  UserModel({
    this.id,
    required this.name,
    required this.age,
    required this.email,
  });

  UserModel.fromMap(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        age = json["age"],
        email = json["email"];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
    };
  }
}
