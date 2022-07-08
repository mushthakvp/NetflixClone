import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/downloads/functions/functions.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';
import 'package:netflix/presentation/widgets/space.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBarWidgets(
            name: 'Downloads',
          ),
        ),
        body: ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            space(he: 4),
            const _SmartDownloads(),
            const SectionTwo(),
            const SectionThree(),
          ],
        ),
      ),
    );
  }
}

class SectionThree extends StatelessWidget {
  const SectionThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            color: blueColor,
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text(
                'Set up',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: whiteColor),
              ),
            ),
          ),
        ),
        space(),
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          color: whiteColor,
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Text(
              'See what you can download',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold, color: blackColor),
            ),
          ),
        ),
      ],
    );
  }
}

class SectionTwo extends StatelessWidget {
  const SectionTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size mediaSize = MediaQuery.of(context).size;
    return Column(
      children: [
        space(he: 20),
        Center(
          child: Text(
            'Introducing Downloads for you',
            style: GoogleFonts.signikaNegative(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Text(
            'Well download a personalized selection of movies and shows for you, so there is always somthing to watch on your device',
            textAlign: TextAlign.center,
            style: GoogleFonts.signikaNegative(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: greyColor,
            ),
          ),
        ),
        SizedBox(
          width: mediaSize.width,
          height: mediaSize.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                backgroundColor: greyColor.withOpacity(.25),
                radius: mediaSize.width * .33,
              ),
              DownloadsImageWidget(
                size: Size(mediaSize.width * .32, mediaSize.width * .44),
                image: Dfunction.instance.images[0],
                angle: 20,
                margin: const EdgeInsets.only(left: 150, top: 20),
              ),
              DownloadsImageWidget(
                size: Size(mediaSize.width * .32, mediaSize.width * .44),
                image: Dfunction.instance.images[1],
                angle: -20,
                margin: const EdgeInsets.only(right: 150, top: 20),
              ),
              DownloadsImageWidget(
                size: Size(mediaSize.width * .36, mediaSize.width * .49),
                image: Dfunction.instance.images[2],
                margin: const EdgeInsets.only(left: 0),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        space(),
        const Icon(
          Icons.settings,
          color: whiteColor,
        ),
        space(wi: 10),
        Text(
          'Smart Downloads',
          style: GoogleFonts.signikaNegative(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  const DownloadsImageWidget(
      {Key? key,
      required this.size,
      required this.image,
      this.angle = 0,
      required this.margin})
      : super(key: key);
  final String image;
  final Size size;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
