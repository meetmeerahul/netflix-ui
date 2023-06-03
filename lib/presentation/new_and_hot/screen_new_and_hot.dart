import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';

import 'package:neflix_ui/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:neflix_ui/presentation/new_and_hot/widgets/everyone_is_watching_widget.dart';

const String hotAndNewTemp =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/81vgYY5fnGdi3WoCCoSm50gFSKn.jpg';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
          child: AppBar(
            title: Text(
              'New & Hot',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: KWhiteColor),
            ),
            actions: [
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
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: KWhiteColor,
              labelColor: KBlack,
              labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              indicator: BoxDecoration(
                  color: KWhiteColor, borderRadius: KBorderRadius30),
              tabs: [
                Container(
                  width: 190,
                  child: Tab(
                    text: "🍿Coming Soon",
                  ),
                ),
                Tab(
                  text: "👀 Everyone is watching",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          _buildComingSoon(),
          _buildEveryoneIsWatching(),
        ]),
      ),
    );
  }
}

_buildComingSoon() {
  return ListView.builder(
    itemBuilder: (BuildContext, index) => const ComingSoonWidget(),
    itemCount: 5,
  );
}

_buildEveryoneIsWatching() {
  return ListView.builder(
    itemBuilder: (context, index) => const EveryoneIsWatchingWidget(),
    itemCount: 10,
  );
}
