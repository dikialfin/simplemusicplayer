import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:musicplayer/cubit/permission_cubit.dart';
import 'package:musicplayer/pages/homepage.dart';

import '../cubit/list_music_cubit.dart';
import 'music_list.dart';

class PermissionRequestPage extends StatefulWidget {
  final heightScreen;
  final widthScreen;

  const PermissionRequestPage(
      {Key? key,
      required double this.heightScreen,
      required double this.widthScreen})
      : super(key: key);

  @override
  State<PermissionRequestPage> createState() =>
      _PermissionRequestPageState(this.heightScreen, this.widthScreen);
}

class _PermissionRequestPageState extends State<PermissionRequestPage> {
  final heightScreen;
  final widthScreen;
  _PermissionRequestPageState(this.heightScreen, this.widthScreen);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PermissionCubit, bool>(
      builder: (context, state) {
        if (state == false) {
          return Container(
            height: heightScreen * 68.24 / 100,
            width: widthScreen,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  Text('Tunggu izin Bro')
                ]),
          );
        } else {
          return MusicListPage(
            heightScreen: heightScreen,
            widthScreen: widthScreen,
          );
        }
      },
    );
  }
}
