import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/domain/downloads/models/downloads.dart';
import 'package:netflix/infrastructure/home/home_impl.dart';
import 'package:netflix/presentation/widgets/space.dart';
import 'package:netflix/presentation/widgets/title_widget.dart';

class NumberContentCards extends StatelessWidget {
  final String title;
  const NumberContentCards({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleWidget(
            title: title,
            fsize: 24,
          ),
          LimitedBox(
            maxHeight: 200,
            child: ValueListenableBuilder(
              valueListenable: HomeImpliment.downloadNotifier,
              builder: (context, List<Downloads> newValue, _) {
                return ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: newValue.length > 10 ? 10 : newValue.length,
                    itemBuilder: (context, index) {
                      final data = newValue[index];
                      return NumberCard(
                        data: data,
                        index: index,
                      );
                    });
              },
            ),
          ),
        ],
      ),
    );
  }
}



class NumberCard extends StatelessWidget {
  final int index;
  final Downloads data;
  const NumberCard({Key? key, required this.index, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, top: 8, bottom: 8),
      child: Stack(
        children: [
          Row(
            children: [
              space(wi: 30),
              Container(
                width: 130,
                height: 200,
                decoration: boxDecorationNetWorkImage(
                  rd: 10,
                  image: '$imageUppendUrl${data.posterPath!}',
                ),
              ),
            ],
          ),
          Positioned(
            bottom: -10,
            left: 10,
            child: BorderedText(
                strokeColor: whiteColor,
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: blackColor,
                    fontSize: 100,
                    decoration: TextDecoration.none,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
