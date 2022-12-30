import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:on_audio_query/on_audio_query.dart';

class PermissionCubit extends Cubit<bool> {
  PermissionCubit() : super(false);
  OnAudioQuery _onAudioQuery = OnAudioQuery();

  void permissionRequest() async {
    bool permissionStatus = await OnAudioQuery().permissionsStatus();

    if (permissionStatus == false) {
      await _onAudioQuery.permissionsRequest();
    } else {
      emit(true);
    }

    emit(true);
  }
}
