import 'package:flutter/material.dart';
import 'package:neflix_ui/presentation/downloads/screen_downloads.dart';
import 'package:neflix_ui/presentation/fastlaugh/screen_fast_laugh.dart';
import 'package:neflix_ui/presentation/home/screen_home.dart';
import 'package:neflix_ui/presentation/main_page/widgets/bottom_nav.dart';
import 'package:neflix_ui/presentation/new_and_hot/screen_New_and_hot.dart';
import 'package:neflix_ui/presentation/search/screen_search.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({super.key});

  final _pages = [
    ScreenHome(),
    ScreenNewAndHot(),
    ScreenFastLaugh(),
    ScreenSearch(),
    ScreenDownloads(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: indexChangeNotifier,
          builder: (context, int index, child) {
            return _pages[index];
          },
        ),
        bottomNavigationBar: BottomNavWidget(),
      ),
    );
  }
}
