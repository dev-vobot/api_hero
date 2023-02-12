import 'package:chopper/chopper.dart';

import 'api_services.dart';
import 'sample_item_model.dart';

class SampleRepository {
  SampleRepository() : _apiServices = SampleServices.create();
  final SampleServices _apiServices;

  Future<Response<SampleModel>> fetchSample() async {
    return _apiServices.getSampleDataFromApi(
      contentType: "application/json",
      authorization: "Bearer token goes here",
      //body: {},
      //query: '',
    );
  }
}
