import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/domain/upcoming/upcoming_model.dart';
import 'package:neflix_ui/presentation/home/widgets/custom_button_widget.dart';

import 'package:neflix_ui/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatefulWidget {
  final List<UpcomingMovieResults> upcomingList;
  final int index;

  ComingSoonWidget(
      {super.key, required this.upcomingList, required this.index});

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  get index => widget.index;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    String dateFormat = DateFormat.d()
        .format(DateTime.parse(widget.upcomingList[index].releaseDate!));
    String monthFormat = DateFormat.MMM()
        .format(DateTime.parse(widget.upcomingList[index].releaseDate!));

    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(monthFormat,
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: KGrey)),
              Text(
                dateFormat,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 4),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 460,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(
                backDropPath: widget.upcomingList[index].backdropPath ?? "",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 140,
                    child: Text(
                      widget.upcomingList[index].originalTitle ?? "",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: const [
                      CustomButtonWidget(
                        icon: Icons.notifications,
                        title: 'Remind Me',
                        iconsSize: 20,
                        textSize: 12,
                      ),
                      KWidth,
                      CustomButtonWidget(
                        icon: Icons.info,
                        title: 'Info',
                        iconsSize: 20,
                        textSize: 12,
                      ),
                      KWidth,
                    ],
                  )
                ],
              ),
              KHeight,
              Text(
                widget.upcomingList[index].title ?? "",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              KHeight,
              Text(widget.upcomingList[index].overview ?? "",
                  style: TextStyle(color: KGrey, fontSize: 13)),
            ],
          ),
        ),
      ],
    );
  }
}
