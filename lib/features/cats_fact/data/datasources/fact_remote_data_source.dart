import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/features/cats_fact/data/models/cat_fact.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class ICatFactRemoteDataSource {
  Future<CatFactModel> getCatFact();
}

class CatFactRemoteDataSource implements ICatFactRemoteDataSource {
  const CatFactRemoteDataSource({required this.client});

  final RestFactsClient client;

  @override
  Future<CatFactModel> getCatFact() async {
    late final CatFactModel catFact;

    try {
      catFact = await client.getCatFact();
    } on DioError catch (err) {
      Logger().e(err.response);

      throw ServerException();
    }

    return catFact;
  }
}
