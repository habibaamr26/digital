import 'package:digitalhub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/cubit/app_cubit.dart';
import '../../../core/cubit/app_status.dart';

 // category Row
class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ["All", "Sports", "Politics", "Bussiness", "Health", "Travel", "Science"];
    return   SizedBox(
      height: 40,
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          AppCubit appCubit=context.read<AppCubit>();
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final isSelected = appCubit.selectedCategoryIndex == index;
              return GestureDetector(
                onTap: () {
                  appCubit.changeCategory(index, categories[index]);
                },
                child: Column(
            
                  children: [
                    Text(
                      categories[index],
                      style: AppStyles.styleRegular16(context)
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 2,
                      width: 19,
                      color: isSelected ? Colors.blue : Colors.transparent,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
