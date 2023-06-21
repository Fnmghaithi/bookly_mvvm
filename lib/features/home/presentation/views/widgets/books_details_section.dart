import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/books_action.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  final BookModel book;
  const BookDetailsSection({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
              imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? ''),
        ),
        const SizedBox(height: 43),
        Text(
          book.volumeInfo!.title!,
          style: Styles.textStyle30.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            book.volumeInfo!.authors?[0] ?? '',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        const BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        BooksAction(book: book),
      ],
    );
  }
}
