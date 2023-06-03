import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/presentation/home/widgets/custom_button_widget.dart';

import 'package:neflix_ui/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('FEB',
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold, color: KGrey)),
              Text(
                '11',
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
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              VideoWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'TALL GIRL 2',
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -5),
                  ),
                  Spacer(),
                  Row(
                    children: [
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
              Text("Coming on friday"),
              KHeight,
              Text(
                "Tall Girl 2",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              KHeight,
              Text(
                  "The school is putting on the stage play . Steve Zahn, who plays father Richie Kreyman, met his wife Robyn Peterman while they were performing in a national tour of  in 1991.",
                  style: TextStyle(color: KGrey))
            ],
          ),
        ),
      ],
    );
  }
}
