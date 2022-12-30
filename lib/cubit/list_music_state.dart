part of 'list_music_cubit.dart';

@immutable
abstract class ListMusicState {}

class ListMusicInitial extends ListMusicState {}

class MusicLoading extends ListMusicState {}

class MusicLoadingSuccess extends ListMusicState {
  List<SongModel> listSong;
  MusicLoadingSuccess(this.listSong);

  List<SongModel> getListSong() => this.listSong;
}
