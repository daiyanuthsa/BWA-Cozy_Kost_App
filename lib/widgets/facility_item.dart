import 'package:flutter/material.dart';
import 'package:bwa_cozy_kost/theme.dart';

class FacilityItem extends StatelessWidget {
  
  final String name;
  final String imageUrl;
  final int total;

  const FacilityItem({Key? key, required this.name, required this.imageUrl, required this.total}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl,
          height: 32,
        ),
        const SizedBox(
          height: 8,
        ),
        Text.rich(
                TextSpan(
                  text: '$total',
                  style: purppleTextStyle.copyWith(
                    fontSize:14,
                  ),
                  children: [
                    TextSpan(
                      text: ' $name',
                      style: greyTextStyle.copyWith(
                        fontSize: 14,
                      )
                    )
                  ]
                )
              ),
      ],
    );
  }
}