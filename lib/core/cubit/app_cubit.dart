
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/home/view/home_screen.dart';
import 'app_status.dart';

import '../../features/home/data/repository/news_repository.dart';

class AppCubit extends Cubit<AppState> {

  /// login screen

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool hasError = false;
  String? usernameError;


  void changeBorderColor()
  {
    hasError=true;
    emit(ChangeBorderColorState());
  }





  ///main screen
  int currentIndex = 0;

  final List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    //ExploreScreen(),
    //BookmarksScreen(),
    //ProfileScreen(),
  ];

  void bottomNavigationBarChange ({required int index})
  {
    currentIndex = index;
    emit(BottomNavigationBarState());
    if (index == 0) {
      fetchTopHeadlines();
    }

  }



  int selectedCategoryIndex = 0;

  void changeCategory(int index, String category) {
    selectedCategoryIndex = index;
    emit(BottomNavigationBarState());
    if (index == 0) {
      fetchTopHeadlines();
    }
  }



  // to fetch data
  final NewsRepository repository;

  AppCubit(this.repository) : super(NewsInitial()) {
    fetchTopHeadlines();
  }


  Future<void> fetchTopHeadlines() async {
    emit(NewsLoading());
    try {
      final news = await repository.getTopHeadlines();
      if (news != null) {
        emit(NewsLoaded(news));
      } else {
        emit(NewsError("No data found"));
      }
    } catch (e) {
      emit(NewsError(e.toString()));
    }
  }
}







