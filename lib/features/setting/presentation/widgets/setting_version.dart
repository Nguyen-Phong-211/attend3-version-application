import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:application/core/theme/text_styles.dart';

class AppVersionSubtitle extends StatefulWidget {
  const AppVersionSubtitle({super.key});

  @override
  State<AppVersionSubtitle> createState() => _AppVersionSubtitleState();
}

class _AppVersionSubtitleState extends State<AppVersionSubtitle> {
  late Future<PackageInfo> _packageInfoFuture;

  @override
  void initState() {
    super.initState();
    _packageInfoFuture = PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
      future: _packageInfoFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Text('Đang tải...', style: TextStyles.bodyNormal);
        }

        final info = snapshot.data!;
        return Text(
          'Phiên bản ${info.version}+${info.buildNumber}',
          style: TextStyles.bodyNormal,
        );
      },
    );
  }
}