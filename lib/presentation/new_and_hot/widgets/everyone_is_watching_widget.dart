import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/domain/upcoming/upcoming_model.dart';
import 'package:neflix_ui/presentation/home/widgets/custom_button_widget.dart';
import 'package:neflix_ui/presentation/widgets/video_widget.dart';

class EveryoneIsWatchingWidget extends StatefulWidget {
  final List<UpcomingMovieResults> upcomingList;

  final int index;

  const EveryoneIsWatchingWidget(
      {super.key, required this.upcomingList, required this.index});

  @override
  State<EveryoneIsWatchingWidget> createState() =>
      _EveryoneIsWatchingWidgetState();
}

class _EveryoneIsWatchingWidgetState extends State<EveryoneIsWatchingWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KHeight20,
        Text(
          widget.upcomingList[widget.index].title ?? "",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        KHeight,
        Text(widget.upcomingList[widget.index].overview ?? "",
            style: TextStyle(color: KGrey, fontSize: 13)),
        KHeight20,
        VideoWidget(
          backDropPath: widget.upcomingList[widget.index].backdropPath ?? "",
        ),
        KHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            CustomButtonWidget(
              icon: Icons.share,
              title: 'Share ',
              iconsSize: 25,
              textSize: 16,
            ),
            KWidth,
            CustomButtonWidget(
              icon: Icons.add,
              title: 'My List',
              iconsSize: 25,
              textSize: 16,
            ),
            KWidth,
            CustomButtonWidget(
              icon: Icons.play_arrow,
              title: 'Play',
              iconsSize: 20,
              textSize: 16,
            ),
            KWidth,
          ],
        )
      ],
    );
  }
}
