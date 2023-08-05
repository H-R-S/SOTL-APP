import 'observation_model.dart';

class InitiateObservationModel {
  List<ObservationModel>? observations;
  List<Existed>? existed;

  InitiateObservationModel({this.observations, this.existed});

  InitiateObservationModel.fromJson(Map<String, dynamic> json) {
    if (json['observations'] != null) {
      observations = <ObservationModel>[];
      json['observations'].forEach((v) {
        observations!.add(ObservationModel.fromJson(v));
      });
    }
    if (json['existed'] != null) {
      existed = <Existed>[];
      json['existed'].forEach((v) {
        existed!.add(Existed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (observations != null) {
      data['observations'] = observations!.map((v) => v.toJson()).toList();
    }
    if (existed != null) {
      data['existed'] = existed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Existed {
  String? message;

  Existed({this.message});

  Existed.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    return data;
  }
}
