import 'package:bookly_mvvm/constants.dart';
import 'package:bookly_mvvm/core/utils/assets.dart';
import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_mvvm/features/home/presentation/views/widgets/featured_list_view.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            CustomAppBar(),
            FeaturedBoxListView(),
            SizedBox(height: 48),
            Text(
              'Best Seller',
              style: Styles.textStyle18,
            ),
            SizedBox(height: 24),
            BestSellerListViewItem(),
          ],
        ),
      ),
    );
  }
}
