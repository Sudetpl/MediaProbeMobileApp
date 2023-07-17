import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/base_providers/view_model_provider.dart';
import 'package:media_probe_mobile_app/core/base_view_operations/screen_base_view.dart';
import 'package:media_probe_mobile_app/core/viewmodels/article_details_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:media_probe_mobile_app/presentation/widgets/article_detail_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenBaseWidget(
      appBarWidget: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(AppLocalizations.of(context)?.articleTitle ?? '',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.white
          ),
        ),
      ),
      body: ViewModelProvider<ArticleDetailsViewModel>(
          model: ArticleDetailsViewModel(context: context),
          builder: (viewModel) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    width: MediaQuery.sizeOf(context).width,
                    child: Image.network(
                      viewModel.getArticleImage(),
                      height: MediaQuery.sizeOf(context).height * 0.4,
                      width: MediaQuery.sizeOf(context).width,
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorBuilder: (context, error, stackTrace) {
                        return const Center(child: Icon(Icons.error));
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ArticleDetailWidget(
                      article: viewModel.article,
                      convertToDDMMYYYY: viewModel.convertToDDMMYYYY,
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
