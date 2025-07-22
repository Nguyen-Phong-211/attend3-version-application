import 'package:flutter/material.dart';

class BarcodeCard extends StatelessWidget {
  const BarcodeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.08),
            offset: const Offset(0, 2),
            blurRadius: 6,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Đưa mã cho giảng viên để điểm danh\n(chỉ sử dụng khi QR code và check face thất bại)',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),
          Center(child: Image.asset('assets/images/barcode.jpg', height: 80)), // căn giữa
          const SizedBox(height: 4),
          const Text(
            '21070601',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}