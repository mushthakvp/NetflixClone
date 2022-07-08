import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentation/widgets/space.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const VideoMainWidget(),
    );
  }
}

class VideoMainWidget extends StatelessWidget {
  const VideoMainWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VideoCardContent(),
        space(),
        Stack(
          children: [
            Container(
                height: 200,
                decoration: boxDecorationImage(
                    image: 'https://images6.alphacoders.com/119/1191374.jpg')),
            Positioned(
              bottom: 10,
              right: 10,
              child: CircleAvatar(
                backgroundColor: blackColor.withOpacity(.5),
                radius: 20,
                child: const Icon(
                  Icons.volume_down,
                  color: whiteColor,
                ),
              ),
            ),
          ],
        ),
        space(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                const SizedBox(
                  width: 150,
                ),
                Image.asset(
                  'assets/images/logo.png',
                  width: 35,
                  height: 35,
                ),
                const Positioned(
                  bottom: 5,
                  left: 22,
                  child: Text(
                    'SERIES',
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                )
              ],
            ),
            const Spacer(),
            const IconTextButton(icon: Icons.ios_share, text: 'Share'),
            space(),
            const IconTextButton(icon: Icons.add, text: 'My List'),
            space(),
            const IconTextButton(icon: Icons.play_arrow, text: 'Play'),
            space(),
          ],
        )
      ],
    );
  }
}

class IconTextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  const IconTextButton({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: whiteColor),
        space(he: 5),
        Text(text),
      ],
    );
  }
}

class VideoCardContent extends StatelessWidget {
  const VideoCardContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Squid Game',
            style: GoogleFonts.signikaNegative(
                fontSize: 20, fontWeight: FontWeight.bold),
          ),
          space(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              "This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work life and love in 1990's Manhattan",
              style: GoogleFonts.signikaNegative(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
