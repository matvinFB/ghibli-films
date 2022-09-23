import 'package:chopper/chopper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'ghibli_service.chopper.dart';

abstract class IGhibliService{}

@ChopperApi()
abstract class GhibliService extends ChopperService implements IGhibliService{
  
  static GhibliService create() {
    var env = dotenv.env['BASE_URL'] ?? '';
    print(env);

    final client = ChopperClient(
      baseUrl: env,
      services: [_$GhibliService()], 
      converter: JsonConverter()
    );

    return _$GhibliService(client);
  }

  @Get(path: '/films')
  Future<Response> fetchFilms(@Query('limit') int limit);


}