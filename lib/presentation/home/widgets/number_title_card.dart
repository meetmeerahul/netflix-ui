import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/domain/tv_shows.dart/tv_shows_model.dart';
import 'package:neflix_ui/presentation/home/widgets/number_card.dart';
import 'package:neflix_ui/presentation/widgets/main_title.dart';

class NumberTitleCard extends StatelessWidget {
  final List<TvShows> trendingTvShows;

  const NumberTitleCard({super.key, required this.trendingTvShows});

  @override
  Widget build(BuildContext context) {
    print(trendingTvShows.toString());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: 'Top 10 TV Shows In India Today'),
        KHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) {
              return NumberCard(
                index: index + 1,
                posterPath: trendingTvShows[index].posterPath ?? "",
              );
            }),
          ),
        )
      ],
    );
  }
}
