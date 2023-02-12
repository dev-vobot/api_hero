// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$SampleServices extends SampleServices {
  _$SampleServices([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = SampleServices;

  @override
  Future<Response<SampleModel>> getSampleDataFromApi({
    required String contentType,
    required String authorization,
  }) {
    final Uri $url = Uri.parse('https://reqres.in/api/users');
    final Map<String, String> $headers = {
      'Content-Type': contentType,
      'Authorization': authorization,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      headers: $headers,
    );
    return client.send<SampleModel, SampleModel>($request);
  }
}
