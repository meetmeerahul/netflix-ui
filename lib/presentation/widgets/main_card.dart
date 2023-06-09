import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';

class MainCard extends StatefulWidget {
  final String posterPath;

  const MainCard({
    super.key,
    required this.posterPath,
  });

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: KBorderRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://www.themoviedb.org/t/p/w500${widget.posterPath}',
          ),
        ),
      ),
    );
  }
}
