class InitiateModel {
  List<int>? facultyIds;
  int? observerId;
  int? hodId;
  String? semester;

  InitiateModel({this.facultyIds, this.observerId, this.hodId, this.semester});

  InitiateModel.fromJson(Map<String, dynamic> json) {
    facultyIds = json['facultyIds'].cast<int>();
    observerId = json['observerId'];
    hodId = json['hodId'];
    semester = json['semester'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['facultyIds'] = facultyIds;
    data['observerId'] = observerId;
    data['hodId'] = hodId;
    data['semester'] = semester;
    return data;
  }
}
