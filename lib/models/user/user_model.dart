class UserModel {
  int? id;
  String? name;
  String? email;
  String? campus;
  String? department;
  String? role;
  String? avatar;
  String? phone;
  String? designation;
  String? degree;
  String? starting;
  String? ending;
  String? dateOfBirth;
  String? institute;
  String? token;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.campus,
      this.department,
      this.role,
      this.avatar,
      this.phone,
      this.designation,
      this.degree,
      this.starting,
      this.ending,
      this.dateOfBirth,
      this.institute,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    campus = json['campus'];
    department = json['department'];
    role = json['role'];
    avatar = json['avatar'];
    phone = json['phone'];
    designation = json['designation'];
    degree = json['degree'];
    starting = json['starting'];
    ending = json['ending'];
    dateOfBirth = json['dateOfBirth'];
    institute = json['institute'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['campus'] = campus;
    data['department'] = department;
    data['role'] = role;
    data['avatar'] = avatar;
    data['phone'] = phone;
    data['designation'] = designation;
    data['degree'] = degree;
    data['starting'] = starting;
    data['ending'] = ending;
    data['dateOfBirth'] = dateOfBirth;
    data['institute'] = institute;
    data['token'] = token;
    return data;
  }
}
