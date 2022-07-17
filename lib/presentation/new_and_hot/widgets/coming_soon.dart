import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:netflix/application/hot_and_new/hot_and_new_bloc.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/const.dart';
import 'package:netflix/presentation/widgets/space.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) {
        BlocProvider.of<HotAndNewBloc>(context).add(
          const HotAndNewEvent.loadDataInComingSoon(),
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
                : state.comingSoonList.isEmpty
                    ? const Center(
                        child: Text('List Is Empty'),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.comingSoonList.length,
                        itemBuilder: (context, index) {
                          final movie = state.comingSoonList[index];

                          return ComingSoonWidgetDemo(
                            movieName: '${movie.originalTitle}',
                            id: '${movie.id}',
                            month: '${movie.releaseDate}',
                            backDropPath: '${movie.backdropPath}',
                            discription: '${movie.overview}',
                          );
                        });
      },
    );
  }
}

class ComingSoonWidgetDemo extends StatelessWidget {
  final String id;
  final String month;
  final String movieName;
  final String discription;
  final String backDropPath;

  const ComingSoonWidgetDemo({
    Key? key,
    required this.discription,
    required this.id,
    required this.month,
    required this.movieName,
    required this.backDropPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final parseDate = DateTime.tryParse(month);
    final date = DateFormat.MMMMd().format(parseDate!);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              children: [
                Text(
                  date.split(' ').first.substring(0, 3).toUpperCase(),
                  style: const TextStyle(
                    color: greyColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  month.split('-')[1],
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage('$imageUppendUrl$backDropPath'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
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
                  children: [
                    Expanded(
                      child: Text(
                        movieName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 25,
                            letterSpacing: -2,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                    Column(
                      children: [
                        const Icon(Icons.notifications_none_outlined,
                            color: whiteColor),
                        space(he: 5),
                        const Text(
                          'Remind me',
                          style: TextStyle(color: greyColor),
                        ),
                      ],
                    ),
                    space(),
                    Column(
                      children: [
                        const Icon(Icons.info_outline, color: whiteColor),
                        space(he: 5),
                        const Text(
                          'Info',
                          style: TextStyle(color: greyColor),
                        ),
                      ],
                    ),
                    space()
                  ],
                ),
                space(),
                const Text(
                  'Coming on Friday',
                ),
                space(),
                Row(
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
                          bottom: 3,
                          left: 22,
                          child: Text(
                            'FILM',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                space(he: 5),
                FittedBox(
                  child: Text(
                    movieName,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                space(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Text(
                    discription,
                    overflow: TextOverflow.clip,
                    style: const TextStyle(color: greyColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
