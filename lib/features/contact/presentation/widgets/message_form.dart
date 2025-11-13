import 'package:flutter/material.dart';
import 'package:application/features/widgets/input_fields.dart';

/// Contains input fields for contact title and message
class MessageForm extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController messageController;

  const MessageForm({
    super.key,
    required this.titleController,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InputFields.inputText(
          controller: titleController,
          hintText: 'Tiêu đề liên hệ',
        ),
        const SizedBox(height: 16),
        InputFields.textArea(
          controller: messageController,
          hintText: 'Nội dung liên hệ',
        ),
      ],
    );
  }
}