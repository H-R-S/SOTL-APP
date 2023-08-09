class ScheduleObservationModel {
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

  ScheduleObservationModel(
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

  ScheduleObservationModel.fromJson(Map<String, dynamic> json) {
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
