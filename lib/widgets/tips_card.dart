import 'package:bwa_cozy_kost/models/tips.dart';
import 'package:bwa_cozy_kost/theme.dart';
import 'package:flutter/material.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  const TipsCard(this.tips, {Key? key}) : super(key: key);
  

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Row(
      
      children: [
        Image.asset(
          tips.imageUrl,
          height: 80,
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
            tips.title,
            style: blacktittleStyle.copyWith(
              fontSize: 18
            ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Updated ${tips.updatedAt}',
              style: greyTextStyle
            )
          ],
        ),
        const Spacer(),
        IconButton(
          onPressed: () {}, 
          icon: Icon(
            Icons.chevron_right,
            color: greyTextsatu,)
        )

      ],
    );
  }
}