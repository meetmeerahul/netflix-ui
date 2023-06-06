import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';

import 'package:neflix_ui/presentation/home/widgets/custom_button_widget.dart';

// ignore: must_be_immutable
class BackgroundCard extends StatefulWidget {
  late String imageLInk;

  BackgroundCard({super.key, required this.imageLInk});

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 600,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                  'https://www.themoviedb.org/t/p/w500' + widget.imageLInk),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButtonWidget(title: 'My List', icon: Icons.add),
                _PlayButton(),
                CustomButtonWidget(title: 'Info', icon: Icons.info),
              ],
            ),
          ),
        )
      ],
    );
  }
}

TextButton _PlayButton() {
  return TextButton.icon(
      style: ButtonStyle(
          shape: MaterialStateProperty.all(LinearBorder.none),
          backgroundColor: MaterialStateProperty.all(Colors.white)),
      onPressed: () {},
      icon: Icon(
        Icons.play_arrow,
        color: KBlack,
        size: 25,
      ),
      label: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          'Play',
          style: TextStyle(fontSize: 20, color: KBlack),
        ),
      ));
}
