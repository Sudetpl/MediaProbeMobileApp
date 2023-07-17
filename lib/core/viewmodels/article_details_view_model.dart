import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/base_providers/base_viewmodel.dart';
import 'package:media_probe_mobile_app/core/models/article_model.dart';

class ArticleDetailsViewModel extends BaseViewModel {
  ArticleDetailsViewModel({required super.context});

  Articles article = Articles.fromJson({});

  @override
  Future initViewModel() {
    article = ModalRoute.of(context)?.settings.arguments as Articles; 
    return super.initViewModel();
  }

  String convertToDDMMYYYY(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String getArticleImage() {
    if (article.media.isEmpty) return '';
    String url = article.media.first.mediaMetadata.first.url;
    return url;
  }
}
