import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';

class PopularCard extends StatefulWidget {
  final String posterPath;
  const PopularCard({
    super.key,
    required this.posterPath,
  });

  @override
  State<PopularCard> createState() => _PopularCardState();
}

class _PopularCardState extends State<PopularCard> {
  @override
  Widget build(BuildContext context) {
    print("----------------------");
    print(widget.posterPath);
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      width: 130,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: KBorderRadius10,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://www.themoviedb.org/t/p/w500' + widget.posterPath,
          ),
        ),
      ),
    );
  }
}
