import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      {"observationsId": observationId, "timeSlotsByFaculty": slotIds}
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
      {required int slotId,
      required int observationId,
      required int facultyId}) async {
    setLoading(true);

    final data = {
      {"observationsId": observationId, "timeSlotByObserver": slotId}
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
}
