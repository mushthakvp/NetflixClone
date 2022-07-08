import 'package:flutter/cupertino.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/search/widgets/search_idle.dart';
import 'package:netflix/presentation/widgets/space.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            space(),
            const SearchButton(),
            space(),
            const Expanded(
              //child: SearchResultWidget(),
              child: SearchIdle(),
            )
          ],
        ),
      ),
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      backgroundColor: greyColor.withOpacity(.16),
      suffixIcon: const Icon(
        CupertinoIcons.xmark_circle_fill,
        color: greyColor,
      ),
      prefixIcon: const Icon(
        CupertinoIcons.search,
        color: greyColor,
      ),
      style: const TextStyle(
        color: whiteColor,
      ),
    );
  }
}
