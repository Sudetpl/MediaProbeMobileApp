import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/models/article_model.dart';
import 'package:media_probe_mobile_app/core/theme/color.dart';

class ArticleListWidget extends StatelessWidget {
  final List<Articles> articles;
  final int index;
  final Function(int) navigateToArticleDetail;
  final String Function(int) getArticleImage;
  final String Function(DateTime) convertToDDMMYYYY;

  const ArticleListWidget({
    Key? key,
    required this.articles,
    required this.index,
    required this.navigateToArticleDetail,
    required this.getArticleImage,
    required this.convertToDDMMYYYY,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        navigateToArticleDetail(index);
      },
      leading: SizedBox(
        width: 75,
        height: 75,
        child: Image.network(
          getArticleImage(index),
          errorBuilder: (context, error, stackTrace) {
            return const Center(child: Icon(Icons.error));
          },
          fit: BoxFit.contain,
        ),
      ),
      title: Text(
        articles[index].title,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          ), 
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            articles[index].byline,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.textColor
          ), 
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.calendar_today, size: 12),
              const SizedBox(width: 4),
              Text(
                convertToDDMMYYYY(articles[index].publishedDate),
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
          ), 
              ),
            ],
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
    );
  }
}
