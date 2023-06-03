import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w533_and_h300_bestv2/i1eghEBiC0gN4KnwuUGC2fNiX1f.jpg';

class SearchIdleWidget extends StatefulWidget {
  const SearchIdleWidget({super.key});

  @override
  State<SearchIdleWidget> createState() => _SearchIdleWidgetState();
}

class _SearchIdleWidgetState extends State<SearchIdleWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTextTitle(
            title: 'Top Searches',
          ),
          KHeight,
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => const TopSearchItemTile(),
              separatorBuilder: (context, index) => KHeight20,
              itemCount: 15,
            ),
          )
        ],
      ),
    );
  }
}

class TopSearchItemTile extends StatefulWidget {
  const TopSearchItemTile({super.key});

  @override
  State<TopSearchItemTile> createState() => _TopSearchItemTileState();
}

class _TopSearchItemTileState extends State<TopSearchItemTile> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 60,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        Expanded(
          child: Text(
            'Movie Name',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: KWhiteColor, fontSize: 16),
          ),
        ),
        CircleAvatar(
          backgroundColor: KWhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: KWhiteColor,
            ),
          ),
        )
      ],
    );
  }
}
