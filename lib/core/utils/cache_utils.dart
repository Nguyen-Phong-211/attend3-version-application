import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:application/features/widgets/scaffold_messages.dart';

class CacheUtils {
  ///
  static Future<void> clearAppCache(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    await DefaultCacheManager().emptyCache();

    ScaffoldMessages.informSuccess(context, 'Đã xóa bộ nhớ đệm thành công');
  }
}