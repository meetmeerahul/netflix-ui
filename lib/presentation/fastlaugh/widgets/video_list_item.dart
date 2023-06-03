import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  get index => widget.index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Left side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.volume_off,
                      size: 30,
                      color: KWhiteColor,
                    ),
                  ),
                ),
                //Right side
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3zunvPLgM9qGFr8ob2BpaKSuAJI.jpg'),
                    ),
                    VideoIconsWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                    KHeight,
                    VideoIconsWidget(icon: Icons.add, title: 'My List'),
                    KHeight,
                    VideoIconsWidget(icon: Icons.share, title: 'Share'),
                    KHeight,
                    VideoIconsWidget(icon: Icons.play_arrow, title: 'Play')
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoIconsWidget extends StatefulWidget {
  final IconData icon;
  final String title;
  const VideoIconsWidget({super.key, required this.icon, required this.title});

  @override
  State<VideoIconsWidget> createState() => _VideoIconsWidgetState();
}

class _VideoIconsWidgetState extends State<VideoIconsWidget> {
  IconData? get icon => widget.icon;

  String get title => widget.title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Text(
            title,
            style: TextStyle(color: KWhiteColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
