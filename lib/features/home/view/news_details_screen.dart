import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/constants/time_formate.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/widgets/social_button.dart';
import '../../auth/view/header.dart';

class NewsDetailScreen extends StatelessWidget {
  final article;

  const NewsDetailScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header
              const Header(),
              Expanded(
                child: SingleChildScrollView(

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      //time
                      Padding(
                        padding: const EdgeInsets.only(left: 20,bottom: 16),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Center(
                                child: Text(
                                  'BBC',
                                  style:
                                      AppStyles.styleRegular14(context).copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.source.name,
                                  style:
                                      AppStyles.styleSemiBold16(context).copyWith(color: Colors.black)
                                ),
                                Text(
                                  formatTime(article.publishedAt),
                                  style:
                                      AppStyles.styleRegular14(context)

                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // image
                      if (article.urlToImage != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            article.urlToImage!,
                            width: double.infinity,
                            height: 220,
                            fit: BoxFit.cover,
                          ),
                        )
                      else
                        Container(
                          width: double.infinity,
                          height: 220,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                            size: 48,
                          ),
                        ),

                      const SizedBox(height: 16),
                      Text(
                        article.source.name,
                        style: AppStyles.styleRegular14(context)
                      ),

                      const SizedBox(height: 4),

                      // titel
                      Text(
                        article.title,
                        style: AppStyles.styleRegular24(context)
                      ),
                      const SizedBox(height: 16),

                      if (article.description != null)
                        Text(
                          article.description,
                          style: AppStyles.styleRegular16(context)

                        ),
                      const SizedBox(height: 16),

                      if (article.content != null)
                        Text(
                          article.content,
                          style: AppStyles.styleRegular16(context)
                        ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: SocialButton(
                  text:  'Open Article',
                  backgroundColor: Colors.blue,
                  textColor:Colors.white,
                  onPressed: () async {
                    final Uri url = Uri.parse(article.url);
                    try {
                      await launchUrl(url, mode: LaunchMode.externalApplication);
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Could not open the article.')),
                      );
                    }
                  },

                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

