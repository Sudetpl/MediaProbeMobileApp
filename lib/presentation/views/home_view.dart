import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/base_providers/view_model_provider.dart';
import 'package:media_probe_mobile_app/core/base_view_operations/screen_base_view.dart';
import 'package:media_probe_mobile_app/core/theme/color.dart';
import 'package:media_probe_mobile_app/core/viewmodels/home_page_viewmodel.dart';
import 'package:media_probe_mobile_app/presentation/widgets/article_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBaseWidget(
      appBarWidget: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          AppLocalizations.of(context)?.homeTitle ?? '',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
      body: ViewModelProvider<HomePageViewModel>(
        model: HomePageViewModel(context: context),
        builder: (viewModel) {
          return Selector<HomePageViewModel, bool>(
            selector: (context, viewModel) => viewModel.isLoading,
            builder: (context, isLoading, child) {
              if (isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                itemCount: viewModel.articles.length,
                itemBuilder: (context, index) {
                  if (viewModel.articles.isEmpty) return const SizedBox();
                  return ArticleListWidget(
                    articles: viewModel.articles,
                    index: index,
                    navigateToArticleDetail: viewModel.navigateToArticleDetail,
                    getArticleImage: viewModel.getArticleImage,
                    convertToDDMMYYYY: viewModel.convertToDDMMYYYY,
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
