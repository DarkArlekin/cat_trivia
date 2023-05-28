import 'package:cat_trivia/features/cats_fact/data/models/cat_fact.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'facts.g.dart';

@RestApi(baseUrl: 'https://cat-fact.herokuapp.com/facts/')
abstract class RestFactsClient {
  factory RestFactsClient(Dio dio, {String baseUrl}) = _RestFactsClient;

  @GET('/random')
  Future<CatFactModel> getCatFact();
} 
