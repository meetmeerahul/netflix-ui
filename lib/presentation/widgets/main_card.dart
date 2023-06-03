import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';

class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
  });

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
            'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/7WCNaek6zGlhum99TA63QmVPhox.jpg',
          ),
        ),
      ),
    );
  }
}
