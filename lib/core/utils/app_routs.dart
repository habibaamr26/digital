import 'package:digitalhub/features/home/view/home_screen.dart';
import 'package:digitalhub/features/onboarding/view/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/view/login_screen.dart';
import '../../features/home/data/repository/news_repository.dart';

import '../../features/home/data/services/dio_helper.dart';
import '../../features/home/view/main_screen.dart';
import '../../features/home/view/news_details_screen.dart';
import '../cubit/app_cubit.dart';
class AppRoute {
  late AppCubit newsCubit;
  late NewsRepository newsRepository;

  AppRoute() {
    newsRepository = NewsRepository(AppWebServices());
    newsCubit = AppCubit(newsRepository);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => OnBording());


      case "loginScreen":
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (_) => newsCubit,
            child: LoginScreen(),
          );
        });

      case "mainScreen":
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (_) => newsCubit,
            child: MainScreen(),
          );
        });
      case "newsScreen":
        return MaterialPageRoute(builder: (_) {
          return BlocProvider(
            create: (_) => newsCubit,
            child: HomeScreen(),
          );
        });


    }
    return null;
  }
}
