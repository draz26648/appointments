import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioFactory {
  late Dio dio;

  initDio() {
    dio = Dio();
    dio.options =
        BaseOptions(baseUrl: 'https://dev.minaini.com:2053/r/', headers: {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAxMTgxNDM5LCJpYXQiOjE3MDEwOTUwMzksImp0aSI6IjE1NDU1ZmQ5ZTYyYTQ5MzRiMGIyMmFhNTdkZTAwMjdiIiwidXNlcl9pZCI6Mn0._YlJlzJLtAeY8BNvOeLn5XG9AF1MWlb0ob4_yU0c9WM',
    });
  }

  Future<Response> getData() async {
    try {
      final result = await dio.get('appointments');
      return result;
    } on DioException catch (e) {
      debugPrint('there\'s an error ${e.toString()}');
    }
  }
}
