import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicplayer/cubit/list_music_cubit.dart';
import 'package:musicplayer/cubit/permission_cubit.dart';
import 'package:musicplayer/pages/mini_Player_menu.dart';
import 'package:musicplayer/pages/music_list.dart';
import 'package:musicplayer/pages/permission_request.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final OnAudioQuery audioQuery = OnAudioQuery();

  @override
  void initState() {
    // TODO: implement initState
    context.read<PermissionCubit>().permissionRequest();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
      ),
      body: Column(children: [
        PermissionRequestPage(
          heightScreen: heightScreen,
          widthScreen: widthScreen,
        ),
        MiniPlayerPage(
          heightScreen: heightScreen,
          widthScreen: widthScreen,
        )
      ]),
    );
  }
}
