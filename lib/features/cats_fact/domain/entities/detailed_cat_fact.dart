import 'package:cat_trivia/features/cats_fact/data/models/cat_fact.dart';
import 'package:cat_trivia/features/cats_fact/data/models/cat_image.dart';
import 'package:cat_trivia/features/cats_fact/domain/entities/cat_fact.dart';

class DetailedCatFact extends CatFact {
  const DetailedCatFact({
    required super.id,
    required super.createdAt,
    required super.text,
    required this.image,
  });

  factory DetailedCatFact.fromModels(
    CatFactModel factModel,
    CatImageModel imageModel,
  ) =>
      DetailedCatFact(
        id: factModel.id,
        createdAt: factModel.createdAt,
        text: factModel.text,
        image: imageModel.url,
      );

  final String image;

  @override
  List<Object?> get props => [
        ...super.props,
        image,
      ];
}
