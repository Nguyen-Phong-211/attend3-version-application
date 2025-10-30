import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/constants/border_radius.dart';
import 'package:application/core/theme/text_styles.dart';

class LeaveDropdown extends StatefulWidget {
  final String hint;
  final List<String> items;
  final String? value;
  final IconData iconData;
  final Function(String?) onChanged;

  const LeaveDropdown({
    super.key,
    required this.hint,
    required this.items,
    required this.value,
    required this.iconData,
    required this.onChanged,
  });

  @override
  State<LeaveDropdown> createState() => _LeaveDropdownState();
}

class _LeaveDropdownState extends State<LeaveDropdown> {
  void _openBottomSheet(BuildContext context) async {
    final selected = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent, // Make background transparent for blur
      isScrollControlled: true,
      barrierColor: Colors.black.withValues(alpha: 0.04),
      builder: (context) => _DropdownBottomSheet(
        title: widget.hint,
        items: widget.items,
        selectedValue: widget.value,
      ),
    );

    if (selected != null) {
      widget.onChanged(selected);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openBottomSheet(context),
      borderRadius: AppBorderRadius.radius12,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: AppBorderRadius.radius12,
          border: Border.all(color: Colors.grey.shade300, width: 1.5),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withValues(alpha: 0.05),
          //     blurRadius: 6,
          //     offset: const Offset(0, 2),
          //   ),
          // ],
        ),
        child: Row(
          children: [
            FaIcon(widget.iconData, color: AppColors.primary, size: 12),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                widget.value ?? widget.hint,
                style: widget.value == null
                    ? TextStyles.hintTextInput.copyWith(color: Colors.grey.shade500)
                    : TextStyles.titleInput.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            const FaIcon(FontAwesomeIcons.circleChevronDown, size: 12, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}

class _DropdownBottomSheet extends StatefulWidget {
  final String title;
  final List<String> items;
  final String? selectedValue;

  const _DropdownBottomSheet({
    required this.title,
    required this.items,
    this.selectedValue,
  });

  @override
  State<_DropdownBottomSheet> createState() => _DropdownBottomSheetState();
}

class _DropdownBottomSheetState extends State<_DropdownBottomSheet> {
  late List<String> filteredItems;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = searchController.text.toLowerCase();
    setState(() {
      filteredItems = widget.items
          .where((item) => item.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
      child: DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 0.9,
        minChildSize: 0.4,
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              // Top drag handle
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              Text(
                widget.title,
                style: TextStyles.titleHeading,
              ),
              const SizedBox(height: 12),
              // Search input
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: searchController,
                  style: TextStyles.titleInput.copyWith(fontWeight: FontWeight.normal),
                  decoration: const InputDecoration(
                    hintText: "Tìm kiếm...",
                    prefixIcon: Icon(Icons.search, color: AppColors.primary),
                    border: InputBorder.none,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: filteredItems.isEmpty
                    ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const FaIcon(FontAwesomeIcons.boxOpen,
                          size: 40, color: Colors.grey),
                      const SizedBox(height: 12),
                      Text(
                        "Không tìm thấy kết quả",
                        style: TextStyles.hintTextInput.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                )
                    : ListView.builder(
                  controller: controller,
                  itemCount: filteredItems.length,
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    final isSelected = item == widget.selectedValue;

                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOut,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.primary.withValues(alpha: 0.08)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          item,
                          style: TextStyles.titleInput.copyWith(
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.w400,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.black,
                          ),
                        ),
                        trailing: isSelected
                            ? const Icon(Icons.check_circle,
                            color: AppColors.primary, size: 22)
                            : null,
                        onTap: () => Navigator.pop(context, item),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}