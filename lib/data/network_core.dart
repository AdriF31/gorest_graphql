import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkCore{
  final _dio = Dio();

  Network() {
    _dio.interceptors.clear();

    _dio.interceptors.add(InterceptorsWrapper(onRequest: (option, handler) {
      debugPrint("Url : ${option.uri}");
      debugPrint("Data : ${option.data}");
      return handler.next(option);
    }, onResponse: (response, handler) async {
      // debugPrint("Response : ${response.data}");
      return handler.next(response);
    }, onError: (dioError, handler) async {
      debugPrint("Error : ${dioError.error}");
      return handler.next(dioError);
    }));

    _dio.options = BaseOptions(
        baseUrl: "https://itunes.apple.com",
        connectTimeout: 30000,
        receiveTimeout: 30000
    );
  }
}