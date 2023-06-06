import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';

class NumberCard extends StatefulWidget {
  final int index;

  final String posterPath;
  NumberCard({super.key, required this.index, required this.posterPath});

  @override
  State<NumberCard> createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              width: 40,
              height: 200,
            ),
            Container(
              width: 150,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: KBorderRadius20,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    'https://www.themoviedb.org/t/p/w500${widget.posterPath}',
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 13,
          bottom: -30,
          child: BorderedText(
            strokeWidth: 10.0,
            strokeColor: KWhiteColor,
            child: Text(
              '${widget.index}',
              style: TextStyle(
                  fontSize: 150,
                  color: KBlack,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  decorationColor: KBlack),
            ),
          ),
        ),
      ],
    );
  }
}
