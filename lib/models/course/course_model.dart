class CourseModel {
  int? id;
  String? courseCode;
  String? name;
  String? campus;
  bool? isElective;
  bool? isDepthElective;
  int? credits;
  List<Slots>? slots;

  CourseModel(
      {this.id,
      this.courseCode,
      this.name,
      this.campus,
      this.isElective,
      this.isDepthElective,
      this.credits,
      this.slots});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseCode = json['courseCode'];
    name = json['name'];
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
    data['courseCode'] = courseCode;
    data['name'] = name;
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
  int? id;
  String? sectionCode;
  String? time;
  String? location;
  String? day;
  int? courseId;
  int? facultyId;
  int? facultyobsId;
  int? observerObsId;
  Faculty? faculty;

  Slots(
      {this.id,
      this.sectionCode,
      this.time,
      this.location,
      this.day,
      this.courseId,
      this.facultyId,
      this.facultyobsId,
      this.observerObsId,
      this.faculty});

  Slots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionCode = json['sectionCode'];
    time = json['time'];
    location = json['location'];
    day = json['day'];
    courseId = json['courseId'];
    facultyId = json['facultyId'];
    facultyobsId = json['facultyobsId'];
    observerObsId = json['observerObsId'];
    faculty =
        json['faculty'] != null ? Faculty.fromJson(json['faculty']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sectionCode'] = sectionCode;
    data['time'] = time;
    data['location'] = location;
    data['day'] = day;
    data['courseId'] = courseId;
    data['facultyId'] = facultyId;
    data['facultyobsId'] = facultyobsId;
    data['observerObsId'] = observerObsId;
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
