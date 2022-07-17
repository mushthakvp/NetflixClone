import 'package:flutter/material.dart';
import 'package:netflix/core/const.dart';

const image = 'assets/images/stranger.jpeg';

class MainCardItems extends StatelessWidget {
  final String image;
  const MainCardItems({
    
    Key? key,required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
      width: 130,
      height: 200,
      decoration: boxDecorationNetWorkImage(
        rd: 10,
        image: image,
      ),
    );
  }
}
