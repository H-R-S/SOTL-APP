class CourseModel {
  String? id;
  String? name;
  String? department;
  String? campus;
  bool? isElective;
  bool? isDepthElective;
  int? credits;
  List<Slots>? slots;

  CourseModel(
      {this.id,
      this.name,
      this.department,
      this.campus,
      this.isElective,
      this.isDepthElective,
      this.credits,
      this.slots});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    department = json['department'];
    campus = json['campus'];
    isElective = json['isElective'];
    isDepthElective = json['isDepthElective'];
    credits = json['credits'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(Slots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['department'] = department;
    data['campus'] = campus;
    data['isElective'] = isElective;
    data['isDepthElective'] = isDepthElective;
    data['credits'] = credits;
    if (slots != null) {
      data['slots'] = slots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slots {
  String? id;
  String? time;
  String? location;
  String? day;
  String? courseId;
  int? facultyId;
  dynamic slotFacultyId;
  dynamic slotObserverId;
  Faculty? faculty;

  Slots(
      {this.id,
      this.time,
      this.location,
      this.day,
      this.courseId,
      this.facultyId,
      this.slotFacultyId,
      this.slotObserverId,
      this.faculty});

  Slots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    location = json['location'];
    day = json['day'];
    courseId = json['courseId'];
    facultyId = json['facultyId'];
    slotFacultyId = json['slotFacultyId'];
    slotObserverId = json['slotObserverId'];
    faculty =
        json['faculty'] != null ? Faculty.fromJson(json['faculty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['time'] = time;
    data['location'] = location;
    data['day'] = day;
    data['courseId'] = courseId;
    data['facultyId'] = facultyId;
    data['slotFacultyId'] = slotFacultyId;
    data['slotObserverId'] = slotObserverId;
    if (faculty != null) {
      data['faculty'] = faculty!.toJson();
    }
    return data;
  }
}

class Faculty {
  String? name;
  String? email;

  Faculty({this.name, this.email});

  Faculty.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
