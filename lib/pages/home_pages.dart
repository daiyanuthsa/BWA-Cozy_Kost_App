import 'package:bwa_cozy_kost/providers/space_provider.dart';
import 'package:flutter/material.dart';
import 'package:bwa_cozy_kost/models/city.dart';
import 'package:bwa_cozy_kost/models/space.dart';
import 'package:bwa_cozy_kost/models/tips.dart';
import 'package:bwa_cozy_kost/theme.dart';
import 'package:bwa_cozy_kost/widgets/bottom_navbar_item.dart';
import 'package:bwa_cozy_kost/widgets/city_card.dart';
import 'package:bwa_cozy_kost/widgets/space_card.dart';
import 'package:bwa_cozy_kost/widgets/tips_card.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);

    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: ListView(
        children: [
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
              child: FutureBuilder(
                future: spaceProvider.getRecomendedSpaces(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = (snapshot.data as List<Space>?) ?? [];
                    int index = -1;
                    return Column(
                      children: data.map((item) {
                        index++;
                        return Container(
                          margin: EdgeInsets.only(top: index == 0 ? 0 : 30),
                          child: SpaceCard(item),
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              )),
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
      floatingActionButton: Container(
        height: 65,
        width: 327,
        decoration: BoxDecoration(
            color: const Color(0xffF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageurl: 'assets/icon_home1.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageurl: 'assets/icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageurl: 'assets/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageurl: 'assets/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
