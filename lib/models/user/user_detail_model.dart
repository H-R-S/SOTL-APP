class UserDetailModel {
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
  List<Observations>? observations;
  List<Slots>? slots;

  UserDetailModel(
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
      this.observations,
      this.slots});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
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
        ? Department.fromJson(json['department'])
        : null;
    if (json['observations'] != null) {
      observations = <Observations>[];
      json['observations'].forEach((v) {
        observations!.add(Observations.fromJson(v));
      });
    }
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
    if (observations != null) {
      data['observations'] = observations!.map((v) => v.toJson()).toList();
    }
    if (slots != null) {
      data['slots'] = slots!.map((v) => v.toJson()).toList();
    }
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

class Observations {
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
  Course? course;
  Faculty? faculty;
  Faculty? observer;
  Faculty? hod;
  ObsRequest? obsRequest;
  dynamic meetings;

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
      this.createdAt,
      this.course,
      this.faculty,
      this.observer,
      this.hod,
      this.obsRequest,
      this.meetings});

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
    course =
        json['course'] != null ? Course.fromJson(json['course']) : null;
    faculty =
        json['faculty'] != null ? Faculty.fromJson(json['faculty']) : null;
    observer = json['observer'] != null
        ? Faculty.fromJson(json['observer'])
        : null;
    hod = json['hod'] != null ? Faculty.fromJson(json['hod']) : null;
    obsRequest = json['obsRequest'] != null
        ? ObsRequest.fromJson(json['obsRequest'])
        : null;
    meetings = json['meetings'];
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
    if (course != null) {
      data['course'] = course!.toJson();
    }
    if (faculty != null) {
      data['faculty'] = faculty!.toJson();
    }
    if (observer != null) {
      data['observer'] = observer!.toJson();
    }
    if (hod != null) {
      data['hod'] = hod!.toJson();
    }
    if (obsRequest != null) {
      data['obsRequest'] = obsRequest!.toJson();
    }
    data['meetings'] = meetings;
    return data;
  }
}

class Course {
  int? id;
  String? courseCode;
  String? name;
  String? campus;
  bool? isElective;
  bool? isDepthElective;
  int? credits;

  Course(
      {this.id,
      this.courseCode,
      this.name,
      this.campus,
      this.isElective,
      this.isDepthElective,
      this.credits});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseCode = json['courseCode'];
    name = json['name'];
    campus = json['campus'];
    isElective = json['isElective'];
    isDepthElective = json['isDepthElective'];
    credits = json['credits'];
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

class ObsRequest {
  int? id;
  String? scheduledOn;
  String? status;
  int? observationsId;
  bool? facultyAccepted;
  bool? observerAccepted;

  ObsRequest(
      {this.id,
      this.scheduledOn,
      this.status,
      this.observationsId,
      this.facultyAccepted,
      this.observerAccepted});

  ObsRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduledOn = json['scheduledOn'];
    status = json['status'];
    observationsId = json['observationsId'];
    facultyAccepted = json['facultyAccepted'];
    observerAccepted = json['observerAccepted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['scheduledOn'] = scheduledOn;
    data['status'] = status;
    data['observationsId'] = observationsId;
    data['facultyAccepted'] = facultyAccepted;
    data['observerAccepted'] = observerAccepted;
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
  Course? course;

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
      this.course});

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
    course =
        json['course'] != null ? Course.fromJson(json['course']) : null;
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
    if (course != null) {
      data['course'] = course!.toJson();
    }
    return data;
  }
}
