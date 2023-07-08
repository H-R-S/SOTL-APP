class CourseModel {
  int? id;
  String? courseCode;
  String? name;
  String? department;
  String? campus;
  bool? isElective;
  bool? isDepthElective;
  int? credits;
  List<Slots>? slots;
  List<Observations>? observations;

  CourseModel(
      {this.id,
      this.courseCode,
      this.name,
      this.department,
      this.campus,
      this.isElective,
      this.isDepthElective,
      this.credits,
      this.slots,
      this.observations});

  CourseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseCode = json['courseCode'];
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
    if (json['observations'] != null) {
      observations = <Observations>[];
      json['observations'].forEach((v) {
        observations!.add(Observations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['courseCode'] = courseCode;
    data['name'] = name;
    data['department'] = department;
    data['campus'] = campus;
    data['isElective'] = isElective;
    data['isDepthElective'] = isDepthElective;
    data['credits'] = credits;
    if (slots != null) {
      data['slots'] = slots!.map((v) => v.toJson()).toList();
    }
    if (observations != null) {
      data['observations'] = observations!.map((v) => v.toJson()).toList();
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
  dynamic facultyobsId;
  dynamic observerObsId;
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

class Observations {
  int? id;
  dynamic starting;
  dynamic ending;
  String? observationStatus;
  int? observationProgress;
  String? semester;
  int? observationScore;
  int? facultyId;
  int? hodId;
  int? observerId;
  int? courseId;
  String? createdAt;

  Observations(
      {this.id,
      this.starting,
      this.ending,
      this.observationStatus,
      this.observationProgress,
      this.semester,
      this.observationScore,
      this.facultyId,
      this.hodId,
      this.observerId,
      this.courseId,
      this.createdAt});

  Observations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    starting = json['starting'];
    ending = json['ending'];
    observationStatus = json['observationStatus'];
    observationProgress = json['observationProgress'];
    semester = json['semester'];
    observationScore = json['observationScore'];
    facultyId = json['facultyId'];
    hodId = json['hodId'];
    observerId = json['observerId'];
    courseId = json['courseId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['starting'] = starting;
    data['ending'] = ending;
    data['observationStatus'] = observationStatus;
    data['observationProgress'] = observationProgress;
    data['semester'] = semester;
    data['observationScore'] = observationScore;
    data['facultyId'] = facultyId;
    data['hodId'] = hodId;
    data['observerId'] = observerId;
    data['courseId'] = courseId;
    data['createdAt'] = createdAt;
    return data;
  }
}
