import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/models/observation/initiate_model.dart';
import 'package:sotl/view/widgets/snack_bar/my_snack_bar.dart';
import 'package:sotl/view_models/user/user_view_model.dart';
import '../../data/responses/api_responses.dart';
import '../../models/observation/observation_model.dart';
import '../../repository/observation/observation_repository.dart';

class ObservationViewModel with ChangeNotifier {
  final _observationRepo = ObservationRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> initiateObservation(
      BuildContext context, String facultyId, observerId, semester) async {
    setLoading(true);

    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    userViewModel.getUser().then((value) {
      final header = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${value.token}'
      };

      _observationRepo
          .initiateObservationApi(
              jsonEncode(InitiateModel(
                facultyIds: [int.parse(facultyId)],
                observerId: int.parse(observerId),
                hodId: int.parse(value.id.toString()),
                semester: semester.toString(),
              ).toJson()),
              header)
          .then((value) {
        setLoading(false);

        if (value.existed!.isNotEmpty) {
          MySnackBar(context, value.existed![0].message!);
        } else {
          MySnackBar(context, "Observation Initiated");
        }
      }).onError((error, stackTrace) {
        setLoading(false);
        debugPrint("err: ${error.toString()}");
        MySnackBar(context, error.toString());
      });
    });
  }

  ApiResponse<List<ObservationModel>> observationsList = ApiResponse.loading();

  setObservationsList(ApiResponse<List<ObservationModel>> response) {
    observationsList = response;

    notifyListeners();
  }

  Future<void> getAllObservations() async {
    setObservationsList(ApiResponse.loading());

    _observationRepo.getAllObservationsApi().then((value) {
      setObservationsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setObservationsList(ApiResponse.error(error.toString()));
    });
  }

  bool _isCourseSelect = false;

  bool get isCourseSelect => _isCourseSelect;

  setCourseSelected(bool value) {
    _isCourseSelect = value;
    debugPrint("Updated: $_isCourseSelect");
    notifyListeners();
  }

  ApiResponse<DetailObservationModel> observationDetail = ApiResponse.loading();

  setObservationDetail(ApiResponse<DetailObservationModel> response) {
    observationDetail = response;
    if (response.status == Status.COMPLETED) {
      if (observationDetail.data!.obsRequest!.status == "Ongoing") {
        setPageController(0);
      }
      if (observationDetail.data!.obsRequest!.status == "Completed") {
        // setCurrentIndex(1);
        setPageController(1);
        debugPrint("CurreNT iNDEX: $_currentIndex");
      }
    }
    notifyListeners();
  }

  Future<void> getAllObservationById(int id) async {
    setObservationDetail(ApiResponse.loading());

    _observationRepo.getObservationByIdApi(id).then((value) {
      setObservationDetail(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setObservationDetail(ApiResponse.error(error.toString()));
    });
  }

  Future<void> startScheduling(BuildContext context,
      {required int observationId,
      required int facultyId,
      required int courseId}) async {
    setLoading(true);

    final data = {
      "observationsId": observationId,
      "facultyId": facultyId,
      "courseId": courseId
    };

    _observationRepo.getScheduleObservationApi(jsonEncode(data)).then((value) {
      setLoading(false);
      Navigator.pop(context);

      if (value["error"] != null) {
        MySnackBar(context, value["error"]);
      } else {
        MySnackBar(context, "Observation Scheduling Started.");
        notifyListeners();
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Navigator.pop(context);
      MySnackBar(context, error.toString());
    });
  }

  Future<void> submitTeachingPlan(BuildContext context,
      {required List<Steps> steps,
      required int templateId,
      required int facultyId}) async {
    setLoading(true);

    final data = {
      {
        "templateResponse": steps,
        "templateId": templateId,
        "editedBy": facultyId
      }
    };

    _observationRepo.getSubmitTeachingPlanApi(jsonEncode(data)).then((value) {
      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);
      MySnackBar(context, error.toString());
    });
  }

  Future<void> updateFacultyTimeSlot(BuildContext context,
      {required List<int> slotIds,
      required int observationId,
      required int facultyId}) async {
    setLoading(true);

    final data = {
      "observationsId": observationId,
      "timeSlotsByFaculty": slotIds
    };

    _observationRepo.getUpdateTimeSlotApi(jsonEncode(data)).then((value) {
      setLoading(false);
      MySnackBar(context, "Slot Updated");
      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);
      MySnackBar(context, error.toString());
    });
  }

  Future<void> updateObserverTimeSlot(BuildContext context,
      {required List<int> slotId, required int observationId}) async {
    setLoading(true);

    final data = {
      "observationsId": observationId,
      "timeSlotByObserver": slotId,
    };

    _observationRepo.getUpdateTimeSlotApi(jsonEncode(data)).then((value) {
      setLoading(false);
      MySnackBar(context, "Slot Updated");

      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);
      MySnackBar(context, error.toString());
    });
  }

  Future<void> confirmFacultyTimeSlot(BuildContext context,
      {required int observationId}) async {
    setLoading(true);

    final data = {
      {"observationsId": observationId, "facultyAccepted": true}
    };

    _observationRepo.getUpdateTimeSlotApi(jsonEncode(data)).then((value) {
      setLoading(false);
      MySnackBar(context, "Observation Updated");

      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);
      MySnackBar(context, error.toString());
    });
  }

  Future<void> confirmObserverTimeSlot(BuildContext context,
      {required int observationId}) async {
    setLoading(true);

    final data = {
      {
        "observationsId": observationId,
        "observerAccepted": true,
        "status": "Completed"
      }
    };

    _observationRepo.getUpdateTimeSlotApi(jsonEncode(data)).then((value) {
      setLoading(false);
      MySnackBar(context, "Observation Updated");

      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);
      MySnackBar(context, error.toString());
    });
  }

  int _currentIndex = 0;
  final controller = PageController(initialPage: 0);

  setPageController(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.hasClients) {
        controller.animateToPage(index,
            duration: Duration(milliseconds: 1), curve: Curves.easeInOut);
      }
    });

    debugPrint("Has Client ${controller.hasClients}");
  }

  setCurrentIndex(int index) {
    _currentIndex = index;

    debugPrint("Value of index: $_currentIndex");
    notifyListeners();
  }

  getCurrentIndex() => _currentIndex;

  // getIndex(observationId) {
  //   debugPrint("OBS ID: $observationId");

  //   getAllObservationById(observationId).then((value) {
  //     debugPrint("Status: ${observationDetail.data!.obsRequest!.status}");

  //     notifyListeners();
  //   }).onError((error, stackTrace) {
  //     debugPrint("err: ${error.toString()}");
  //     setPageController(0);
  //     // setCurrentIndex(0);
  //   });
  // }

  double valuefunction() {
    if (getCurrentIndex() == 0) {
      return 0.25;
    } else if (getCurrentIndex() == 1) {
      return 0.5;
    } else if (getCurrentIndex() == 2) {
      return 0.75;
    } else {
      return 1;
    }
  }
}
