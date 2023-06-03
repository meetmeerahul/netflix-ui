import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neflix_ui/core/constants.dart';

import 'package:neflix_ui/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
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
              ),
              KHeight,
              //Expanded(child: const SearchIdleWidget()),
              Expanded(child: const SearchResultWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
