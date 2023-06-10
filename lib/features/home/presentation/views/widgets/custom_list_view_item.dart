import 'package:bookly_mvvm/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.height * .2,
      child: AspectRatio(
        aspectRatio: 2.8 / 4,
        child: Container(
          // height: MediaQuery.of(context).size.height * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: const DecorationImage(
              image: AssetImage(AssetsData.testImage),
              // fit: BoxFit.fill
            ),
          ),
        ),
      ),
    );
  }
}
