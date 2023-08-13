import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:light_test/core/fonts_and_colors.dart';
import 'package:light_test/core/widgets/buttons.dart';

class OnboardingScreenRoute extends CupertinoPageRoute {
  OnboardingScreenRoute() : super(builder: (_) => const OnboardingScreen());

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    const curve = Curves.ease;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}

final onboardings = [
  {
    'title': 'Уникальные сервисы',
    'message':
        'Воспользуйтесь удобством специальных сервисов для участников мероприятий',
    'image': 'assets/images/onboarding_1.png',
  },
  {
    'title': 'Центр уведомлений',
    'message':
        'Сразу после наступления события, мы уведомим вас сообщением на мобильном устройстве',
    'image': 'assets/images/onboarding_2.png',
  },
  {
    'title': 'Программа мероприятий',
    'message': 'Всегда под рукой актуальная информация о программе мероприятия',
    'image': 'assets/images/onboarding_3.png',
  },
];

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: 3,
        itemBuilder: (_, i) => _OnboardingView(
          title: onboardings[i]['title']!,
          message: onboardings[i]['message']!,
          isLast: i == 2,
          index: i,
          image: onboardings[i]['image']!,
          onNext: () {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }
}

class _OnboardingView extends StatelessWidget {
  const _OnboardingView({
    required this.title,
    required this.message,
    required this.isLast,
    required this.index,
    required this.image,
    required this.onNext,
  });

  final String image;
  final String title;
  final String message;
  final bool isLast;
  final int index;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final buttonLabel = isLast ? 'Начать работу' : 'Далее';
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Positioned.fill(child: Image.asset(image, fit: BoxFit.cover)),
        if (!isLast) ...[
          Positioned(
            top: 60,
            right: 24,
            child: SimpleButton(
              onPressed: () {
                Navigator.pop(context);
              },
              isExpand: false,
              padding: const EdgeInsets.all(10),
              color: whiteLight,
              child: const Text('Пропустить', style: labelSmall),
            ),
          )
        ],
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title, style: titleLarge),
                const SizedBox(height: 16),
                Text(
                  message,
                  style: labelLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                SimpleButton(
                  child: Text(buttonLabel),
                  onPressed: () {
                    if (!isLast) {
                      onNext();
                    } else {
                      Navigator.pop(context);
                    }
                  },
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(3, (i) => _DotIndicator(index == i)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _DotIndicator extends StatelessWidget {
  const _DotIndicator(this.isActive);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: 8,
      width: isActive ? 16 : 8,
      decoration: BoxDecoration(
        color: isActive ? primary : white,
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
    );
  }
}
