import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'player_state.dart';

class PlayerCubit extends Cubit<PlayerState> {
  final _audiPlayer = AudioPlayer();
  PlayerCubit() : super(PlayerInitial());

  void playSong({required SongModel songData}) async {
    await this._audiPlayer.setUrl(songData.data);
    this._audiPlayer.play();
    emit(PlayingMusic(songData.title, songData.artist ?? 'unknown'));
  }
}
