class User {
  int? id;
  String? name;
  String? email;
  String? gender;
  String? photo;
  String? active;
  String? role;

  User.fromJson(Map json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    active = json['active'];
    photo = json['photo'];
    role = json['role'];
  }


  Map toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "photo": photo,
    "gender": gender,
    "active": active,
    "role": role,
  };
}
