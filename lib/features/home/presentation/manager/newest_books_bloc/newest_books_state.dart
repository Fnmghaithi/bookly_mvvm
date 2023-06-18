part of 'newest_books_bloc.dart';

abstract class NewestBooksBlocState extends Equatable {
  const NewestBooksBlocState();

  @override
  List<Object> get props => [];
}

class NewestBooksBlocInitial extends NewestBooksBlocState {}

class NewestBooksBlocLoading extends NewestBooksBlocState {}

class NewestBooksBlocLoaded extends NewestBooksBlocState {
  final List<BookModel> books;

  const NewestBooksBlocLoaded({required this.books});
}

class NewestBooksBlocFailure extends NewestBooksBlocState {
  final String errorMessage;

  const NewestBooksBlocFailure({required this.errorMessage});
}
