import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicplayer/cubit/player_cubit.dart';

class MiniPlayerPage extends StatefulWidget {
  final double heightScreen;
  final double widthScreen;
  const MiniPlayerPage(
      {Key? key,
      required double this.heightScreen,
      required double this.widthScreen})
      : super(key: key);

  @override
  State<MiniPlayerPage> createState() => _MiniPlayerPageState(
      heightScreen: this.heightScreen, widthScreen: this.widthScreen);
}

class _MiniPlayerPageState extends State<MiniPlayerPage> {
  final double heightScreen;
  final double widthScreen;
  _MiniPlayerPageState(
      {required double this.heightScreen, required double this.widthScreen});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerState>(
      builder: (context, state) {
        return Container(
          height: heightScreen * 20 / 100,
          width: widthScreen,
          color: Colors.green,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              state is PlayingMusic
                  ? Text(
                      state.getSongTitle,
                      textAlign: TextAlign.center,
                    )
                  : Text('no data', textAlign: TextAlign.center),
              state is PlayingMusic
                  ? Text(state.getSongArtist)
                  : Text('no data', textAlign: TextAlign.center),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.skip_previous_rounded)),
                    IconButton(
                        onPressed: () {},
                        icon: state is PlayingMusic
                            ? Icon(Icons.pause_circle_rounded)
                            : Icon(Icons.play_arrow_rounded)),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.skip_next_rounded))
                  ])
            ],
          ),
        );
      },
    );
  }
}
