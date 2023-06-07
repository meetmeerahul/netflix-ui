import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';

class VideoWidget extends StatefulWidget {
  final String backDropPath;

  const VideoWidget({super.key, required this.backDropPath});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            'https://www.themoviedb.org/t/p/w500${widget.backDropPath}',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.black.withOpacity(0.5),
            radius: 25,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.volume_off,
                size: 30,
                color: KWhiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
