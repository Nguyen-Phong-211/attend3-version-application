import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/app_icons.dart';
import 'package:application/core/constants/app_label.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/constants/box_shadow_constants.dart';
import 'package:application/core/theme/text_styles.dart';

class ApprovalFilterDrawer {
  static Future<Map<String, dynamic>?> show(BuildContext ctx) {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: ctx,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => const _ApprovalFilterContent(),
    );
  }
}

class _ApprovalFilterContent extends StatefulWidget {
  const _ApprovalFilterContent();

  @override
  State<_ApprovalFilterContent> createState() => _ApprovalFilterContentState();
}

class _ApprovalFilterContentState extends State<_ApprovalFilterContent> {
  // --- Controller ---
  String? _selectedStatus;
  String? _selectedClass;
  String? _selectedSubject;
  DateTime? _fromDate;
  DateTime? _toDate;

  // --- Constants ---
  static const _statuses = ['Tất cả', 'approved', 'rejected', 'pending'];
  static const _classes = ['Tất cả', 'CTK43A', 'CTK43B', 'CTK44A', 'CTK44B'];
  static const _subjects = ['Lập trình Java', 'Cơ sở dữ liệu', 'Mạng máy tính'];

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      locale: const Locale('vi'),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF1976D2),
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(foregroundColor: Color(0xFF1976D2)),
          ),
          dialogBackgroundColor: AppColors.white,
        ),
        child: child!,
      ),
    );

    if (picked != null) {
      setState(() {
        _fromDate = picked.start;
        _toDate = picked.end;
      });
    }
  }

  void _resetFilters() {
    setState(() {
      _selectedStatus = null;
      _selectedClass = null;
      _selectedSubject = null;
      _fromDate = null;
      _toDate = null;
    });
  }

  void _applyFilters() {
    Navigator.pop(context, {
      'status': _selectedStatus,
      'class': _selectedClass,
      'subject': _selectedSubject,
      'from': _fromDate,
      'to': _toDate,
    });
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
      child: DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: AppBorderRadius.top24,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: ListView(
            controller: controller,
            children: [
              _buildHeader(),
              const SizedBox(height: 16),
              _buildDropdownSection(
                label: 'Theo trạng thái',
                hint: 'Chọn trạng thái',
                value: _selectedStatus,
                items: _statuses,
                onChanged: (v) => setState(() => _selectedStatus = v),
              ),
              const SizedBox(height: 16),
              _buildDropdownSection(
                label: AppLabel.titleInputFilterByClass,
                hint: AppLabel.hintTextInputFilterByClass,
                value: _selectedClass,
                items: _classes,
                onChanged: (v) => setState(() => _selectedClass = v),
              ),
              const SizedBox(height: 16),
              _buildDropdownSection(
                label: AppLabel.titleInputFilterBySubject,
                hint: AppLabel.hintTextInputFilterBySubject,
                value: _selectedSubject,
                items: _subjects,
                onChanged: (v) => setState(() => _selectedSubject = v),
              ),
              const SizedBox(height: 16),
              _buildDatePicker(),
              const SizedBox(height: 30),
              _buildActionButtons(),
            ],
          ),
        ),
      ),
    );
  }

  // --- UI Sections ---
  Widget _buildHeader() => Column(
    children: [
      Container(
        width: 40,
        height: 5,
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
      Text(
        AppLabel.titleButtonFilter,
        style: TextStyles.titleHeadingMedium.copyWith(color: Colors.black),
      ),
    ],
  );

  Widget _buildDropdownSection({
    required String label,
    required String hint,
    required List<String> items,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyles.titleInput),
        const SizedBox(height: 8),
        _buildDropdown(hint: hint, value: value, items: items, onChanged: onChanged),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(AppLabel.titleInputFilterByDate, style: TextStyles.titleInput),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _pickDateRange,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppBorderRadius.radius12,
              border: Border.all(color: Colors.grey.shade300, width: 1.5),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_month, color: Color(0xFF1976D2), size: 15),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    _fromDate == null
                        ? AppLabel.hintTextButtonDateField
                        : "${_dateFormat.format(_fromDate!)} - ${_dateFormat.format(_toDate!)}",
                    style: TextStyle(
                      fontSize: 10,
                      color: _fromDate == null ? Colors.grey : Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: _resetFilters,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              side: const BorderSide(color: AppColors.borderButtonOutline),
              shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.radius12),
            ),
            child: const Text(
              AppLabel.titleButtonOutlineResetFilter,
              style: TextStyle(color: AppColors.titleButtonOutline),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: _applyFilters,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.backgroundPrimaryButton,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.radius12),
            ),
            child: const Text(AppLabel.titleButtonApplyFilter, style: TextStyles.titleButton),
          ),
        ),
      ],
    );
  }

  // --- Shared dropdown widget ---
  Widget _buildDropdown({
    required String hint,
    required List<String> items,
    required String? value,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        value: value,
        hint: Text(hint, style: TextStyles.hintTextInput),
        items: items.map((e) {
          final isSelected = e == value;
          return DropdownMenuItem<String>(
            value: e,
            child: Row(
              children: [
                if (isSelected)
                  const Padding(
                    padding: EdgeInsets.only(right: 6),
                    child: AppIcon.iconDropdownItemSelected,
                  )
                else
                  const SizedBox(width: 16),
                Text(
                  e,
                  style: TextStyle(
                    fontSize: 10,
                    color: isSelected ? AppColors.primary : Colors.black,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
        onChanged: onChanged,
        iconStyleData: const IconStyleData(icon: AppIcon.iconDropdown),
        buttonStyleData: ButtonStyleData(
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
            borderRadius: AppBorderRadius.radius12,
          ),
        ),
        dropdownStyleData: DropdownStyleData(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: AppBorderRadius.radius12,
            boxShadow: AppShadows.dropdownItemShadowList,
          ),
          offset: const Offset(0, 5),
        ),
      ),
    );
  }
}