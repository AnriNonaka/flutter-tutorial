import 'package:freezed_annotation/freezed_annotation.dart';
import '../model/youtube_item.dart';
part 'youtube_client_state.freezed.dart';


@freezed
class YoutubeClientState with _$YoutubeClientState {
  const factory YoutubeClientState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default(<YoutubeItem>[]) List<YoutubeItem> youtubeItems,
  }) = _YoutubeClientState;
}