import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/app_cubit.dart';
import '../../../core/cubit/app_status.dart';
import 'category.dart';
import 'fixed_data.dart';
import 'item_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // logo + latest word
              const FixedData(),
              const Category(),
              const SizedBox(height: 16),
              Expanded(
                child: BlocBuilder<AppCubit, AppState>(
                  builder: (context, state) {
                    if (state is NewsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is NewsLoaded) {
                      // تم إضافة Pull-to-Refresh هنا
                      return RefreshIndicator(
                        onRefresh: () async {
                          // allow user to refresh and get data again
                          await context.read<AppCubit>().fetchTopHeadlines();
                        },
                        child: ListView.builder(
                          itemCount: state.news.articles.length,
                          itemBuilder: (context, index) {
                            final article = state.news.articles[index];
                            return ItemBuilder(article: article);
                          },
                        ),
                      );
                    } else if (state is NewsError) {
                      return Center(child: Text("Error: ${state.message}"));
                    } else {
                      return const Center(child: Text("No articles available"));
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
