import 'package:flutter/material.dart';
import 'package:light_test/core/fonts_and_colors.dart';
import 'package:light_test/features/profile/widgets/my_events_view.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('мой профиль', style: headline),
            const SizedBox(height: 20),
            const _Profile(),
            const SizedBox(height: 24),
            Text('Основное', style: titleSmallLight.copyWith(color: lightText)),
            const SizedBox(height: 8),
            const _ProfileButton('assets/images/ring.png', 'Центр уведомлений'),
            const SizedBox(height: 8),
            _ProfileButton(
              'assets/images/calendar2.png',
              'Мои мероприятия',
              onPressed: () {
                Navigator.push(context, MyEventsViewRoute());
              },
            ),
            const SizedBox(height: 8),
            const _ProfileButton('assets/images/bag.png', 'Сервисы'),
            const SizedBox(height: 8),
            const _ProfileButton(
              'assets/images/verified.png',
              'Статус бейдж и ТС',
            ),
            const SizedBox(height: 8),
            const _ProfileButton(
              'assets/images/settings.png',
              'Настройки аккаунта',
            ),
            const SizedBox(height: 24),
            const _ExitButton(),
          ],
        ),
      ),
    );
  }
}

class _Profile extends StatelessWidget {
  const _Profile();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 20, 12, 20),
      height: 112,
      decoration: BoxDecoration(
        color: grey3,
        border: Border.all(color: grey2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 72,
            height: 72,
            child: Image.asset('assets/images/avatar.png'),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('Андрей Бушев', style: titleFont),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.fromLTRB(12, 4, 12, 4),
                  decoration: BoxDecoration(
                    color: black,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'ID: 1241',
                    style: titleSmall,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset('assets/images/arrow.png'),
          ),
        ],
      ),
    );
  }
}

class _ProfileButton extends StatelessWidget {
  const _ProfileButton(this.image, this.title, {this.onPressed});

  final String image;
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
        height: 56,
        decoration: BoxDecoration(
          color: grey3,
          border: Border.all(color: grey2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset(image),
            ),
            const SizedBox(width: 10),
            Text(title, style: labelLarge.copyWith(color: black)),
            const Spacer(),
            SizedBox(
              width: 24,
              height: 24,
              child: Image.asset('assets/images/arrow.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExitButton extends StatelessWidget {
  const _ExitButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 16),
      height: 56,
      decoration: BoxDecoration(
        color: grey3,
        border: Border.all(color: grey2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text('Выйти из аккаунта', style: labelLarge.copyWith(color: red)),
          const Spacer(),
          SizedBox(
            width: 24,
            height: 24,
            child: Image.asset('assets/images/exit.png'),
          ),
        ],
      ),
    );
  }
}
