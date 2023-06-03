import 'dart:math';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:neflix_ui/core/colors/colors.dart';
import 'package:neflix_ui/core/constants.dart';
import 'package:neflix_ui/presentation/widgets/app_bar_widget.dart';

class ScreenDownloads extends StatefulWidget {
  const ScreenDownloads({super.key});

  @override
  State<ScreenDownloads> createState() => _ScreenDownloadsState();
}

class _ScreenDownloadsState extends State<ScreenDownloads> {
  final _widgets = [
    _SmartDownloads(),
    Section2(),
    Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          tittle: 'Downloads',
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) => _widgets[index],
        separatorBuilder: (context, index) => SizedBox(
          height: 25,
        ),
        itemCount: _widgets.length,
      ),
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.settings,
          color: KWhiteColor,
        ),
        Text('Smart downloads')
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  DownloadsImageWidget(
      {super.key,
      required this.image,
      this.angle = 0,
      required this.margin,
      required this.size,
      this.borderRadius = 10});

  final double angle;
  final String image;
  final EdgeInsets margin;
  final Size size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          //margin: margin,
          width: size.width,
          height: size.width,
          // color: KBlack,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            image: DecorationImage(
              // fit: BoxFit.cover,
              image: NetworkImage(image),
            ),
          ),
        ),
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final imageList = [
      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/3zunvPLgM9qGFr8ob2BpaKSuAJI.jpg',
      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/42sHptzdrXNzhTcD0ZxYXrQJOBx.jpg',
      'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/lu2DNsIQgn1Jb6djHvrqJSUQXXl.jpg',
    ];
    return Column(
      children: [
        const Text(
          'Introducing Downloads For You',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: KWhiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        KHeight,
        Text(
          "We WIll Download A Personalized Colloction Of\nMovies And Shows For You, There's\n Always Something To Watch On Your\nDevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        KHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: size.width * .34,
                  backgroundColor: Colors.grey.shade600.withOpacity(.5),
                ),
              ),
              DownloadsImageWidget(
                image: imageList[0],
                margin: EdgeInsets.only(left: 170),
                angle: 23,
                size: Size(size.width * .45, size.width * .55),
              ),
              DownloadsImageWidget(
                image: imageList[1],
                margin: EdgeInsets.only(right: 170),
                angle: -23,
                size: Size(size.width * .45, size.width * .55),
              ),
              DownloadsImageWidget(
                image: imageList[2],
                margin: EdgeInsets.only(bottom: 30),
                size: Size(size.width * .5, size.width * .7),
                borderRadius: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: KBUttonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Set up',
                style: TextStyle(
                    color: KWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        KHeight,
        SizedBox(
          width: MediaQuery.of(context).size.width * .8,
          child: MaterialButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: KWhiteColor,
            onPressed: () {},
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'See What You Can Download',
                style: TextStyle(
                    color: KBlack, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
