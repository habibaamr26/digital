import 'package:device_preview/device_preview.dart';
import 'package:digitalhub/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cubit/app_cubit.dart';
import 'core/utils/app_routs.dart';

import 'features/home/data/repository/news_repository.dart';
import 'features/home/data/services/dio_helper.dart';
import 'features/home/view/home_screen.dart';

void main() {
  //final apiService = AppWebServices();
  //final repository = NewsRepository(apiService);
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(
        homeRoute: AppRoute(),
      ),
    ),
  );
  runApp(MyApp(
    homeRoute: AppRoute(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRoute homeRoute;
  const MyApp({super.key, required this.homeRoute});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: homeRoute.generateRoute,

    );
  }
}