import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';

const image =
    'https://m.media-amazon.com/images/M/MV5BYjJhYmM3MWQtMWM3NC00MWQyLTliZWItNDI3NGYwZTU0MDAyXkEyXkFqcGdeQXVyMjkxNzQ1NDI@._V1_.jpg';

class MainCardItems extends StatelessWidget {
  const MainCardItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
      width: 130,
      height: 200,
      decoration: boxDecorationImage(
        rd: 10,
        image: image,
      ),
    );
  }
}
