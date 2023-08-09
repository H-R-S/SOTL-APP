class DetailObservationModel {
  int? id;
  String? starting;
  String? ending;
  String? observationStatus;
  num? observationProgress;
  String? semester;
  num? observationScore;
  int? facultyId;
  int? hodId;
  int? observerId;
  int? courseId;
  String? createdAt;
  Faculty? faculty;
  Observer? observer;
  Observer? hod;
  ObsRequest? obsRequest;
  Course? course;
  Meetings? meetings;

  DetailObservationModel(
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
      this.obsRequest,
      this.course,
      this.meetings});

  DetailObservationModel.fromJson(Map<String, dynamic> json) {
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
    observer =
        json['observer'] != null ? Observer.fromJson(json['observer']) : null;
    hod = json['hod'] != null ? Observer.fromJson(json['hod']) : null;
    obsRequest = json['obsRequest'] != null
        ? ObsRequest.fromJson(json['obsRequest'])
        : null;
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
    meetings =
        json['meetings'] != null ? Meetings.fromJson(json['meetings']) : null;
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
    if (obsRequest != null) {
      data['obsRequest'] = obsRequest!.toJson();
    }
    if (course != null) {
      data['course'] = course!.toJson();
    }
    if (meetings != null) {
      data['meetings'] = meetings!.toJson();
    }
    return data;
  }
}

class Faculty {
  String? name;
  String? email;
  List<CourseSlots>? courseSlots;

  Faculty({this.name, this.email, this.courseSlots});

  Faculty.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    if (json['courseSlots'] != null) {
      courseSlots = <CourseSlots>[];
      json['courseSlots'].forEach((v) {
        courseSlots!.add(CourseSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    if (courseSlots != null) {
      data['courseSlots'] = courseSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CourseSlots {
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

  CourseSlots(
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

  CourseSlots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sectionCode = json['sectionCode'];
    time = json['time'];
    location = json['location'];
    day = json['day'];
    courseId = json['courseId'];
    facultyId = json['facultyId'];
    facultyobsId = json['facultyobsId'];
    observerObsId = json['observerObsId'];
    course = json['course'] != null ? Course.fromJson(json['course']) : null;
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

class Observer {
  String? name;
  String? email;

  Observer({this.name, this.email});

  Observer.fromJson(Map<String, dynamic> json) {
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
  List<TimeSlotByObserver>? timeSlotByObserver;
  List<TimeSlotByFaculty>? timeSlotsByFaculty;
  List<TeachingPlan>? teachingPlan;
  List<dynamic>? reasons;

  ObsRequest(
      {this.id,
      this.scheduledOn,
      this.status,
      this.observationsId,
      this.facultyAccepted,
      this.observerAccepted,
      this.timeSlotByObserver,
      this.timeSlotsByFaculty,
      this.teachingPlan,
      this.reasons});

  ObsRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    scheduledOn = json['scheduledOn'];
    status = json['status'];
    observationsId = json['observationsId'];
    facultyAccepted = json['facultyAccepted'];
    observerAccepted = json['observerAccepted'];
    if (json['timeSlotByObserver'] != null) {
      timeSlotByObserver = <TimeSlotByObserver>[];
      json['timeSlotByObserver'].forEach((v) {
        timeSlotByObserver!.add(TimeSlotByObserver.fromJson(v));
      });
    }
    if (json['timeSlotsByFaculty'] != null) {
      timeSlotsByFaculty = <TimeSlotByFaculty>[];
      json['timeSlotsByFaculty'].forEach((v) {
        timeSlotsByFaculty!.add(TimeSlotByFaculty.fromJson(v));
      });
    }
    if (json['teachingPlan'] != null) {
      teachingPlan = <TeachingPlan>[];
      json['teachingPlan'].forEach((v) {
        teachingPlan!.add(TeachingPlan.fromJson(v));
      });
    }
    if (json['reasons'] != null) {
      reasons = <dynamic>[];
      json['reasons'].forEach((v) {
        reasons!.add((v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['scheduledOn'] = scheduledOn;
    data['status'] = status;
    data['observationsId'] = observationsId;
    data['facultyAccepted'] = facultyAccepted;
    data['observerAccepted'] = observerAccepted;
    if (timeSlotByObserver != null) {
      data['timeSlotByObserver'] =
          timeSlotByObserver!.map((v) => v.toJson()).toList();
    }
    if (timeSlotsByFaculty != null) {
      data['timeSlotsByFaculty'] =
          timeSlotsByFaculty!.map((v) => v.toJson()).toList();
    }
    if (teachingPlan != null) {
      data['teachingPlan'] = teachingPlan!.map((v) => v.toJson()).toList();
    }
    if (reasons != null) {
      data['reasons'] = reasons!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeSlotByObserver {
  int? id;
  String? time;
  String? location;
  String? day;
  int? courseId;

  TimeSlotByObserver(
      {this.id, this.time, this.location, this.day, this.courseId});

  TimeSlotByObserver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    location = json['location'];
    day = json['day'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['time'] = time;
    data['location'] = location;
    data['day'] = day;
    data['courseId'] = courseId;
    return data;
  }
}

class TimeSlotByFaculty {
  int? id;
  String? time;
  String? location;
  String? day;
  int? courseId;

  TimeSlotByFaculty(
      {this.id, this.time, this.location, this.day, this.courseId});

  TimeSlotByFaculty.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['time'];
    location = json['location'];
    day = json['day'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['time'] = time;
    data['location'] = location;
    data['day'] = day;
    data['courseId'] = courseId;
    return data;
  }
}

class TeachingPlan {
  List<Steps>? steps;
  Observer? assignedTo;
  Observer? editedBy;

  TeachingPlan({this.steps, this.assignedTo, this.editedBy});

  TeachingPlan.fromJson(Map<String, dynamic> json) {
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
    assignedTo = json['assignedTo'] != null
        ? Observer.fromJson(json['assignedTo'])
        : null;
    editedBy =
        json['editedBy'] != null ? Observer.fromJson(json['editedBy']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (steps != null) {
      data['steps'] = steps!.map((v) => v.toJson()).toList();
    }
    if (assignedTo != null) {
      data['assignedTo'] = assignedTo!.toJson();
    }
    if (editedBy != null) {
      data['editedBy'] = editedBy!.toJson();
    }
    return data;
  }
}

class Steps {
  int? id;
  String? field;
  String? name;
  String? code;
  String? response;
  int? templatePlanId;

  Steps(
      {this.id,
      this.field,
      this.name,
      this.code,
      this.response,
      this.templatePlanId});

  Steps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    field = json['field'];
    name = json['name'];
    code = json['code'];
    response = json['response'];
    templatePlanId = json['templatePlanId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['field'] = field;
    data['name'] = name;
    data['code'] = code;
    data['response'] = response;
    data['templatePlanId'] = templatePlanId;
    return data;
  }
}

class Meetings {
  int? id;
  int? observationsId;
  InformedObservation? informedObservation;
  PostObservation? postObservation;
  dynamic uninformedObservation;
  dynamic professionalDPlan;

  Meetings(
      {this.id,
      this.observationsId,
      this.informedObservation,
      this.postObservation,
      this.uninformedObservation,
      this.professionalDPlan});

  Meetings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    observationsId = json['observationsId'];
    informedObservation = json['informedObservation'] != null
        ? InformedObservation.fromJson(json['informedObservation'])
        : null;
    postObservation = json['postObservation'] != null
        ? PostObservation.fromJson(json['postObservation'])
        : null;
    uninformedObservation = json['uninformedObservation'];
    professionalDPlan = json['professionalDPlan'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['observationsId'] = observationsId;
    if (informedObservation != null) {
      data['informedObservation'] = informedObservation!.toJson();
    }
    if (postObservation != null) {
      data['postObservation'] = postObservation!.toJson();
    }
    data['uninformedObservation'] = uninformedObservation;
    data['professionalDPlan'] = professionalDPlan;
    return data;
  }
}

class InformedObservation {
  int? id;
  num? observerScore;
  num? facultyScore;
  String? status;
  int? meetingId;
  List<Rubrics>? rubrics;

  InformedObservation(
      {this.id,
      this.observerScore,
      this.facultyScore,
      this.status,
      this.meetingId,
      this.rubrics});

  InformedObservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    observerScore = json['observerScore'];
    facultyScore = json['facultyScore'];
    status = json['status'];
    meetingId = json['meetingId'];
    if (json['rubrics'] != null) {
      rubrics = <Rubrics>[];
      json['rubrics'].forEach((v) {
        rubrics!.add(Rubrics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['observerScore'] = observerScore;
    data['facultyScore'] = facultyScore;
    data['status'] = status;
    data['meetingId'] = meetingId;
    if (rubrics != null) {
      data['rubrics'] = rubrics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rubrics {
  int? id;
  String? title;
  String? code;
  num? observerScore;
  num? facultyScore;
  int? informedId;

  Rubrics(
      {this.id,
      this.title,
      this.code,
      this.observerScore,
      this.facultyScore,
      this.informedId});

  Rubrics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    code = json['code'];
    observerScore = json['observerScore'];
    facultyScore = json['facultyScore'];
    informedId = json['informedId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['code'] = code;
    data['observerScore'] = observerScore;
    data['facultyScore'] = facultyScore;
    data['informedId'] = informedId;
    return data;
  }
}

class PostObservation {
  int? id;
  String? status;
  bool? facultyAccepted;
  bool? observerAccepted;
  String? timeSlotByFaculty;
  String? location;
  dynamic scheduledOn;
  int? meetingId;
  List<TimeSlotsByObserver>? timeSlotsByObserver;
  List<ReflectionPlan>? reflectionPlan;

  PostObservation(
      {this.id,
      this.status,
      this.facultyAccepted,
      this.observerAccepted,
      this.timeSlotByFaculty,
      this.location,
      this.scheduledOn,
      this.meetingId,
      this.timeSlotsByObserver,
      this.reflectionPlan});

  PostObservation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    facultyAccepted = json['facultyAccepted'];
    observerAccepted = json['observerAccepted'];
    timeSlotByFaculty = json['timeSlotByFaculty'];
    location = json['location'];
    scheduledOn = json['scheduledOn'];
    meetingId = json['meetingId'];
    if (json['timeSlotsByObserver'] != null) {
      timeSlotsByObserver = <TimeSlotsByObserver>[];
      json['timeSlotsByObserver'].forEach((v) {
        timeSlotsByObserver!.add(TimeSlotsByObserver.fromJson(v));
      });
    }
    if (json['reflectionPlan'] != null) {
      reflectionPlan = <ReflectionPlan>[];
      json['reflectionPlan'].forEach((v) {
        reflectionPlan!.add(ReflectionPlan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['facultyAccepted'] = facultyAccepted;
    data['observerAccepted'] = observerAccepted;
    data['timeSlotByFaculty'] = timeSlotByFaculty;
    data['location'] = location;
    data['scheduledOn'] = scheduledOn;
    data['meetingId'] = meetingId;
    if (timeSlotsByObserver != null) {
      data['timeSlotsByObserver'] =
          timeSlotsByObserver!.map((v) => v.toJson()).toList();
    }
    if (reflectionPlan != null) {
      data['reflectionPlan'] = reflectionPlan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TimeSlotsByObserver {
  int? id;
  String? dateTime;
  int? observerDateId;

  TimeSlotsByObserver({this.id, this.dateTime, this.observerDateId});

  TimeSlotsByObserver.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateTime = json['dateTime'];
    observerDateId = json['observerDateId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dateTime'] = dateTime;
    data['observerDateId'] = observerDateId;
    return data;
  }
}

class ReflectionPlan {
  int? id;
  String? type;
  int? assignedId;
  int? editedById;
  int? obsSchedulingId;
  int? postObsReflectionId;
  List<Steps>? steps;

  ReflectionPlan(
      {this.id,
      this.type,
      this.assignedId,
      this.editedById,
      this.obsSchedulingId,
      this.postObsReflectionId,
      this.steps});

  ReflectionPlan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    assignedId = json['assignedId'];
    editedById = json['editedById'];
    obsSchedulingId = json['obsSchedulingId'];
    postObsReflectionId = json['postObsReflectionId'];
    if (json['steps'] != null) {
      steps = <Steps>[];
      json['steps'].forEach((v) {
        steps!.add(Steps.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['assignedId'] = assignedId;
    data['editedById'] = editedById;
    data['obsSchedulingId'] = obsSchedulingId;
    data['postObsReflectionId'] = postObsReflectionId;
    if (steps != null) {
      data['steps'] = steps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Steps {
//   int? id;
//   String? field;
//   String? name;
//   String? code;
//   String? response;
//   int? templatePlanId;

//   Steps(
//       {this.id,
//       this.field,
//       this.name,
//       this.code,
//       this.response,
//       this.templatePlanId});

//   Steps.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     field = json['field'];
//     name = json['name'];
//     code = json['code'];
//     response = json['response'];
//     templatePlanId = json['templatePlanId'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['field'] = field;
//     data['name'] = name;
//     data['code'] = code;
//     data['response'] = response;
//     data['templatePlanId'] = templatePlanId;
//     return data;
//   }
// }
