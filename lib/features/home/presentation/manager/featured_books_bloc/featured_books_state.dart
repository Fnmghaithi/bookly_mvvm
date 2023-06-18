part of 'featured_books_bloc.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitial extends FeaturedBooksState {}

class FeaturedBooksLoading extends FeaturedBooksState {}

class FeaturedBooksLoaded extends FeaturedBooksState {
  final List<BookModel> books;

  const FeaturedBooksLoaded({required this.books});
}

class FeaturedBooksFailure extends FeaturedBooksState {
  final String errorMessage;
  const FeaturedBooksFailure({required this.errorMessage});
}
