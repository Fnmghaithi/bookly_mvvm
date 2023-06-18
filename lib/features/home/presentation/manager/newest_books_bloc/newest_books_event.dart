part of 'newest_books_bloc.dart';

abstract class NewestBooksBlocEvent extends Equatable {
  const NewestBooksBlocEvent();

  @override
  List<Object> get props => [];
}

class FetchNewestBooksEvent extends NewestBooksBlocEvent {}
