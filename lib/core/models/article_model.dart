import 'dart:convert';

import 'package:media_probe_mobile_app/core/models/article_media.model.dart';
import 'package:media_probe_mobile_app/core/models/basemodel/base_model.dart';

Articles articlesFromJson(String str) => Articles.fromJson(json.decode(str));

class Articles {
  String uri;
  String url;
  int id;
  int assetId;
  String source;
  DateTime publishedDate;
  DateTime updated;
  String section;
  String subsection;
  String nytdsection;
  String adxKeywords;
  dynamic column;
  String byline;
  String type;
  String title;
  String articlesAbstract;
  List<String> desFacet;
  List<String> orgFacet;
  List<String> perFacet;
  List<dynamic> geoFacet;
  List<Media> media;
  int etaId;

  Articles({
    required this.uri,
    required this.url,
    required this.id,
    required this.assetId,
    required this.source,
    required this.publishedDate,
    required this.updated,
    required this.section,
    required this.subsection,
    required this.nytdsection,
    required this.adxKeywords,
    this.column,
    required this.byline,
    required this.type,
    required this.title,
    required this.articlesAbstract,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.media,
    required this.etaId,
  });

  factory Articles.fromJson(Map<String, dynamic> json) => Articles(
        uri: BaseModel.stringConverter(json["uri"]),
        url: BaseModel.stringConverter(json["url"]),
        id: BaseModel.intConverter(json["id"]),
        assetId: BaseModel.intConverter(json["asset_id"]),
        source: BaseModel.stringConverter(json["source"]),
        publishedDate: BaseModel.dateConverter(json["published_date"]),
        updated: BaseModel.dateConverter(json["updated"]),
        section: BaseModel.stringConverter(json["section"]),
        subsection: BaseModel.stringConverter(json["subsection"]),
        nytdsection: BaseModel.stringConverter(json["nytdsection"]),
        adxKeywords: BaseModel.stringConverter(json["adx_keywords"]),
        column: json["column"],
        byline: BaseModel.stringConverter(json["byline"]),
        type: BaseModel.stringConverter(json["type"]),
        title: BaseModel.stringConverter(json["title"]),
        articlesAbstract: BaseModel.stringConverter(json["abstract"]),
        desFacet: BaseModel.listConverter(json["des_facet"])
            .map((e) => e.toString())
            .toList(),
        orgFacet: BaseModel.listConverter(json["org_facet"])
            .map((e) => e.toString())
            .toList(),
        perFacet: BaseModel.listConverter(json["per_facet"])
            .map((e) => e.toString())
            .toList(),
        geoFacet:
            BaseModel.listConverter(json["geo_facet"]).map((e) => e).toList(),
        media: BaseModel.listConverter(json["media"], fallbackValue: [])
            .map((e) => Media.fromJson(e))
            .toList(),
        etaId: BaseModel.intConverter(json["eta_id"]),
      );
}
