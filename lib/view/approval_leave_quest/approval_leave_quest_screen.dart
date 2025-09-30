import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/theme/text_styles.dart';
import 'package:application/core/constants/app_colors_linear_gradient_constants.dart';
import 'package:application/core/constants/border_radius.dart';

enum SortByDate { newest, oldest }

class ApprovalLeaveRequestScreen extends StatefulWidget {
  const ApprovalLeaveRequestScreen({Key? key}) : super(key: key);

  @override
  State<ApprovalLeaveRequestScreen> createState() =>
      _ApprovalLeaveRequestScreenState();
}

class _ApprovalLeaveRequestScreenState
    extends State<ApprovalLeaveRequestScreen> {
  SortByDate _selectedSort = SortByDate.newest;
  String _selectedClass = 'Tất cả';

  final List<String> classes = ['Tất cả', 'CTK43A', 'CTK43B', 'CTK44A', 'CTK44B'];

  final List<Map<String, dynamic>> leaveRequests = [
    {
      'studentName': 'Nguyễn Văn A',
      'subject': 'Lập trình Java',
      'class': 'CTK43A',
      'date': DateTime(2025, 8, 10),
      'timeOff': '08:00 - 10:00',
    },
    {
      'studentName': 'Trần Thị B',
      'subject': 'Cơ sở dữ liệu',
      'class': 'CTK44B',
      'date': DateTime(2025, 8, 12),
      'timeOff': '10:00 - 12:00',
    },
    {
      'studentName': 'Lê Văn C',
      'subject': 'Mạng máy tính',
      'class': 'CTK43A',
      'date': DateTime(2025, 8, 9),
      'timeOff': '13:00 - 15:00',
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredRequests = _selectedClass == 'Tất cả'
        ? leaveRequests
        : leaveRequests.where((req) => req['class'] == _selectedClass).toList();

    filteredRequests.sort((a, b) => _selectedSort == SortByDate.newest
        ? b['date'].compareTo(a['date'])
        : a['date'].compareTo(b['date']));

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
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
                  child: const FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Phê duyệt đơn nghỉ',
                  style: TextStyles.titleScaffold,
                ),
              ],
            ),
          ),

          Container(
            height: 50,
            margin: const EdgeInsets.only(top: 12),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: classes.length,
              itemBuilder: (context, index) {
                final className = classes[index];
                final isSelected = className == _selectedClass;
                return GestureDetector(
                  onTap: () {
                    setState(() => _selectedClass = className);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primary : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      className,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 12
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Bộ lọc ngày
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                const Text(
                  'Sắp xếp:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 10),
                DropdownButton<SortByDate>(
                  value: _selectedSort,
                  onChanged: (value) {
                    if (value != null) {
                      setState(() => _selectedSort = value);
                    }
                  },
                  items: const [
                    DropdownMenuItem(
                      value: SortByDate.newest,
                      child: Text('Mới nhất'),
                    ),
                    DropdownMenuItem(
                      value: SortByDate.oldest,
                      child: Text('Cũ nhất'),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Danh sách đơn
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filteredRequests.length,
              itemBuilder: (context, index) {
                final request = filteredRequests[index];
                return Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    title: Text(
                      request['studentName'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Môn học: ${request['subject']}'),
                        Text(
                          'Ngày: ${request['date'].day}/${request['date'].month}/${request['date'].year}',
                        ),
                        Text('Thời gian nghỉ: ${request['timeOff']}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward_ios, size: 20),
                      onPressed: () {
                        // Điều hướng đến màn chi tiết đơn nghỉ nếu có
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      )
    );
  }
}