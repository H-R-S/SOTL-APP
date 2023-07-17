import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  ApiResponse<List<ObservationModel>> observationsList = ApiResponse.loading();

  setObservationsList(ApiResponse<List<ObservationModel>> response) {
    observationsList = response;
    notifyListeners();
  }

  Future<void> initiateObservation(BuildContext context, String facultyId,
      observerId, courseId, semester) async {
    setLoading(true);

    final userViewModel = Provider.of<UserViewModel>(context, listen: false);

    userViewModel.getUser().then((value) {
      final header = {'Authorization': 'Bearer ${value.token}'};

      _observationRepo.initiateObservationApi({
        "facultyId": facultyId,
        "observerId": observerId,
        "hodId": value.id.toString(),
        "semester": semester,
        "courseId": courseId
      }, header).then((value) {
        setLoading(false);
        MySnackBar(context, "Observation Initiated");
      }).onError((error, stackTrace) {
        setLoading(false);
        debugPrint(error.toString());
        MySnackBar(context, error.toString());
      });
    });
  }

  Future<void> getAllObservations() async {
    setObservationsList(ApiResponse.loading());

    _observationRepo.getAllObservationsApi().then((value) {
      setObservationsList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setObservationsList(ApiResponse.error(error.toString()));
    });
  }
}
