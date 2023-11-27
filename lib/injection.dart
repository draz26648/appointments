import 'package:get_it/get_it.dart';
import 'package:live_task/model/network/dio_factory.dart';
import 'package:live_task/model/repository/appointments_repo.dart';
import 'package:live_task/view_model/cubit/appointments_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<DioFactory>(
    () => DioFactoryImpl(),
  );

  getIt.registerLazySingleton<AppointmentsRepo>(
      () => AppointmentsRepoImpl(getIt()));

  getIt.registerFactory<AppointmentsCubit>(() => AppointmentsCubit(getIt()));
}
