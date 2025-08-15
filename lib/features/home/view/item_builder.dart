import 'package:flutter/material.dart';
import '../../../core/utils/app_styles.dart';
import 'news_details_screen.dart';
import '../../../core/constants/time_formate.dart';
class ItemBuilder extends StatelessWidget {
  final article;
  const ItemBuilder({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(
            context,
            MaterialPageRoute(
            builder: (context) => NewsDetailScreen(article: article),
        ),);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          height: 96,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:article.urlToImage != null
                    ? Image.network(
                  article.urlToImage!,
                  height: 96,
                  width: 96,
                  fit: BoxFit.cover,
                ) :  Container(
                  height: 96,
                  width: 96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        article.source.name,
                        style: AppStyles.styleRegular14(context)
                    ),
                    const SizedBox(height: 4),
                    Text(
                      article.title,
                      style: AppStyles.styleRegular16(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Container(
                          constraints: const BoxConstraints(
                            maxWidth: 100,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          child: Text(
                            article.source.name,
                            style: AppStyles.styleRegular14(context).copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(width: 8),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 4),
                        Text(
                          formatTime(article.publishedAt),
                          style: AppStyles.styleRegular14(context).copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.more_horiz,
                          size: 20,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

