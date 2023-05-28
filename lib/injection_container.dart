import 'package:cat_trivia/core/db/db.dart';
import 'package:cat_trivia/core/db/model/cat_fact.dart';
import 'package:cat_trivia/core/rest/facts.dart';
import 'package:cat_trivia/core/rest/image.dart';
import 'package:cat_trivia/features/cats_fact/data/datasources/fact_local_data_source.dart';
import 'package:cat_trivia/features/cats_fact/data/datasources/fact_remote_data_source.dart';
import 'package:cat_trivia/features/cats_fact/data/datasources/image_remote_data_source.dart';
import 'package:cat_trivia/features/cats_fact/data/repositories/cats_fact_repository.dart';
import 'package:cat_trivia/features/cats_fact/domain/repositories/cats_fact_repository.dart';
import 'package:cat_trivia/features/cats_fact/domain/usecases/get_cats_fact.dart';
import 'package:cat_trivia/features/cats_fact/domain/usecases/get_cats_facts_history.dart';
import 'package:cat_trivia/features/cats_fact/domain/usecases/get_cats_facts_history_length.dart';
import 'package:cat_trivia/features/cats_fact/domain/usecases/get_changes_stream.dart';
import 'package:cat_trivia/features/cats_fact/presentation/cat_fact/presenter/cat_fact_bloc.dart';
import 'package:cat_trivia/features/cats_fact/presentation/cat_fact_history/presenter/cat_facts_history_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Number Trivia
  // Bloc
  sl
    ..registerFactory(
      () => CatFactBloc(
        getCatsFact: sl(),
      ),
    )
    ..registerFactory(
      () => CatFactsHistoryBloc(sl(), sl(), sl()),
    )

    // Use cases
    ..registerLazySingleton(() => GetCatsFact(sl()))
    ..registerLazySingleton(() => GetChangesStream(sl()))
    ..registerLazySingleton(() => GetCatsFactsHistory(sl()))
    ..registerLazySingleton(() => GetCatsFactsHistoryLength(sl()))

    // Repository
    ..registerLazySingleton<ICatsFactRepository>(
      () => CatsFactRepository(
        factLocalDataSource: sl(),
        factRemoteDataSource: sl(),
        imageRemoteDataSource: sl(),
      ),
    )

    // Data sources
    ..registerLazySingleton<ICatFactLocalDataSource>(
      () => CatFactLocalDataSource(modelBox: sl()),
    )
    ..registerLazySingleton<ICatFactRemoteDataSource>(
      () => CatFactRemoteDataSource(client: sl()),
    )
    ..registerLazySingleton<ICatImageRemoteDataSource>(
      () => CatImageRemoteDataSource(client: sl()),
    )

    //! External
    ..registerLazySingleton(() => RestFactsClient(sl()))
    ..registerLazySingleton(() => RestImageClient(sl()))
    ..registerLazySingleton(Dio.new);

  await DB.init();
  final catFactBox = await DB.getBox<CatFactHiveModel>();
  sl.registerLazySingleton(() => catFactBox);
}
