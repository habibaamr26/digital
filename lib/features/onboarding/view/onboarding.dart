import 'package:digitalhub/features/onboarding/view/page_item.dart';
import 'package:digitalhub/features/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:flutter/material.dart';
import '../../../core/utils/app_styles.dart';
class OnBording extends StatefulWidget {
  @override
  State<OnBording> createState() => _OnBordingState();
}
class _OnBordingState extends State<OnBording> {
  final viewModel = OnboardingViewModel();
  final PageController bord = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // PageView
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: bord,
              itemCount: viewModel.bording.length,
              itemBuilder: (context, index) => pageItem(
                context: context,
                bording: viewModel.bording[index],
                screenHeight: screenHeight,
                screenWidth: screenWidth,
              ),
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
            ),
          ),

          // Bottom Section with Indicators and Button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Row(
              children: [
                // Page Indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    viewModel.bording.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: currentIndex == index
                            ? Colors.blue
                            : Colors.grey[300],
                      ),
                    ),
                  ),
                ),
                Spacer(),

                // Navigation Row
                if (currentIndex > 0)
                  TextButton(
                    onPressed: () {
                      bord.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Text(
                      'Back',
                      style: AppStyles.styleSemiBold16(context),
                    ),
                  )
                else
                  const SizedBox.shrink(),

                // Next/Get Started Button
                ElevatedButton(
                  onPressed: () {
                    if (currentIndex == viewModel.bording.length - 1) {
                      Navigator.pushNamed(context, "loginScreen");
                    } else {
                      bord.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    currentIndex == viewModel.bording.length - 1
                        ? 'Get Started'
                        : 'Next',
                    style: AppStyles.styleSemiBold16(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
