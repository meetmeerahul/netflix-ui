import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/domain/upcoming/upcoming_api.dart';
import 'package:neflix_ui/domain/upcoming/upcoming_model.dart';

import 'package:neflix_ui/presentation/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:neflix_ui/presentation/new_and_hot/widgets/everyone_is_watching_widget.dart';

const String hotAndNewTemp =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/81vgYY5fnGdi3WoCCoSm50gFSKn.jpg';

List<UpcomingMovieResults> upcomingList = [];

class ScreenNewAndHot extends StatefulWidget {
  ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUpComing();
  }

  getUpComing() async {
    upcomingList = await UpcomingMovieApi.getUpcomingMovies();
    setState(() {});
  }

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
        body: upcomingList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : TabBarView(children: [
                _buildComingSoon(upcomingList: upcomingList),
                _buildEveryoneIsWatching(upcomingList: upcomingList),
              ]),
      ),
    );
  }
}

_buildComingSoon({required upcomingList}) {
  return ListView.builder(
    itemBuilder: (BuildContext, index) => ComingSoonWidget(
      upcomingList: upcomingList,
      index: index,
    ),
    itemCount: 15,
  );
}

_buildEveryoneIsWatching({required upcomingList}) {
  return ListView.builder(
    itemBuilder: (context, index) => EveryoneIsWatchingWidget(
      upcomingList: upcomingList,
      index: index,
    ),
    itemCount: 15,
  );
}
