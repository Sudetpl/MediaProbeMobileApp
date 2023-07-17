import 'package:media_probe_mobile_app/core/models/basemodel/base_model.dart';

class MediaMetadatum {
    String url;
    String format;
    int height;
    int width;

    MediaMetadatum({
        required this.url,
        required this.format,
        required this.height,
        required this.width,
    });

    factory MediaMetadatum.fromJson(Map<String, dynamic> json) => MediaMetadatum(
        url: BaseModel.stringConverter(json["url"], fallbackValue: ''),
        format: BaseModel.stringConverter(json["format"]),
        height: BaseModel.intConverter(json["height"]),
        width: BaseModel.intConverter(json["width"]),
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "format": format,
        "height": height,
        "width": width,
    };
}