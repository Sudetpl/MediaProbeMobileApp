import 'package:flutter/material.dart';
import 'package:media_probe_mobile_app/core/models/article_model.dart';
import 'package:media_probe_mobile_app/core/theme/color.dart';

class ArticleDetailWidget extends StatelessWidget {
  final Articles article;
  final String Function(DateTime) convertToDDMMYYYY;

  const ArticleDetailWidget({
    required this.article,
    required this.convertToDDMMYYYY,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          article.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(   
          ), 
        ),
        const SizedBox(height: 8),
        Text(
          convertToDDMMYYYY(article.publishedDate),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.textColor,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          article.articlesAbstract,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w400,
          ),  
        ),
      ],
    );
  }
}
