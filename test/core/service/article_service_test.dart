import 'package:flutter_test/flutter_test.dart';
import 'package:media_probe_mobile_app/core/models/basemodel/base_model.dart';
import 'package:media_probe_mobile_app/core/service/article_service.dart';

void main() {
  test('When it lists articles, is the top article with the most recent date and the bottom article with the oldest date?', () async {
    // ARRANGE
    final service = ArticleService();
    const apiKey = 'NFBrfCno8QGGhlF5hHrspmYrZhRIIgh7';
    const period = 7; 

    // ACT
    final articles = await service.fetchArticles(apiKey: apiKey, period: period);

    // ASSERT
    expect(articles, isNotEmpty);
    expect(
      articles.first.publishedDate.isAfter(articles.last.publishedDate),
      isTrue,
    );
  });

  test('Are the publication dates of the articles formatted correctly as day month year?', () async {
    // ARRANGE
    final service = ArticleService();
    const apiKey = 'NFBrfCno8QGGhlF5hHrspmYrZhRIIgh7';
    const period = 7; 

    // ACT
    final articles = await service.fetchArticles(apiKey: apiKey, period: period);

    // ASSERT
    expect(articles, isNotEmpty);
    for (final article in articles) {
      final dateRegex = RegExp(r'^\d{2} \w+ \d{4}$');
      final formattedDate = convertToDDMMYYYY(article.publishedDate);
      expect(dateRegex.hasMatch(formattedDate), isTrue);
    }
  });
}

String convertToDDMMYYYY(DateTime date) {
  final formattedDate = BaseModel.dateConverter(date);
  final day = formattedDate.day.toString().padLeft(2, '0');
  final month = _getMonthName(formattedDate.month);
  final year = formattedDate.year.toString();
  return '$day $month $year';
}

String _getMonthName(int month) {
  switch (month) {
    case 1:
      return 'January';
    case 2:
      return 'February';
    case 3:
      return 'March';
    case 4:
      return 'April';
    case 5:
      return 'May';
    case 6:
      return 'June';
    case 7:
      return 'July';
    case 8:
      return 'August';
    case 9:
      return 'September';
    case 10:
      return 'October';
    case 11:
      return 'November';
    case 12:
      return 'December';
    default:
      return '';
  }
}
