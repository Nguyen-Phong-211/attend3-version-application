import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/routes/app_routes.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.selectedIndexMenuItem,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w900,
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      currentIndex: currentIndex,
      onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, AppRoutes.schedule);
          } else {
            onTap(index);
          }},
      items: [
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.house),
          label: 'Trang chủ',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.calendar),
          label: 'Lịch học',
        ),
        BottomNavigationBarItem(
          icon: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.pink, width: 2),
              borderRadius: BorderRadius.circular(5),
              shape: BoxShape.rectangle,
              image: const DecorationImage(
                image: AssetImage('assets/images/face-scan.gif'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Stack(
            children: [
              const FaIcon(FontAwesomeIcons.solidBell),
              Positioned(
                right: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '1',
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          label: 'Thông báo',
        ),
        const BottomNavigationBarItem(
          icon: FaIcon(FontAwesomeIcons.circleUser),
          label: 'Tài khoản',
        ),
      ],
    );
  }
}