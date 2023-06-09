import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';

import 'package:neflix_ui/presentation/widgets/main_card.dart';
import 'package:neflix_ui/presentation/widgets/main_title.dart';

class MainTitleCard extends StatelessWidget {
  final List<dynamic> trendingList;
  final String tittle;

  MainTitleCard({super.key, required this.trendingList, required this.tittle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: tittle),
        KHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(trendingList.length, (index) {
              return MainCard(
                posterPath: trendingList[index].posterPath ?? " may be null",
              );
            }),
          ),
        )
      ],
    );
  }
}
