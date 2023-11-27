import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:live_task/model/models/appointments_list_model.dart';
import 'package:live_task/model/network/dio_factory.dart';
import 'package:live_task/model/network/error_handler.dart';

abstract class AppointmentsRepo {
  Future<Either<String, AppointmentsListModel>> getAppointments();
}

class AppointmentsRepoImpl implements AppointmentsRepo {
  final DioFactory dioFactory;

  AppointmentsRepoImpl(this.dioFactory);

  @override
  Future<Either<String, AppointmentsListModel>> getAppointments() {
    return _basicErrorHandling(
      onSuccess: () async {
        final response = await dioFactory.get();
        return AppointmentsListModel.fromJson(response);
      },
      onServerError: (e) async {
        return e.message;
      },
    );
  }
}

extension on AppointmentsRepo {
  Future<Either<String, T>> _basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<String> Function(ServerException exception)? onServerError,
  }) async {
    try {
      final f = await onSuccess();
      return Right(f);
    } on ServerException catch (e, s) {
      debugPrint(s.toString());
      if (onServerError != null) {
        final f = await onServerError(e);
        return Left(f);
      }
      return const Left('Server Error');
    } catch (e, s) {
      debugPrint(s.toString());

      return Left(e.toString());
    }
  }
}
