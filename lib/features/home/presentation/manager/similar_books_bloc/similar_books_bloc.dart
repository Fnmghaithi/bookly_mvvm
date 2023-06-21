import 'package:bookly_mvvm/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bookly_mvvm/features/home/data/models/book_model/book_model.dart';

part 'similar_books_event.dart';
part 'similar_books_state.dart';

class SimilarBooksBloc extends Bloc<SimilarBooksEvent, SimilarBooksState> {
  final HomeRepo homeRepo;
  SimilarBooksBloc({required this.homeRepo}) : super(SimilarBooksInitial()) {
    on<SimilarBooksEvent>((event, emit) async {
      if (event is FetchSimilarBooksEvent) {
        emit(SimilarBooksLoading());
        var result = await homeRepo.fetchSimilarBooks(category: event.category);

        result.fold(
          (failure) => emit(
            SimilarBooksFailure(
              errorMessage: failure.errorMessage,
            ),
          ),
          (books) => emit(
            SimilarBooksLoaded(books: books),
          ),
        );
      }
    });
  }
}
