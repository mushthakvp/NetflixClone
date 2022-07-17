import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/infrastructure/downloads/downloads_impl.dart';

class MainBackgroundImage extends StatelessWidget {
  const MainBackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: DownloadsRepository.downloadNotifier,
          builder: (context, List<Downloads> newValue, _) {
            return Container(
              width: double.infinity,
              height: 600,
              decoration:
                  boxDecorationNetWorkImage(image: '$imageUppendUrl/ox4goZd956BxqJH6iLwhWPL9ct4.jpg'),
            );
          },
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const IconTextWidget(
                icon: Icons.add,
                text: 'My List',
              ),
              TextButton.icon(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(whiteColor),
                ),
                onPressed: () {},
                icon: const Icon(
                  Icons.play_arrow,
                  color: blackColor,
                  size: 25,
                ),
                label: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Play',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const IconTextWidget(
                icon: Icons.info_outline,
                text: 'Info',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  const IconTextWidget({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
          color: whiteColor,
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
