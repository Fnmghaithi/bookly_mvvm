import 'package:bookly_mvvm/core/utils/app_router.dart';
import 'package:bookly_mvvm/core/utils/assets.dart';
import 'package:bookly_mvvm/features/splash/presentation/views/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    initSlidingAnimation();
    navigateToHome();
    super.initState();
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        GoRouter.of(context).push(AppRouter.kHomeView);
      },
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: const Offset(0, 0))
            .animate(animationController);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(AssetsData.logo),
          const SizedBox(height: 4),
          SlidingText(slidingAnimation: slidingAnimation),
        ],
      ),
    );
  }
}
