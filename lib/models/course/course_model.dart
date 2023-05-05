class CourseModel {
  int? id;
  String? name;
  String? department;
  String? campus;
  bool? elective;
  bool? depthElective;
  List<Slots>? slots;

  CourseModel(
      {this.id,
      this.name,
      this.department,
      this.campus,
      this.elective,
      this.depthElective,
      this.slots});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    department = json['department'];
    campus = json['campus'];
    elective = json['elective'];
    depthElective = json['depthElective'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(Slots.fromJson(v));
      });
    }
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['department'] = department;
    data['campus'] = campus;
    data['elective'] = elective;
    data['depthElective'] = depthElective;
    if (slots != null) {
      data['slots'] = slots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Slots {
  int? id;
  String? time;
  String? location;
  String? day;
  int? coursesId;
  dynamic facultyId;
  dynamic faculty;

  Slots(
      {this.id,
      this.time,
      this.location,
      this.day,
      this.coursesId,
      this.facultyId,
      this.faculty});

  Slots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    location = json['location'];
    day = json['day'];
    coursesId = json['coursesId'];
    facultyId = json['facultyId'];
    faculty = json['faculty'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['time'] = time;
    data['location'] = location;
    data['day'] = day;
    data['coursesId'] = coursesId;
    data['facultyId'] = facultyId;
    data['faculty'] = faculty;
    return data;
  }
}
