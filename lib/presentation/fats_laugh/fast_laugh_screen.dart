import 'package:flutter/material.dart';
import 'package:netflix/presentation/fats_laugh/widgets/video_list_item.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: List.generate(10, (index) => VideoListItem(index: index)),
    );
  }
}
