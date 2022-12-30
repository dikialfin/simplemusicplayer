part of 'player_cubit.dart';

@immutable
abstract class PlayerState {}

class PlayerInitial extends PlayerState {}

class PlayingMusic extends PlayerState {
  String _artist, _songTitle;
  PlayingMusic(this._songTitle, this._artist);

  String get getSongTitle => this._songTitle;
  String get getSongArtist => this._artist;
}
