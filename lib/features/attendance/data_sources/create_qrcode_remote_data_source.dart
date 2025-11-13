import 'package:application/features/attendance/domain/entities/qr_code_data.dart';
import 'package:encrypt/encrypt.dart' as encrypt;

/// Mock API / Remote Data Source
class AttendanceRemoteDataSource {
  Future<String> createQrCode(QrCodeData data) async {
    // Delay 1s
    await Future.delayed(const Duration(seconds: 1));

    // Content QR code
    final plainText = '''
      Năm học: ${data.selectedClass}
      Môn học: ${data.selectedSubject}
      Bán kính: ${data.radius}m
      Ghi chú: ${data.note.isNotEmpty ? data.note : 'Không'}
    ''';

    // Encrypt dữ liệu
    const keyStr = 'mysecretkey1234567890';
    const ivStr = 'iv1234567890';
    final key = encrypt.Key.fromUtf8(keyStr.padRight(32, ' '));
    final iv = encrypt.IV.fromUtf8(ivStr.padRight(16, ' '));
    final encrypter = encrypt.Encrypter(encrypt.AES(key));
    final encrypted = encrypter.encrypt(plainText, iv: iv).base64;

    return encrypted;
  }

  Future<Map<String, List<String>>> fetchClassAndSubject() async {
    // Sample data
    await Future.delayed(const Duration(milliseconds: 500));
    return {
      'classes': ['CH01', 'CH02', 'CH03'],
      'subjects': ['Lập trình Flutter', 'Cấu trúc dữ liệu', 'Toán rời rạc'],
    };
  }
}