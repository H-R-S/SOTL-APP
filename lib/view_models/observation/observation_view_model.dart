import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  int _steps = 3;

  int get steps => _steps;

  setSteps(int value) {
    _steps = value;
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
      if (response.data!.obsRequest != null) {
        if (observationDetail.data!.obsRequest!.status == "Ongoing") {
          setPageController(0);
        } else if (observationDetail.data!.obsRequest!.status == "Completed") {
          // setCurrentIndex(1);
          setPageController(1);
          debugPrint("CurreNT iNDEX: $_currentIndex");
        }
      } else {
        debugPrint(
            "We are getting obsRequest null: ${response.data!.obsRequest}");
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
      {required List<Map<String, dynamic>> steps,
      required int templateId,
      required int facultyId,
      required int obsId}) async {
    setLoading(true);

    final data = {
      "observationsId": obsId,
      "templateResponse": steps,
      "templateId": templateId,
      "editedBy": facultyId
    };

    debugPrint(
        " templateResponse: $steps,templateId: $templateId,editedBy: $facultyId\nObservation Id: $obsId ");

    _observationRepo.getSubmitTeachingPlanApi(jsonEncode(data)).then((value) {
      debugPrint("Working Properly Reponse: $value");
      notifyListeners();
      // Navigator.pop(context);
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
      "scheduledOn": newFormatDate
    };
    debugPrint("Data is: $data");
    _observationRepo.getUpdateTimeSlotApi(jsonEncode(data)).then((value) {
      setLoading(false);
      // MySnackBar(context, "Slot Updated");
      debugPrint("Slot Updated: $value");
      notifyListeners();
    }).onError((error, stackTrace) {
      setLoading(false);
      debugPrint("Slot Updated: $error");
      // MySnackBar(context, error.toString());
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
      "observationsId": observationId,
      "observerAccepted": true,
      "status": "Completed"
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
            duration: const Duration(milliseconds: 1), curve: Curves.easeInOut);
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

  double valuefunction() {
    if (getCurrentIndex() == 0) {
      return 0.5;
    } else {
      return 1;
    }
  }

  // Functionality to select slot provided by faculty

  int _selectedChipIndex = -1; // -1 means no chip is selected initially
  DateTime _selectedDate = DateTime.now(); // Select DateTime for Observation
  String datePicked = "dd/mm/yyyy";
  String? newFormatDate;
  setSlotIndex(int index) {
    _selectedChipIndex = index;
    notifyListeners();
  }

  getselectedDate() => _selectedDate;
  int getSlotIndex() => _selectedChipIndex;

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    debugPrint(picked.toString());

    if (picked != null && picked != _selectedDate) {
      newFormatDate = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(picked);
      debugPrint("New Format is $newFormatDate");
      _selectedDate = picked;
      datePicked =
          "${picked.day.toString()}-${picked.month.toString()}-${picked.year.toString()}"; // Update the TextField value
      notifyListeners();
    }
  }

  // Show teachingPlan

  bool _showTeachingPlan = false;

  setshowTeachingPlan() {
    _showTeachingPlan = !_showTeachingPlan;
    notifyListeners();
  }

  getshowTeachingPlan() => _showTeachingPlan;

  // Working For Observer Rubric screen

  List<String> Part1 = [
    "1. Instruction (including class activities) shows alignment with the programme and course learning outcomes (PLOs and CLOs) and any specified standards.",
    "2. Instruction (including class activities) demonstrates knowledge of the content area, relevant terminology and discipline-specific concepts and skills.",
    "3. Instruction (including class activities) engages students as members of a learning community within their content and/or discipline.",
    "4. Instruction (including class activities) encourages students to utilize their prior content knowledge and to acknowledge their preconceptions about the topic.",
    "5. Instruction (including class activities) explores connections with other content disciplines and/or real world situations."
  ];

  List<String> Part2 = [
    "6. Instruction (including class activities) demonstrates ANY of the following instructional strategies: student-centered approaches (e.g. Active Learning), differentiated instruction (e.g. Universal Design for Learning), experiential learning approaches (e.g. field tours, authentic real-world examples) and/or resources to fit varied student learning styles and needs.",
    "7. Instruction (including class activities) demonstrates a visible movement (e.g. factual knowledge > understanding > application > analysis > integration) and/or learning progression (e.g. easy to difficult and/or basic to complex).",
    "8. Instruction (including class activities) demonstrates use of student engagement strategies such as purposeful questions, strategic grouping, instructional pacing, use of technologies, digital media, and other learning resources.",
    "9. Instruction (including class activities) is responsive to students’ questions, input and examples.",
    "10. Instruction (including class activities) generates a high proportion of student talk between and among students to discuss ideas."
  ];

  List<String> Part3 = [
    "11. Assessments (formative and/or summative) show alignment with the programme and course learning outcomes (PLOs and CLOs) and any specified standards.",
    "12. Assessments (formative and/or summative) are ranged across formative and summative types.",
    "13. Assessments (formative and/or summative) are SMART i.e. specific, measurable, achievable, relevant, and time-bound.",
    "14. Assessments (formative and/or summative) offer a visible movement (e.g. factual knowledge > understanding > application > analysis > integration) and/or learning progression (e.g. easy to difficult and/or basic to complex).",
    "15. Assessments (formative and/or summative) clearly communicate how the students will be assessed (e.g. rubrics, marking guides, etc.)"
  ];

  List<String> Part4 = [
    "16. Instruction, class activities and/or assessments enable the following amongst students: self-directed learning, self-awareness, self-regulation, social awareness, independence, and responsible decision-making.",
    "17. Instruction, class activities and/or assessments support an enabling environment for collaboration across mixed-ability and multilevel student groups.",
    "18. Instruction, class activities and/or assessments encourage a culture of respect for diverse opinions, reflections and unconventional ideas.",
    "19. Instruction, class activities and/or assessments support students who are grappling with challenging material and difficult tasks.",
    "20. Instruction, class activities and/or assessments support communication of ideas through a variety of resources (e.g. digital technologies, learning games, platforms, media, slideshow, models, drawings, graphs, concrete materials, manipulatives, etc.)"
  ];

  List<List<bool>> sliderValueChangedList = [
    [false, false, false, false, false], // Part 1
    [false, false, false, false, false], // Part 2
    [false, false, false, false, false], // Part 3
    [false, false, false, false, false], // Part 4
  ];
  void setValueChanged(int elementNo, int index, bool value) {
    sliderValueChangedList[elementNo][index] = value;
    notifyListeners();
  }

  // Check if all indexes are true else false
  bool checkIfAllIndexesAreTrue(int elementNo) {
    debugPrint("All Indexex boolean value are: ${sliderValueChangedList[0]}");
    return sliderValueChangedList[elementNo].every((value) => value == true);
  }
}
