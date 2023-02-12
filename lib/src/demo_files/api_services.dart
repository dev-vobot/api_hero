import 'json_to_type_converter.dart';
import 'package:chopper/chopper.dart';
import 'api_constants.dart';
import 'api_interceptors.dart';
import 'sample_item_model.dart';
// This is necessary for the generator to work.
part 'api_services.chopper.dart';

final _client = ChopperClient(
  baseUrl: Uri.parse(ApiConstants.baseUrl),

  ///for every service that requires a defined type there must be a corresponding converter entry here
  converter: JsonSerializableConverter({
    SampleModel: (json) => SampleModel.fromMap(json),
  }),

  ///Don't modify
  interceptors: [
    ApiResponseInterceptor(),
    ApiRequestInterceptor(),
  ],
);

@ChopperApi(baseUrl: ApiConstants.baseUrl)
abstract class SampleServices extends ChopperService {
  ///Don't modify
  static SampleServices create({bool? setSap}) {
    return _$SampleServices(_client);
  }

  ///these would be the actual stuff for you to work on ---- read more on the chopper's documentations

  //api end points are listed in separate class
  //responses with a defined type must have a corresponding value inside the converters list
  @Get(path: ApiConstants.users)
  Future<Response<SampleModel>> getSampleDataFromApi({
    @Header('Content-Type') required String contentType,
    @Header('Authorization') required String authorization,
    //@Body() required Map<String, dynamic> body,
    //@Query() required String query,
  });
}
