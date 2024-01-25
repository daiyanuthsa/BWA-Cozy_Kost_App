import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  const RatingItem({super.key, required this.index, required this.rating});

  final int index;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return index <= rating
        ? Image.asset(
            'assets/star.png',
            width: 20,
          )
        : Image.asset(
            'assets/star.png',
            width: 20,
            color: const Color(0xff989BA1),
          );
  }
}
