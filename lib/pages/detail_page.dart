// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:bwa_cozy_kost/models/space.dart';
import 'package:bwa_cozy_kost/pages/error_page.dart';
import 'package:bwa_cozy_kost/pages/home_pages.dart';
import 'package:bwa_cozy_kost/theme.dart';
import 'package:bwa_cozy_kost/widgets/facility_item.dart';
import 'package:bwa_cozy_kost/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;

  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    Future<void> actionUrl(String url, BuildContext context) async {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Image.network(
            space.imageUrl,
            width: MediaQuery.of(context).size.width,
            height: 350,
            fit: BoxFit.cover,
          ),
          ListView(
            children: [
              SizedBox(
                height: 328,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    // NOTE : TITLE
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                space.name,
                                style: blacktittleStyle.copyWith(
                                  fontSize: 22,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text.rich(TextSpan(
                                  text: '\$${space.price}',
                                  style: purppleTextStyle.copyWith(
                                    fontSize: 16,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: ' / month',
                                        style: greyTextStyle.copyWith(
                                          fontSize: 16,
                                        ))
                                  ])),
                            ],
                          ),
                          Row(
                            children: [
                              RatingItem(index: 1, rating: space.rating),
                              SizedBox(
                                width: 2,
                              ),
                              RatingItem(index: 2, rating: space.rating),
                              SizedBox(
                                width: 2,
                              ),
                              RatingItem(index: 3, rating: space.rating),
                              SizedBox(
                                width: 2,
                              ),
                              RatingItem(index: 4, rating: space.rating),
                              SizedBox(
                                width: 2,
                              ),
                              RatingItem(index: 5, rating: space.rating),
                            ],
                          )
                        ],
                      ),
                    ),
                    // NOTE : MAIN FACILITIES
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Main Facilities',
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),

                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FacilityItem(
                            name: 'kitchen',
                            imageUrl: 'assets/facilities_bar.png',
                            total: space.numberOfKitchens,
                          ),
                          FacilityItem(
                            name: 'bedroom',
                            imageUrl: 'assets/facilities_bed.png',
                            total: space.numberOfBedrooms,
                          ),
                          FacilityItem(
                            name: ' Big Lemari',
                            imageUrl: 'assets/facilities_cupboard.png',
                            total: space.numberOfCupboards,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // NOTE : PHOTOS
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Main Facilities',
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 88,
                      child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: space.photos.map((item) {
                            return Container(
                              margin: EdgeInsets.only(
                                left: 24,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.network(
                                  item,
                                  height: 88,
                                  width: 110,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          }).toList()),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    // NOTE : LOCATION
                    Padding(
                      padding: EdgeInsets.only(left: edge),
                      child: Text(
                        'Location',
                        style: regularTextStyle.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${space.address}\n${space.city}, ${space.country}',
                            style: greyTextStyle.copyWith(
                              fontSize: 14,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("Button tapped");
                              actionUrl(space.mapUrl, context);
                            },
                            child: Image.asset(
                              'assets/btn_loc.png',
                              height: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          actionUrl('tel:+${space.phone}', context);
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(17)))),
                        child: Text(
                          'Book Now',
                          style: whiteTextStyle.copyWith(fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: edge,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Image.asset(
                    'assets/back_btn.png',
                    height: 40,
                  ),
                ),
                Image.asset(
                  'assets/wishlist_btn.png',
                  height: 40,
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
