
import 'package:dio/dio.dart';
import 'package:elevate_task/core/utilis/api_constance.dart';

class ApiService {
   final Dio _dio;

  ApiService(this._dio);

   Future<dynamic> get({required String url}) async {
     final response = await _dio.get(url);
     return response.data;
   }

}
