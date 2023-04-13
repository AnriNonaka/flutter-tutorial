import 'package:freezed_annotation/freezed_annotation.dart';

import '../model/merukari_item.dart';

part 'merukari_client_state.freezed.dart';

@freezed
class MerukariClientState with _$MerukariClientState {
  const factory MerukariClientState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    @Default(<MerukariItem>[]) List<MerukariItem> merukariItems,
  }) = _MerukariClientState;
}
