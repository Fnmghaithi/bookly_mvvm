import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/book_list_view_item.dart';
import 'package:bookly_mvvm/features/search/presentation/views/widgets/custom_search_textfield.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomSearchTextField(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                'Search Results',
                style: Styles.textStyle18,
              ),
            ),
            Expanded(
              child: SearchResultListView(),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          // child: BookListViewItem(),
          child: SizedBox(),
        );
      },
    );
  }
}
