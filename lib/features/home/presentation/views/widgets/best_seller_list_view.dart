import 'package:bookly_mvvm/core/widgets/custom_error_widget.dart';
import 'package:bookly_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_mvvm/features/home/presentation/manager/newest_books_bloc/newest_books_bloc.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksBloc, NewestBooksBlocState>(
      builder: (context, state) {
        if (state is NewestBooksBlocLoaded) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: BookListViewItem(
                  book: state.books[index],
                ),
              );
            },
          );
        } else if (state is NewestBooksBlocFailure) {
          return CustomErrorWidget(message: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
