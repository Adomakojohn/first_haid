import 'package:flutter/material.dart';

import '../pages/article_details page.dart';

class HealthArticle {
  final String title;
  final String content;
  final String description;
  final String imageUrl;
  final String url;
  final String publishedAt;

  HealthArticle({
    required this.title,
    required this.description,
    required this.content,
    required this.imageUrl,
    required this.url,
    required this.publishedAt,
  });
}

class HealthArticleWidget extends StatelessWidget {
  final HealthArticle article;

  const HealthArticleWidget({super.key, required this.article});

  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return '${parsedDate.day} ${parsedDate.month} ${parsedDate.year}';
    } catch (e) {
      return 'Unknown Date';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      //height: 225,
      alignment: Alignment.center,
      width: 290,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 191, 229, 241),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ArticleDetailPage(article: article),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            article.imageUrl.isNotEmpty
                ? ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    child: Image.network(
                      article.imageUrl,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                    ),
                  )
                : Image.asset('assets/images/bcImage.png', height: 100),
            const SizedBox(height: 8),
            Text(
              '${formatDate(article.publishedAt)} || New Release',
              style: TextStyle(color: Colors.grey[700]),
            ),
            const SizedBox(height: 4),
            Text(
              article.title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
