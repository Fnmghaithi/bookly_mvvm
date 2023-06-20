import 'package:bookly_mvvm/core/widgets/custom_error_widget.dart';
import 'package:bookly_mvvm/core/widgets/custom_loading_indicator.dart';
import 'package:bookly_mvvm/features/home/presentation/manager/featured_books_bloc/featured_books_bloc.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBoxListView extends StatelessWidget {
  const FeaturedBoxListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksBloc, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksLoaded) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 16.0,
                  ),
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo!.imageLinks?.thumbnail! ??
                            '',
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return CustomErrorWidget(message: state.errorMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
