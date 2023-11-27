// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointments_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppointmentsListModel _$AppointmentsListModelFromJson(
        Map<String, dynamic> json) =>
    AppointmentsListModel(
      count: json['count'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => AppointmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AppointmentsListModelToJson(
        AppointmentsListModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'results': instance.results,
    };
