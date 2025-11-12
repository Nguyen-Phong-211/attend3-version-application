import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/features/widgets/scaffold_messages.dart';
import 'package:application/features/setting/presentation/widgets/feedback_header.dart';
import 'package:application/features/setting/presentation/widgets/feedback_topic_card.dart';
import 'package:application/features/setting/presentation/widgets/feedback_content_field.dart';
import 'package:application/features/setting/presentation/widgets/feedback_submit_button.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  String selectedTopic = 'Trải nghiệm người dùng';
  final TextEditingController feedbackController = TextEditingController();

  final List<String> feedbackTopics = [
    'Trải nghiệm người dùng',
    'Tính năng cần bổ sung',
    'Giao diện và Thiết kế',
    'Báo lỗi hoặc bug',
    'Khác',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const FeedbackHeader(),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                FeedbackTopicCard(
                  selectedTopic: selectedTopic,
                  topics: feedbackTopics,
                  onTopicChanged: (value) => setState(() => selectedTopic = value),
                ),
                const SizedBox(height: 16),
                FeedbackContentField(controller: feedbackController),
                const SizedBox(height: 24),
                FeedbackSubmitButton(
                  controller: feedbackController,
                  onSuccess: () {
                    ScaffoldMessages.informSuccess(context, 'Cảm ơn bạn đã gửi phản hồi');
                  },
                  onEmpty: () {
                    ScaffoldMessages.informError(context, 'Vui lòng nhập nội dung phản hồi trước khi gửi');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}