part of 'similar_books_bloc.dart';

abstract class SimilarBooksEvent extends Equatable {
  const SimilarBooksEvent();

  @override
  List<Object> get props => [];
}

class FetchSimilarBooksEvent extends SimilarBooksEvent {
  final String category;

  const FetchSimilarBooksEvent({required this.category});
}
