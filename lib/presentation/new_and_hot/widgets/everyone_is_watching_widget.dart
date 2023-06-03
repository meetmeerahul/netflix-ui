import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/presentation/home/widgets/custom_button_widget.dart';
import 'package:neflix_ui/presentation/widgets/video_widget.dart';

class EveryoneIsWatchingWidget extends StatelessWidget {
  const EveryoneIsWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        KHeight20,
        Text(
          "Friends",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        KHeight,
        Text(
          "The school is putting on the stage play . Steve Zahn, who plays father Richie Kreyman, met his wife Robyn Peterman while they were performing in a national tour of  in 1991.",
          style: TextStyle(color: KGrey),
        ),
        KHeight20,
        VideoWidget(),
        KHeight,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
