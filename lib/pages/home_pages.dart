import 'package:flutter/material.dart';
import 'package:bwa_cozy_kost/models/city.dart';
import 'package:bwa_cozy_kost/models/space.dart';
import 'package:bwa_cozy_kost/models/tips.dart';
import 'package:bwa_cozy_kost/theme.dart';
import 'package:bwa_cozy_kost/widgets/bottom_navbar_item.dart';
import 'package:bwa_cozy_kost/widgets/city_card.dart';
import 'package:bwa_cozy_kost/widgets/space_card.dart';
import 'package:bwa_cozy_kost/widgets/tips_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: ListView(
        children:  [
          const SizedBox(
            height: 24,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: edge,
            ),
            child: Text(
              'Explore Now',
              style: blacktittleStyle.copyWith(
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(
            height: 2,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Mencari kosan yang cozy',
              style: greyTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Popular Cities',
              style: regularTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  width: edge,
                ),
                CityCard(
                  City(
                    id: 1,
                    name: 'Jakarta',
                    imageUrl: 'assets/city1.png',
                    isPopular: false,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CityCard(
                  City(
                    id: 2,
                    name: 'Bandung',
                    imageUrl: 'assets/city2.png',
                    isPopular: true,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CityCard(
                  City(
                    id: 3,
                    name: 'Suraabaya',
                    imageUrl: 'assets/city3.png',
                    isPopular: false,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                CityCard(
                  City(
                    id: 3,
                    name: 'Malang',
                    imageUrl: 'assets/city4.png',
                    isPopular: false,
                  ),
                ),
                SizedBox(
                  width: edge,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Recommended Space',
              style: regularTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SpaceCard(Space(
                    id: 1,
                    name: 'Kuretakeso Hott',
                    imageUrl: 'assets/space1.png',
                    price: 52,
                    city: 'city',
                    country: 'Indonesia',
                    rating: 4)),
                const SizedBox(
                  height: 30,
                ),
                SpaceCard(Space(
                    id: 2,
                    name: 'Roemah Nenek',
                    imageUrl: 'assets/space2.png',
                    price: 11,
                    city: 'Seattle, Bogor',
                    country: 'Indonesia',
                    rating: 5)),
                const SizedBox(
                  height: 30,
                ),
                SpaceCard(Space(
                    id: 3,
                    name: 'Kuretakeso Hott',
                    imageUrl: 'assets/space3.png',
                    price: 20,
                    city: 'city',
                    country: 'Indonesia',
                    rating: 3)),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.only(left: edge),
            child: Text(
              'Tips & Guidance',
              style: regularTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: edge,
            ),
            child: Column(
              children: [
                TipsCard(Tips(
                    id: 1,
                    title: 'City Guidelines',
                    imageUrl: 'assets/guide_icon.png',
                    updatedAt: '20 Apr')),
                const SizedBox(
                  height: 20,
                ),
                TipsCard(Tips(
                    id: 2,
                    title: 'Jakarta Fairship',
                    imageUrl: 'assets/guide_icon2.png',
                    updatedAt: '11 Dec'))
              ],
            ),
          ),
          SizedBox(
            height: 70 + edge,
          ),
        ],
      )),
    );
  }
}
