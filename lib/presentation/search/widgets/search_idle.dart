import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/widgets/space.dart';
import 'package:netflix/presentation/widgets/title_widget.dart';

class SearchIdle extends StatelessWidget {
  const SearchIdle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(
          title: 'Top Searches',
        ),
        space(),
        Expanded(
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) => const TopSearchItem(),
            separatorBuilder: (context, index) => space(),
            itemCount: 10,
          ),
        )
      ],
    );
  }
}

class TopSearchItem extends StatelessWidget {
  const TopSearchItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * .4,
          height: 100,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: NetworkImage(
                  'https://assets-prd.ignimgs.com/2022/05/12/stranger-things-4-poster-1652364986162.jpeg'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        space(),
        Expanded(
          child: Text(
            'Movie Name',
            style: GoogleFonts.signikaNegative(fontSize: 18),
          ),
        ),
        const Icon(
          Icons.play_circle_outline,
          color: whiteColor,
          size: 50,
        )
      ],
    );
  }
}
