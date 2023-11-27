import 'package:get_it/get_it.dart';
import 'package:live_task/model/network/dio_factory.dart';
import 'package:live_task/model/repository/appointments_repo.dart';
import 'package:live_task/view_model/cubit/appointments_cubit.dart';

final getIt = GetIt.instance;

init() {
  final dio = DioFactory().initDio();

  getIt.registerLazySingleton<DioFactory>(() => dio);

  getIt
      .registerLazySingleton<AppointmentsRepo>(() => AppointmentsRepo(getIt()));

  getIt.registerLazySingleton<AppointmentsCubit>(
      () => AppointmentsCubit(getIt()));
}
