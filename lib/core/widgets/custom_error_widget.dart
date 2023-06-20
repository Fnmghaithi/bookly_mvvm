import 'package:bookly_mvvm/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String message;
  const CustomErrorWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: Styles.textStyle18,
        textAlign: TextAlign.center,
      ),
    );
  }
}
