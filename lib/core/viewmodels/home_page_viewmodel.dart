import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/base_providers/base_viewmodel.dart';
import 'package:media_probe_mobile_app/core/models/article_model.dart';
import 'package:media_probe_mobile_app/core/service/article_service.dart';
import 'package:media_probe_mobile_app/utils/config/config.dart';
import 'package:media_probe_mobile_app/utils/routes/route_names.dart';

class HomePageViewModel extends BaseViewModel {
  HomePageViewModel({required super.context});

  final ArticleService _articleService = ArticleService();

  List<Articles> articles = [];

  @override
  Future initViewModel() async {
    isLoading = true;
    articles = await _articleService.fetchArticles(
      apiKey: Config.apiKey,
      period: Config.articleFetchPeriodsEnum.value,
    );
    articles.sort((a, b) => b.publishedDate.compareTo(a.publishedDate));
    isLoading = false;
    triggerNotify();
    return super.initViewModel();
  }

  navigateToArticleDetail(int index) {
    Navigator.of(context)
        .pushNamed(RouteNames.articleDetail, arguments: articles[index]);
  }

  String getArticleImage(int index) {
    if (articles[index].media.isEmpty) return '';
    // viewModel.articles[index].media[0].mediaMetadata[0].url

    return articles[index].media.first.mediaMetadata.first.url;
  }

  String convertToDDMMYYYY(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
