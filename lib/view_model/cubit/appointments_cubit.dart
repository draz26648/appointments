import 'package:bloc/bloc.dart';
import 'package:live_task/model/models/appointments_list_model.dart';
import 'package:live_task/model/repository/appointments_repo.dart';
import 'package:meta/meta.dart';

part 'appointments_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsState> {
  AppointmentsRepo appointmentsRepo;
  AppointmentsCubit(this.appointmentsRepo) : super(AppointmentsInitial());

  // get appointments data

  void getAppointments() async {
    emit(GetAppointmentsLoading());
    final result = await appointmentsRepo.getAppointments();
    result.fold(
      (l) => emit(GetAppointmentsError(error: l)),
      (r) => emit(GetAppointmentsSuccess(data: r)),
    );
  }
}
