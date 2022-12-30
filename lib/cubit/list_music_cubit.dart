import 'package:bloc/bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:meta/meta.dart';
import 'package:on_audio_query/on_audio_query.dart';

part 'list_music_state.dart';

class ListMusicCubit extends Cubit<ListMusicState> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer _audioPlayer = AudioPlayer();

  ListMusicCubit() : super(ListMusicInitial());

  void getAllSongs() async {
    emit(MusicLoading());
    List<SongModel> listSong =
        await _audioQuery.querySongs(uriType: UriType.EXTERNAL);
    emit(MusicLoadingSuccess(listSong));
  }
}
