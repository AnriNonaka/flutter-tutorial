// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_YoutubeItem _$$_YoutubeItemFromJson(Map<String, dynamic> json) =>
    _$_YoutubeItem(
      imagePath: json['imagePath'] as String?,
      iconPath: json['iconPath'] as String?,
      title: json['title'] as String?,
      channelName: json['channelName'] as String?,
      numOfViews: json['numOfViews'] as int?,
      daysAgo: json['daysAgo'] as int?,
    );

Map<String, dynamic> _$$_YoutubeItemToJson(_$_YoutubeItem instance) =>
    <String, dynamic>{
      'imagePath': instance.imagePath,
      'iconPath': instance.iconPath,
      'title': instance.title,
      'channelName': instance.channelName,
      'numOfViews': instance.numOfViews,
      'daysAgo': instance.daysAgo,
    };
