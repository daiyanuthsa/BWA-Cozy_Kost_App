import 'package:bwa_cozy_kost/models/city.dart';
import 'package:bwa_cozy_kost/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {

final City city;
const CityCard(this.city, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        height: 150,
        width: 120,
        color: const Color(0xffF6F7F8),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl,
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                city.isPopular ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: 50,
                    height: 30,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30)
                      )
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/star.png',
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ) : Container(),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              city.name,
              style: blacktittleStyle.copyWith(
                fontSize: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}