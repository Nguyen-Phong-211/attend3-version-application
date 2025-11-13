class Validators {
  // Validate phone number
  static String? validatePhoneNumber(String phone) {
    if (phone.isEmpty) return 'Vui lòng nhập số điện thoại';
    if (!RegExp(r'^\d{10}$').hasMatch(phone))
      return 'Số điện thoại phải có đúng 10 chữ số';
    return null;
  }

  // Validate password
  static String? validatePassword(String password) {
    if (password.isEmpty) return 'Vui lòng nhập mật khẩu';
    if (password.length < 8) return 'Mật khẩu phải có ít nhất 8 ký tự';
    if (!RegExp(r'[A-Za-z]').hasMatch(password) ||
        !RegExp(r'\d').hasMatch(password)) {
      return 'Mật khẩu phải có cả chữ và số';
    }
    return null;
  }

  // Validate OPT Code
  static String? validateOtp(String otp) {
    if (otp.isEmpty) return 'Vui lòng nhập OTP';
    if (!RegExp(r'^\d{6}$').hasMatch(otp)) return 'OTP phải gồm 6 chữ số';
    return null;
  }

  // Validate email
  static String? validateEmail(String email) {
    if (email.isEmpty) return 'Vui lòng nhập email';
    final emailRegex = RegExp(r"^[\w.-]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!emailRegex.hasMatch(email)) return 'Email không hợp lệ';
    return null;
  }

  // Validate confirm password
  static String? validateConfirmPassword(String password, String confirm) {
    if (confirm.isEmpty) return 'Vui lòng xác nhận mật khẩu';
    if (password != confirm) return 'Mật khẩu xác nhận không khớp';
    return null;
  }

  // Validate contact screen
  static String? validateContactForm({
    required String? typePerson,
    required String? teacher,
    required String? subject,
    required String? className,
    required String title,
    required String message,
  }) {
    if (typePerson == null) {
      return 'Vui lòng chọn người liên hệ.';
    }

    if (typePerson == 'Quản trị viên') {
      if (title.trim().isEmpty) {
        return 'Vui lòng nhập tiêu đề liên hệ.';
      }
      if (message.trim().isEmpty) {
        return 'Vui lòng nhập nội dung liên hệ.';
      }
    }

    if (typePerson == 'Giảng viên') {
      if (teacher == null) {
        return 'Vui lòng chọn giảng viên.';
      }
      if (subject == null) {
        return 'Vui lòng chọn môn học.';
      }
      if (className == null) {
        return 'Vui lòng chọn lớp.';
      }
      if (title.trim().isEmpty) {
        return 'Vui lòng nhập tiêu đề liên hệ.';
      }
      if (message.trim().isEmpty) {
        return 'Vui lòng nhập nội dung liên hệ.';
      }
    }
    return null;
  }
}
