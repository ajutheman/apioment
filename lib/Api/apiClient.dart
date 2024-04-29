import 'dart:convert';

import 'package:apioment/applicationConfig.dart';
import 'package:dio/dio.dart';

class ApiClient {
  static String baseUrl = ApplicationConfig.ConnectionUrl;
  final Dio dio = Dio();

  ApiClient() {
  
    dio.options.baseUrl = baseUrl; // 5 seconds
    // 5 seconds
  }

  Future<ApiResponseModel> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.get(endpoint, queryParameters: queryParameters);
      var result = jsonDecode(response.toString());
      return ApiResponseModel(true, result);
    } catch (e) {
      return ApiResponseModel(false, e);
    }
  }

  Future<ApiResponseModel> post(String endpoint,
      {Map<String, dynamic>? data}) async {
    try {
      print(ApiClient.baseUrl);
      print("data");
      print(data);
      print("endpoint");
      print(endpoint);
      final response = await dio.post(endpoint, queryParameters: data);
      print(ApiClient.baseUrl);
      print("data");
      print(data);
      print("endpoint");
      print(endpoint);

      var result = jsonDecode(response.toString());
      return ApiResponseModel(true, result);
    } catch (e) {
      print(e);
      return ApiResponseModel(false, e);
    }
  }

  Future<ApiResponseModel> postLoginString(String endpoint) async {
    try {
      final response = await dio.post(endpoint);
      var result = jsonDecode(response.toString());
      return ApiResponseModel(true, result);
    } catch (e) {
      return ApiResponseModel(false, e);
    }
  }

  Future<ApiResponseModel> postString(String endpoint, String data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      var result = jsonDecode(response.toString());
      return ApiResponseModel(true, result);
    } catch (e) {
      return ApiResponseModel(false, e);
    }
  }

  Future<ApiResponseModel> submitConsent(String endpoint, String data) async {
    try {
      final response = await dio.post(endpoint, data: data);
      var result = jsonEncode(response.data);
      return ApiResponseModel(true, result);
    } catch (e) {
      return ApiResponseModel(false, e);
    }
  }
}

class ApiResponseModel {
  bool isSuccess;
  dynamic result;

  ApiResponseModel(
    this.isSuccess,
    this.result,
  );
}
