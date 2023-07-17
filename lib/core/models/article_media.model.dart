import 'package:media_probe_mobile_app/core/models/article_media_meta_data_model.dart';
import 'package:media_probe_mobile_app/core/models/basemodel/base_model.dart';

class Media {
  String type;
  String subtype;
  String caption;
  String copyright;
  int approvedForSyndication;
  List<MediaMetadatum> mediaMetadata;

  Media({
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
    required this.approvedForSyndication,
    required this.mediaMetadata,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        type: BaseModel.stringConverter(json["type"]),
        subtype: BaseModel.stringConverter(json["subtype"]),
        caption: BaseModel.stringConverter(json["caption"]),
        copyright: BaseModel.stringConverter(json["copyright"]),
        approvedForSyndication:
            BaseModel.intConverter(json["approved_for_syndication"]),
        mediaMetadata:
            BaseModel.listConverter(json["media-metadata"], fallbackValue: [])
                .map((e) => MediaMetadatum.fromJson(e))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "subtype": subtype,
        "caption": caption,
        "copyright": copyright,
        "approved_for_syndication": approvedForSyndication,
        "media-metadata":
            List<dynamic>.from(mediaMetadata.map((x) => x.toJson())),
      };
}
