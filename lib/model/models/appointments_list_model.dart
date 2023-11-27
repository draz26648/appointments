import 'package:json_annotation/json_annotation.dart';
import 'package:live_task/model/models/appointment_model.dart';

part 'appointments_list_model.g.dart';

@JsonSerializable()
class AppointmentsListModel{
  int? count;
  List<AppointmentModel>? results;
  AppointmentsListModel({this.count,this.results});


  factory AppointmentsListModel.fromJson(Map<String, dynamic> json) =>
      _$AppointmentsListModelFromJson(json);

  Map<String, dynamic> toJson() => _$AppointmentsListModelToJson(this);


}
