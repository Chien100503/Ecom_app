import 'package:ecom_app/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:ecom_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:ecom_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:ecom_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:ecom_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:ecom_app/utils/constants/images_strings.dart';
import 'package:ecom_app/utils/constants/texts_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// horizontal Scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: EImages.onBoarding1,
                title: ETexts.onBoardingTitle1,
                subTitle: ETexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: EImages.onBoarding2,
                title: ETexts.onBoardingTitle2,
                subTitle: ETexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: EImages.onBoarding3,
                title: ETexts.onBoardingTitle3,
                subTitle: ETexts.onBoardingSubTitle3,
              ),
            ],
          ),
          // Skip button
          const OnBoardingSkip(),
          //Dot navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),
          //Circle button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}


