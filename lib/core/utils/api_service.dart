import 'package:dio/dio.dart';

class ApiService{
  final Dio _dio;
  final baseUrl = "http://api.weatherapi.com/v1";
  final String apiKey = '13c4879480ce438b969171644252103';

  ApiService(this._dio);

  Future<Map<String,dynamic>> get({required String endPoint, Map<String, dynamic>? queryParameters})async{
    var response = await _dio.get('$baseUrl$endPoint',queryParameters: queryParameters);

    return response.data;
  }
}