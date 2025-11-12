import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:application/features/setting/presentation/widgets/primary_action_button.dart';

class FeedbackSubmitButton extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSuccess;
  final VoidCallback onEmpty;

  const FeedbackSubmitButton({
    super.key,
    required this.controller,
    required this.onSuccess,
    required this.onEmpty,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryActionButton(
      onPressed: () {
        final text = controller.text.trim();
        if (text.isEmpty) {
          onEmpty();
        } else {
          onSuccess();
          controller.clear();
        }
      },
      text: 'Gửi phản hồi',
      icon: HeroIcons.checkCircle,
    );
  }
}