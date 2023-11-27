import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class DioFactory {
   Future<dynamic> get(
    
   );
}

class DioFactoryImpl implements DioFactory{
   final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dev.minaini.com:2053/r/',
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      
    ),
  );

  @override
  Future<dynamic> get() async {
    try {
      final response = await dio.get(
        'appointments',
        options: Options(
          headers: {
            'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAxMTgxNDM5LCJpYXQiOjE3MDEwOTUwMzksImp0aSI6IjE1NDU1ZmQ5ZTYyYTQ5MzRiMGIyMmFhNTdkZTAwMjdiIiwidXNlcl9pZCI6Mn0._YlJlzJLtAeY8BNvOeLn5XG9AF1MWlb0ob4_yU0c9WM',
          },
        ),
      );
      return response.data;
    } on DioException catch (e) {
      debugPrint(e.toString());
      
    }
  }

}
