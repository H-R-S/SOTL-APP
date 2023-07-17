class ObservationModel {
  int? id;
  String? starting;
  String? ending;
  String? observationStatus;
  int? observationProgress;
  String? semester;
  int? observationScore;
  int? facultyId;
  int? hodId;
  int? observerId;
  int? courseId;
  String? createdAt;
  Faculty? faculty;
  Faculty? observer;
  Faculty? hod;
  dynamic course;

  ObservationModel(
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
      this.createdAt,
      this.faculty,
      this.observer,
      this.hod,
      this.course});

  ObservationModel.fromJson(Map<String, dynamic> json) {
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
    faculty =
        json['faculty'] != null ? Faculty.fromJson(json['faculty']) : null;
    observer = json['observer'] != null
        ? Faculty.fromJson(json['observer'])
        : null;
    hod = json['hod'] != null ? Faculty.fromJson(json['hod']) : null;
    course = json['course'];
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
    if (faculty != null) {
      data['faculty'] = faculty!.toJson();
    }
    if (observer != null) {
      data['observer'] = observer!.toJson();
    }
    if (hod != null) {
      data['hod'] = hod!.toJson();
    }
    data['course'] = course;
    return data;
  }
}

class Faculty {
  int? id;
  String? name;
  String? email;

  Faculty({this.id, this.name, this.email});

  Faculty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
