import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicplayer/cubit/list_music_cubit.dart';
import 'package:musicplayer/cubit/player_cubit.dart';

class MusicListPage extends StatefulWidget {
  final double heightScreen;
  final double widthScreen;
  const MusicListPage(
      {Key? key,
      required double this.heightScreen,
      required double this.widthScreen})
      : super(key: key);

  @override
  State<MusicListPage> createState() => _MusicListPageState(
      heightScreen: this.heightScreen, widthScreen: this.widthScreen);
}

class _MusicListPageState extends State<MusicListPage> {
  final double heightScreen;
  final double widthScreen;
  _MusicListPageState(
      {required double this.heightScreen, required double this.widthScreen});

  @override
  void initState() {
    // TODO: implement initState
    context.read<ListMusicCubit>().getAllSongs();
    super.initState();
  }

  Widget listViewMusic({required List listMusic}) {
    return ListView.builder(
        itemCount: listMusic.length,
        itemBuilder: (context, index) => ListTile(
              leading: IconButton(
                  onPressed: () async {
                    context
                        .read<PlayerCubit>()
                        .playSong(songData: listMusic[index]);
                  },
                  icon: Icon(Icons.play_arrow)),
              title: Text("${listMusic[index].title}"),
              subtitle: Text("${listMusic[index].artist}"),
            ));
  }

  Widget hasNoMusicList() {
    return Container(
      height: heightScreen * 68.24 / 100,
      width: widthScreen,
      child: Center(
        child: Text('Kosong'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListMusicCubit, ListMusicState>(
      builder: (context, state) {
        List listMusic = [];

        if (state is MusicLoading) {
          return Container(
            height: heightScreen * 68.24 / 100,
            width: widthScreen,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text('Lagi ngambil lagu nya gan')
                ]),
          );
        }

        if (state is MusicLoadingSuccess) {
          listMusic = state.getListSong();
        }

        return Container(
          height: heightScreen * 68.24 / 100,
          width: widthScreen,
          child: listMusic.length < 1
              ? hasNoMusicList()
              : listViewMusic(listMusic: listMusic),
        );
      },
    );
  }
}
