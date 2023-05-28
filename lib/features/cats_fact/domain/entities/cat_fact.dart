import 'package:cat_trivia/features/cats_fact/data/models/cat_fact.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class CatFact extends Equatable {
  const CatFact({
    required this.id,
    required this.createdAt,
    required this.text,
  });

  factory CatFact.fromModel(CatFactModel model) => CatFact(
        id: model.id,
        createdAt: model.createdAt,
        text: model.text,
      );
      
  final String id;
  final DateTime createdAt;
  final String text;

  String get createdDate {
    return DateFormat('yyyy-MM-dd – kk:mm').format(createdAt.toLocal());
  }

  @override
  List<Object?> get props => [
        id,
        createdAt,
        text,
      ];
}
