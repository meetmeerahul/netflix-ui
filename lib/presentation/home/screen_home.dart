import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:neflix_ui/core/colors/colors.dart';

import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/domain/trending/trending_api.dart';
import 'package:neflix_ui/domain/trending/trending_model.dart';
import 'package:neflix_ui/presentation/home/widgets/background_card_widget.dart';

import 'package:neflix_ui/presentation/home/widgets/number_title_card.dart';

import '../widgets/main_title_card.dart';

ValueNotifier<bool> scrollNotofier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  List<Results> trendingList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTrending();
  }

  getTrending() async {
    trendingList = await TrendingApi.getTrendingMovies();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable: scrollNotofier,
            builder: (BuildContext context, value, _) {
              return NotificationListener<UserScrollNotification>(
                onNotification: (notification) {
                  final ScrollDirection direction = notification.direction;

                  if (direction == ScrollDirection.reverse) {
                    scrollNotofier.value = false;
                  } else if (direction == ScrollDirection.forward) {
                    scrollNotofier.value = true;
                  }
                  return true;
                },
                child: Stack(
                  children: [
                    ListView(
                      children: [
                        BackgroundCard(),
                        // MainTitleCard(title: 'Released in this year'),
                        KHeight,
                        MainTitleCard(
                          trendingList: trendingList,
                        ),
                        KHeight,
                        NumberTitleCard(),
                        KHeight,
                        // MainTitleCard(title: 'Tense Dramas'),
                        KHeight,
                        // MainTitleCard(title: 'South Indian Cinema'),
                        KHeight,
                      ],
                    ),
                    scrollNotofier.value == true
                        ? AnimatedContainer(
                            duration: Duration(milliseconds: 1000),
                            width: double.infinity,
                            height: 90,
                            color: Colors.black.withOpacity(.5),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      'https://www.freepnglogos.com/uploads/netflix-logo-circle-png-5.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.cast,
                                      color: KWhiteColor,
                                      size: 30,
                                    ),
                                    KWidth,
                                    Container(
                                      height: 30,
                                      width: 30,
                                      color: Colors.blue,
                                    ),
                                    KWidth
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Tv Shows',
                                      style: KStyle,
                                    ),
                                    Text(
                                      'Movies',
                                      style: KStyle,
                                    ),
                                    Text(
                                      'Categories',
                                      style: KStyle,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        : KHeight
                  ],
                ),
              );
            }));
  }
}
