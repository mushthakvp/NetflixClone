import 'package:flutter/material.dart';
import 'package:netflix/presentation/search/functions/functions.dart';
import 'package:netflix/presentation/widgets/space.dart';
import 'package:netflix/presentation/widgets/title_widget.dart';

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TitleWidget(title: 'Movies & Tv'),
        space(),
        Expanded(
          child: GridView.count(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 5,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.5,
            children: List.generate(30, (index) => const MainCard()),
          ),
        )
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage(Sfunction.instance.image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
