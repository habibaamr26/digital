import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/cubit/app_cubit.dart';
import '../../../core/cubit/app_status.dart';



class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
      builder: (BuildContext context, state) {
        AppCubit appCubit=context.read<AppCubit>();
        return Scaffold(
          body: appCubit.screens[appCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: appCubit.currentIndex,
            onTap: (index) {
            appCubit.bottomNavigationBarChange(index: index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Image(image: AssetImage("assets/images/explore.png")),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Image(image: AssetImage("assets/images/bookmark.png")),
                label: 'Bookmarks',
              ),
              BottomNavigationBarItem(
                icon: Image(image: AssetImage("assets/images/profile.png")),
                label: 'Profile',
              ),
            ],
          ),
        );
      },

    );
  }
}
