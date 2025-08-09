import 'package:flutter/material.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'attendance_history_detail.dart';
import 'package:application/core/constants/box_shadow_constants.dart';

class AttendanceHistoryScreen extends StatefulWidget {
  const AttendanceHistoryScreen({super.key});

  @override
  State<AttendanceHistoryScreen> createState() => _AttendanceHistoryScreenState();
}

class _AttendanceHistoryScreenState extends State<AttendanceHistoryScreen> {
  final List<Map<String, dynamic>> attendanceHistory = [
    {
      'subject': 'Toán cao cấp',
      'timestamp': DateTime.now().subtract(const Duration(hours: 5)),
      'status': 'Có mặt',
    },
    {
      'subject': 'Kỹ thuật lập trình',
      'timestamp': DateTime.now().subtract(const Duration(days: 1, hours: 2)),
      'status': 'Vắng mặt',
    },
    {
      'subject': 'Xác suất thống kê',
      'timestamp': DateTime.now().subtract(const Duration(days: 2)),
      'status': 'Có mặt',
    },
  ];

  DateTime? _selectedDate;

  void _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: now,
      helpText: 'Chọn ngày điểm danh',
      locale: const Locale('vi', 'VN'),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  List<Map<String, dynamic>> get _filteredHistory {
    if (_selectedDate == null) return attendanceHistory;
    return attendanceHistory.where((item) {
      final date = item['timestamp'] as DateTime;
      return date.year == _selectedDate!.year &&
          date.month == _selectedDate!.month &&
          date.day == _selectedDate!.day;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final formattedDate = _selectedDate != null
        ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
        : 'Tất cả ngày';

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(16, 48, 16, 24),
            decoration: const BoxDecoration(
              gradient: AppLinearGradient.linearGradient,
              borderRadius: AppBorderRadius.bottom24,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const FaIcon(FontAwesomeIcons.chevronLeft, color: AppColors.white),
                ),
                const SizedBox(width: 12),
                Text('Lịch sử điểm danh', style: TextStyles.titleScaffold),
                const Spacer(),
                IconButton(
                  onPressed: _pickDate,
                  icon: const Icon(Icons.calendar_today, color: AppColors.white),
                ),
              ],
            ),
          ),

          // Filter by day
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Icon(Icons.filter_alt_outlined, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(
                  'Ngày: $formattedDate',
                  style: TextStyles.bodyNormal,
                ),
                const Spacer(),
                if (_selectedDate != null)
                  GestureDetector(
                    onTap: () => setState(() => _selectedDate = null),
                    child: const Icon(Icons.clear, color: AppColors.grey),
                  ),
              ],
            ),
          ),

          // List attendance
          Expanded(
            child: _filteredHistory.isEmpty
                ? Center(
              child: Text('Không có dữ liệu điểm danh.', style: TextStyles.bodyNormal),
            )
                : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _filteredHistory.length,
              itemBuilder: (context, index) {
                final item = _filteredHistory[index];
                return AttendanceCard(item: item);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AttendanceCard extends StatelessWidget {
  final Map<String, dynamic> item;

  const AttendanceCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final timeStr = DateFormat('HH:mm dd/MM/yyyy').format(item['timestamp']);

    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border(
            left: BorderSide(
              width: 6,
              color: item['status'] == 'Có mặt' ? AppColors.primary : Colors.redAccent,
            ),
          ),
          borderRadius: AppBorderRadius.radius8,
          boxShadow: CardShadows.cardShadowList,
        ),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.book_outlined, size: 16, color: AppColors.primary),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  item['subject'],
                  style: TextStyles.titleSmall.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              Text(
                'Trạng thái: ',
                style: TextStyles.bodyNormal.copyWith(color: AppColors.grey),
              ),
              Text(
                item['status'],
                style: TextStyles.bodyNormal.copyWith(
                  color: item['status'] == 'Có mặt' ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: AppColors.grey),
              const SizedBox(width: 6),
              Text(timeStr, style: TextStyles.bodyNormal.copyWith(color: AppColors.grey)),
            ],
          ),

          const SizedBox(height: 4),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AttendanceHistoryDetailScreen(
                      detail: {
                        'academicYear': '2024-2025',
                        'semester': 'Học kỳ I',
                        'subject': item['subject'],
                        'timestamp': item['timestamp'],
                        'teacher': 'ThS. Nguyễn Văn A',
                        'room': 'P202 - Cơ sở 1',
                        'method': 'QR Code',
                        'status': item['status'],
                      },
                    ),
                  ),
                );
              },
              child: Text('Xem chi tiết', style: TextStyles.titleSmall.copyWith(color: AppColors.textPrimaryColor)),
            ),
          ),
        ],
      ),
    ),
    );
  }
}