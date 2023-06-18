import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bookly_mvvm/features/home/data/models/book_model/book_model.dart';

part 'newest_books_bloc_event.dart';
part 'newest_books_bloc_state.dart';

class NewestBooksBlocBloc
    extends Bloc<NewestBooksBlocEvent, NewestBooksBlocState> {
  NewestBooksBlocBloc() : super(NewestBooksBlocInitial()) {
    on<NewestBooksBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
