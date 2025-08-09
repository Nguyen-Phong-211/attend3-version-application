import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TermScreen extends StatelessWidget {
  const TermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            decoration: const BoxDecoration(
              gradient: AppLinearGradient.linearGradient,
              borderRadius: AppBorderRadius.borderRadiusBottomLeftRight24,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
                ),
                const SizedBox(width: 12),
                Text('Điều khoản & Chính sách', style: TextStyles.titleScaffold),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Body Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '1. Giới thiệu',
                      style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ứng dụng "ATTEND 3D" là nền tảng điểm danh sinh viên sử dụng công nghệ nhận diện khuôn mặt 3D. Chúng tôi cam kết đảm bảo tính minh bạch, an toàn và bảo mật thông tin cho người dùng.',
                      style: TextStyles.bodyNormal,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      '2. Thu thập và sử dụng thông tin',
                      style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Chúng tôi thu thập các thông tin cá nhân như họ tên, mã sinh viên, khuôn mặt 3D, lịch sử điểm danh và vị trí địa lý (khi có sự cho phép) nhằm mục đích:\n'
                          '- Quản lý hoạt động điểm danh chính xác\n'
                          '- Phát hiện gian lận trong điểm danh\n'
                          '- Thống kê và báo cáo dữ liệu học tập\n'
                          '\nTất cả dữ liệu được mã hóa và lưu trữ an toàn trên máy chủ nội bộ hoặc nền tảng điện toán đám mây đáng tin cậy.',
                      style: TextStyles.bodyNormal,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      '3. Bảo mật dữ liệu',
                      style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Chúng tôi áp dụng các biện pháp bảo mật hiện đại như xác thực đa lớp, mã hóa dữ liệu đầu cuối và kiểm soát truy cập nghiêm ngặt nhằm đảm bảo rằng thông tin cá nhân và dữ liệu nhận diện khuôn mặt không bị truy cập trái phép.',
                      style: TextStyles.bodyNormal,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      '4. Quyền và nghĩa vụ của người dùng',
                      style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Người dùng có trách nhiệm:\n'
                          '- Cung cấp thông tin chính xác khi đăng ký\n'
                          '- Không sử dụng phần mềm để giả mạo danh tính\n'
                          '- Không chia sẻ tài khoản với người khác\n\n'
                          'Người dùng có quyền:\n'
                          '- Xem lại lịch sử điểm danh\n'
                          '- Yêu cầu chỉnh sửa thông tin cá nhân\n'
                          '- Yêu cầu xóa dữ liệu khi không còn sử dụng ứng dụng',
                      style: TextStyles.bodyNormal,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      '5. Điều khoản sử dụng công nghệ nhận diện khuôn mặt',
                      style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Việc sử dụng công nghệ nhận diện khuôn mặt 3D chỉ được thực hiện cho mục đích xác minh danh tính trong các hoạt động điểm danh. Chúng tôi không sử dụng hình ảnh khuôn mặt để phục vụ quảng cáo, chia sẻ bên thứ ba, hoặc các mục đích không liên quan đến giáo dục.',
                      style: TextStyles.bodyNormal,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      '6. Thay đổi chính sách',
                      style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Chúng tôi có quyền thay đổi điều khoản sử dụng và chính sách bảo mật. Mọi thay đổi sẽ được thông báo trên ứng dụng hoặc qua email. Việc tiếp tục sử dụng ứng dụng sau khi có thay đổi đồng nghĩa với việc bạn đồng ý với các điều khoản mới.',
                      style: TextStyles.bodyNormal,
                    ),
                    const SizedBox(height: 16),

                    Text(
                      '7. Liên hệ và hỗ trợ',
                      style: TextStyles.titleMedium.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Mọi câu hỏi, khiếu nại hoặc yêu cầu hỗ trợ liên quan đến điều khoản và chính sách, vui lòng liên hệ:\n\n'
                          '📧 Email: support@attend3d.vn\n'
                          '📞 Hotline: 0825 025 347\n'
                          '🏢 Địa chỉ: 144 Phạm Ngũ Lão, Phường Hạnh Thông, Tp.Hồ Chí Minh',
                      style: TextStyles.bodyNormal,
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Text(
                        'Cảm ơn bạn đã sử dụng ATTEND 3D',
                        style: TextStyles.bodyNormal.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}