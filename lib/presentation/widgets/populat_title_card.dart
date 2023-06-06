import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';

import 'package:neflix_ui/presentation/widgets/main_card.dart';
import 'package:neflix_ui/presentation/widgets/main_title.dart';

class PopularTitleCard extends StatelessWidget {
  final List<dynamic> popularList;
  final String tittle;

  PopularTitleCard(
      {super.key, required this.popularList, required this.tittle});

  @override
  Widget build(BuildContext context) {
    print("----------------------");
    print(popularList.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: tittle),
        KHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(popularList.length, (index) {
              return MainCard(
                posterPath: popularList[index].posterPath ?? " ",
              );
            }),
          ),
        )
      ],
    );
  }
}
