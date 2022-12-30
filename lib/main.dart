import 'package:flutter/material.dart';
import 'package:musicplayer/cubit/list_music_cubit.dart';
import 'package:musicplayer/cubit/permission_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicplayer/cubit/player_cubit.dart';
import 'package:musicplayer/pages/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListMusicCubit>(
          create: (context) => ListMusicCubit(),
        ),
        BlocProvider<PermissionCubit>(
          create: (context) => PermissionCubit(),
        ),
        BlocProvider<PlayerCubit>(
          create: (context) => PlayerCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Music Player',
        home: const HomePage(),
      ),
    );
  }
}
