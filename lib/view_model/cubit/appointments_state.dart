part of 'appointments_cubit.dart';

@immutable
sealed class AppointmentsState {}

final class AppointmentsInitial extends AppointmentsState {}

//get appointments data
class GetAppointmentsLoading extends AppointmentsState{}

class GetAppointmentsSuccess extends AppointmentsState{
  final AppointmentsListModel data;

  GetAppointmentsSuccess({required this.data});
}

class GetAppointmentsError extends AppointmentsState{
  final String error;

  GetAppointmentsError({required this.error});
}
