import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/domain/top_search/top_search_api.dart';
import 'package:neflix_ui/domain/top_search/top_search_model.dart';
import 'package:neflix_ui/presentation/search/widgets/search_idle.dart';

import 'package:neflix_ui/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<TopSearchResults> topSearchResults = [];
  //List<ResultsSearch> searchList = [];

  TextEditingController searchController = TextEditingController();

  bool isSearchidle = true;

  @override
  void initState() {
    super.initState();
    getTopSearch();
    _getSearch();
    searchController.addListener(onSearchTextControlled);
  }

  Future<void> getTopSearch() async {
    topSearchResults = await TopSearchApi.getTopSearch();
    //print(topSearchResults);
    setState(() {});
  }

  _getSearch() async {
    //  searchList = await ApihandlerForSearch.fetchSearchMovies(
    //    searchController.text.trim());
    setState(() {});
  }

  void onSearchTextControlled() {
    _getSearch();

    setState(() {
      isSearchidle = searchController.text.isEmpty;
      print(isSearchidle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
                onChanged: (value) => _onChnageEvent(),
              ),
              KHeight,
              Expanded(
                child: isSearchidle
                    ? SearchIdleWidget(
                        topSearchResults: topSearchResults,
                      )
                    : SearchResultWidget(
                        // searchResultFrom: searchList,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onChnageEvent() {
    Expanded(child: const SearchResultWidget());
  }
}
