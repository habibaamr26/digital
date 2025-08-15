
import '../model/data_model.dart';
import '../services/dio_helper.dart';

// get data from server and return response to model
class NewsRepository {
  final AppWebServices apiService;

  NewsRepository(this.apiService);

  Future<Response?> getTopHeadlines({String country = "us"}) async {
    final data = await apiService.getData(
      path: '/top-headlines',
      queryParameters: {
        'country': country,
        'apiKey': '14cae4ffc650405e9dc96b956f5b3b14',
      },
    );

    if (data != null) {
      return Response.fromJson(data);
    }
    return null;
  }
}
