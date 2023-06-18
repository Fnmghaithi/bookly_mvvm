import 'package:bookly_mvvm/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bookly_mvvm/features/home/data/models/book_model/book_model.dart';

part 'newest_books_bloc_event.dart';
part 'newest_books_bloc_state.dart';

class NewestBooksBlocBloc
    extends Bloc<NewestBooksBlocEvent, NewestBooksBlocState> {
  final HomeRepo homeRepo;
  NewestBooksBlocBloc({required this.homeRepo})
      : super(NewestBooksBlocInitial()) {
    on<NewestBooksBlocEvent>((event, emit) async {
      if (event is FetchNewestBooksEvent) {
        emit(NewestBooksBlocLoading());
        var result = await homeRepo.fetchNewestBooks();

        result.fold(
          (failure) => emit(
            NewestBooksBlocFailure(
              errorMessage: failure.errorMessage,
            ),
          ),
          (books) => emit(
            NewestBooksBlocLoaded(books: books),
          ),
        );
      }
    });
  }
}
