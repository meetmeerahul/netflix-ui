import 'package:flutter/material.dart';

import 'package:neflix_ui/domain/fastlaugh/fast_laugh_api.dart';
import 'package:neflix_ui/domain/fastlaugh/fast_laugh_model.dart';
import 'package:neflix_ui/presentation/fastlaugh/widgets/video_list_item.dart';

List<FastLaughListResult> fastLaughList = [];

class ScreenFastLaugh extends StatefulWidget {
  const ScreenFastLaugh({super.key});

  @override
  State<ScreenFastLaugh> createState() => _ScreenFastLaughState();
}

class _ScreenFastLaughState extends State<ScreenFastLaugh> {
  @override
  void initState() {
    super.initState();
    getFastLaugh();
  }

  getFastLaugh() async {
    fastLaughList = await FastLaughApi.getFastLaugh();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: fastLaughList.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              )
            : PageView(
                scrollDirection: Axis.vertical,
                children: List.generate(fastLaughList.length, (index) {
                  return VideoListItem(
                    index: index,
                    posterPath: fastLaughList[index].posterPath!,
                  );
                }),
              ),
      ),
    );
  }
}
