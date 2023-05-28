import 'package:cat_trivia/core/core.dart';
import 'package:cat_trivia/core/rest/image.dart';
import 'package:cat_trivia/features/cats_fact/data/models/cat_image.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

abstract class ICatImageRemoteDataSource {
  Future<CatImageModel> getCatImage();
}

class CatImageRemoteDataSource implements ICatImageRemoteDataSource {
  const CatImageRemoteDataSource({required this.client});

  final RestImageClient client;

  @override
  Future<CatImageModel> getCatImage() async {
    late final CatImageModel catImage;

    try {
      catImage = (await client.getCatImages()).first;
    } on DioError catch (err) {
      Logger().e(err);

      throw ServerException();
    }

    return catImage;
  }
}
