import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrPreviewWidget extends StatelessWidget {
  final String? qrData;
  final String label;

  const QrPreviewWidget({super.key, this.qrData, required this.label, required String displayId});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: qrData != null
          ? Column(
        children: [
          QrImageView(data: qrData!, size: 180),
          const SizedBox(height: 12),
          Text(label, style: const TextStyle(fontWeight: FontWeight.bold))
        ],
      )
          : const Text("Chưa có mã QR, vui lòng nhập thông tin."),
    );
  }
}