import 'package:cat_trivia/features/cats_fact/data/models/cat_image.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'image.g.dart';

@RestApi(baseUrl: 'https://api.thecatapi.com/v1/images/')
abstract class RestImageClient {
  factory RestImageClient(Dio dio, {String baseUrl}) = _RestImageClient;

  @GET('/search')
  Future<List<CatImageModel>> getCatImages();
} 
