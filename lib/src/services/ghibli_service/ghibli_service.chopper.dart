// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ghibli_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$GhibliService extends GhibliService {
  _$GhibliService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GhibliService;

  @override
  Future<Response<dynamic>> fetchFilms(int limit) {
    final $url = '/films';
    final $params = <String, dynamic>{'limit': limit};
    final $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
