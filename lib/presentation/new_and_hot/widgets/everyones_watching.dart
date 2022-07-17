import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/domain/hot_and_new/model/hot_and_new_resp.dart';
import 'package:netflix/presentation/widgets/space.dart';

class EveryonesWatching extends StatelessWidget {
  const EveryonesWatching({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context).add(
          const HotAndNewEvent.loadDataInEveryoneWatching(),
        );
      },
    );
    return BlocBuilder<HotAndNewBloc, HotAndNewState>(
      builder: (context, state) {
        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: whiteColor,
                ),
              )
            : state.isError
                ? const Center(
                    child: Text('Error Occured'),
                  )
                : state.everyoneWatchingList.isEmpty
                    ? const Center(
                        child: Text('List Is Empty'),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.everyoneWatchingList.length,
                        itemBuilder: (context, index) {
                          final data = state.everyoneWatchingList[index];
                          return VideoMainWidget(data: data);
                        },
                      );
      },
    );
  }
}

class VideoMainWidget extends StatelessWidget {
  final HotAndNewData data;
  const VideoMainWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoCardContent(data: data),
        space(),
        Stack(
          children: [
           data.backdropPath.toString().endsWith('.jpg') ? Container(
              height: 200,
              decoration: boxDecorationNetWorkImage(
                image: '$imageUppendUrl${data.backdropPath}',
              ),
            ): Lottie.asset('assets/images/nodata.json'),
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
  final HotAndNewData data;
  const VideoCardContent({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.originalName.toString(),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          space(),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              data.overview.toString(),
              style: const TextStyle(fontSize: 16,color: greyColor),
            ),
          ),
        ],
      ),
    );
  }
}
