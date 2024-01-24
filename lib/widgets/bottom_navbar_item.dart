import 'package:bwa_cozy_kost/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageurl;
  final bool isActive;
  
  const BottomNavbarItem({Key? key, required this.imageurl, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset( imageurl,
        width: 26,),
        const Spacer(),
        isActive 
          ? Container(
              width: 30,
              height: 2
              ,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: const BorderRadius.vertical(
                  top:Radius.circular(1000))
              ),
            )
          : Container()
      ],
    );
  }
}