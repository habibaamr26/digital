//api
import 'package:dio/dio.dart';
import '../../../../core/constants/constants.dart';


class AppWebServices {
  late Dio dio;

  AppWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
    );

    dio = Dio(options);
  }

  Future<Map<String, dynamic>?> getData({
    required String path,
    required Map<String, dynamic> queryParameters,
  }) async {
    try {
      final response = await dio.get(path, queryParameters: queryParameters);

      if (response.statusCode == 200) {
        //json
        if (response.data is Map<String, dynamic>) {
          return response.data as Map<String, dynamic>;
        } else {
          throw Exception("Unexpected data format");
        }
      } else {
        throw Exception("Error: ${response.statusCode}");
      }
    } catch (e) {
      print("Error in web service: $e");
      return null;
    }
  }
}
