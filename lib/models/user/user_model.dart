class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? designation;
  String? dateOfBirth;
  String? institute;
  String? degree;
  String? starting;
  String? ending;
  String? role;
  String? campus;
  Department? department;
  String? token;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.avatar,
      this.designation,
      this.dateOfBirth,
      this.institute,
      this.degree,
      this.starting,
      this.ending,
      this.role,
      this.campus,
      this.department,
      this.token});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    avatar = json['avatar'];
    designation = json['designation'];
    dateOfBirth = json['dateOfBirth'];
    institute = json['institute'];
    degree = json['degree'];
    starting = json['starting'];
    ending = json['ending'];
    role = json['role'];
    campus = json['campus'];
    department = json['department'] != null
        ? new Department.fromJson(json['department'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['avatar'] = avatar;
    data['designation'] = designation;
    data['dateOfBirth'] = dateOfBirth;
    data['institute'] = institute;
    data['degree'] = degree;
    data['starting'] = starting;
    data['ending'] = ending;
    data['role'] = role;
    data['campus'] = campus;
    if (department != null) {
      data['department'] = department!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class Department {
  int? id;
  String? name;

  Department({this.id, this.name});

  Department.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
