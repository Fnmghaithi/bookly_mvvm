import 'package:bookly_mvvm/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bookly_mvvm/features/home/data/models/book_model/book_model.dart';

part 'featured_books_event.dart';
part 'featured_books_state.dart';

class FeaturedBooksBloc extends Bloc<FeaturedBooksEvent, FeaturedBooksState> {
  final HomeRepo homeRepo;
  FeaturedBooksBloc({required this.homeRepo}) : super(FeaturedBooksInitial()) {
    on<FeaturedBooksEvent>((event, emit) async {
      if (event is FetchFeaturedBooksEvent) {
        emit(FeaturedBooksLoading());
        var result = await homeRepo.fetchFeaturedBooks();
        result.fold(
          (failure) => emit(
            FeaturedBooksFailure(errorMessage: failure.errorMessage),
          ),
          (books) => emit(
            FeaturedBooksLoaded(books: books),
          ),
        );
      }
    });
  }
}
