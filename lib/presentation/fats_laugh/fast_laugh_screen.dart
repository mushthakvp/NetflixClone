import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix/application/fast_laugh/fast_laugh_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/presentation/fats_laugh/widgets/video_list_item.dart';

class FastLaugh extends StatelessWidget {
  const FastLaugh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      BlocProvider.of<FastLaughBloc>(context).add(const Initialize());
    });
    return BlocBuilder<FastLaughBloc, FastLaughState>(
      builder: (context, state) {
        return state.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: whiteColor,
                ),
              )
            : state.isError
                ? const Center(
                    child: Text('Check your internet Connection'),
                  )
                : state.videoList.isEmpty
                    ? const Center(
                        child: Text('Videos empty'),
                      )
                    : PageView(
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        children: List.generate(
                          state.videoList.length,
                          (index) {
                            return VideoListItemInheritedWidget(
                              widget: VideoListItem(
                                key: Key(index.toString()),
                                index: index,
                              ),
                              movieData: state.videoList[index],
                            );
                          },
                        ),
                      );
      },
    );
  }
}
