part of 'similar_books_bloc.dart';

abstract class SimilarBooksState extends Equatable {
  const SimilarBooksState();

  @override
  List<Object> get props => [];
}

class SimilarBooksInitial extends SimilarBooksState {}

class SimilarBooksLoading extends SimilarBooksState {}

class SimilarBooksLoaded extends SimilarBooksState {
  final List<BookModel> books;

  const SimilarBooksLoaded({required this.books});
}

class SimilarBooksFailure extends SimilarBooksState {
  final String errorMessage;

  const SimilarBooksFailure({required this.errorMessage});
}
