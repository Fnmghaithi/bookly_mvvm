part of 'featured_books_bloc.dart';

abstract class FeaturedBooksEvent extends Equatable {
  const FeaturedBooksEvent();

  @override
  List<Object> get props => [];
}

class FetchFeaturedBooksEvent extends FeaturedBooksEvent {}
