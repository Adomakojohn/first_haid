import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/health_article_widget.dart'; // Assuming this file contains the HealthArticle model

class ArticleDetailPage extends StatefulWidget {
  final HealthArticle article;

  const ArticleDetailPage({Key? key, required this.article}) : super(key: key);

  @override
  State<ArticleDetailPage> createState() => _ArticleDetailPageState();
}

class _ArticleDetailPageState extends State<ArticleDetailPage> {
  @override
  Widget build(BuildContext context) {
    String content = widget.article.description.isNotEmpty
        ? widget.article.description
        : 'No content available for this article.';

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image of the article
              widget.article.imageUrl.isNotEmpty
                  ? Image.network(widget.article.imageUrl)
                  : Image.asset('assets/images/bcImage.png'),
              const SizedBox(height: 12),
              // Title of the article
              Text(
                widget.article.title,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              // Published date
              Text(
                'Published on: ${formatDate(widget.article.publishedAt)}',
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 12),
              // Description content (truncated part)
              Text(
                content,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
                overflow:
                    TextOverflow.ellipsis, // Handle overflow for long text
                maxLines: 5, // Limit the number of lines shown
              ),
              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  final Uri url = Uri.parse(widget.article.url);
                  if (!await canLaunchUrl(url)) {
                    await launchUrl(
                      url,
                      mode: LaunchMode.inAppBrowserView,
                    );
                  } else {
                    print('Could not launch the URL');
                  }
                },
                child: const Text('Read full article Here'),
              )
            ],
          ),
        ),
      ),
    );
  }

  String formatDate(String date) {
    try {
      final parsedDate = DateTime.parse(date);
      return '${parsedDate.day}-${parsedDate.month}-${parsedDate.year}';
    } catch (e) {
      return 'Unknown Date';
    }
  }
}
