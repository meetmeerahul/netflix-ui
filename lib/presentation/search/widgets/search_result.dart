import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/domain/search_results/search_model.dart';
import 'package:neflix_ui/presentation/search/widgets/title.dart';

const imageUrl =
    'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/42sHptzdrXNzhTcD0ZxYXrQJOBx.jpg';

class SearchResultWidget extends StatefulWidget {
  final List<SearchResults> searchResults;
  SearchResultWidget({super.key, required this.searchResults});

  @override
  State<SearchResultWidget> createState() => _SearchResultWidgetState();
}

class _SearchResultWidgetState extends State<SearchResultWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: 'Movies & TV'),
        KHeight,
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.4,
            children: List.generate(widget.searchResults.length, (index) {
              return MainCard(
                posterPath: widget.searchResults[index].posterPath ?? "",
              );
            }),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatefulWidget {
  final String posterPath;

  const MainCard({super.key, required this.posterPath});

  @override
  State<MainCard> createState() => _MainCardState();
}

class _MainCardState extends State<MainCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/w500${widget.posterPath}'),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
