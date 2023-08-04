import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/domain/search_results/search_model.dart';
import 'package:neflix_ui/domain/search_results/search_results_api.dart';
import 'package:neflix_ui/domain/top_search/top_search_api.dart';
import 'package:neflix_ui/domain/top_search/top_search_model.dart';
import 'package:neflix_ui/presentation/search/widgets/search_idle.dart';

import 'package:neflix_ui/presentation/search/widgets/search_result.dart';
import 'dart:async';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  List<TopSearchResults> topSearchResults = [];
  List<SearchResults> searchResults = [];

  Timer? _debounce;

  TextEditingController searchController = TextEditingController();

  bool isSearchidle = true;

  @override
  void initState() {
    super.initState();
    getTopSearch();

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 50000), () {
      searchController.addListener(onSearchTextControlled);
    });
  }

  Future<void> getTopSearch() async {
    topSearchResults = await TopSearchApi.getTopSearch();

    setState(() {});
  }

  getSearch() async {
    //print(searchController.text.trim());
    searchResults = await SearchApi.getSearch(searchController.text.trim());
    print(searchResults);
    setState(() {});
  }

  void onSearchTextControlled() {
    getSearch();
    setState(() {
      isSearchidle = searchController.text.isEmpty;
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
                controller: searchController,
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
              ),
              KHeight,
              Expanded(
                child: topSearchResults.isEmpty
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      )
                    : (isSearchidle
                        ? SearchIdleWidget(
                            topSearchResults: topSearchResults,
                          )
                        : SearchResultWidget(
                            searchResults: searchResults,
                          )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
