// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import '/mvvm/model/qiita_user.dart';

part 'qiita_item.freezed.dart';

part 'qiita_item.g.dart';

@freezed
class QiitaItem with _$QiitaItem {
  const factory QiitaItem({
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'user') QiitaUser? user,
  }) = _QiitaItem;

  factory QiitaItem.fromJson(Map<String, dynamic> json) =>
      _$QiitaItemFromJson(json);
}
