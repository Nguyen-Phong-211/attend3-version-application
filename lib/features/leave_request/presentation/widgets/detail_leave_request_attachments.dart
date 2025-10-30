import 'package:application/core/constants/border_radius.dart';
import 'package:flutter/material.dart';

class DetailLeaveRequestAttachments extends StatelessWidget {
  const DetailLeaveRequestAttachments({super.key});

  @override
  Widget build(BuildContext context) {
    final exampleImages = [
      'https://via.placeholder.com/200x120.png?text=Ảnh+1',
      'https://via.placeholder.com/200x120.png?text=Ảnh+2',
      'https://via.placeholder.com/200x120.png?text=Ảnh+3',
    ];
    final examplePdfs = ['https://example.com/sample.pdf'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: exampleImages.map((url) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                url,
                width: 110,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 110,
                  height: 80,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: examplePdfs.map((_) {
            return Container(
              width: 110,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: AppBorderRadius.radius8,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Center(
                child: Icon(Icons.picture_as_pdf,
                    color: Colors.redAccent, size: 32),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
