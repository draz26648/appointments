import 'package:json_annotation/json_annotation.dart';

part 'appointment_model.g.dart';

@JsonSerializable()
class AppointmentModel{
  int? id;
  DoctorModel? doctor;

  AppointmentModel({this.id,this.doctor});
  

  factory AppointmentModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentModelToJson(this);
}


@JsonSerializable()
class DoctorModel{
  int? id;
  UserModel? user;

  DoctorModel({this.id,this.user});


  factory DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);

  
  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);
  

}

@JsonSerializable()
class UserModel {
  int? id;
  String? name;

  UserModel({this.id, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
