import 'package:application/view/auth/forgot_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:application/core/constants/app_colors.dart';
import 'package:application/core/utils/auth_provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:application/core/theme/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  String? _phoneError;
  String? _passwordError;

  final AuthProvider authProvider = AuthProvider();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            width: double.infinity,
            constraints: BoxConstraints(minHeight: size.height * 0.7),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 80,
                  width: 80,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Đăng nhập',
                  style: TextStyles.titleHeading,
                ),
                const SizedBox(height: 24),

                // Phone Number
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Số điện thoại', style: _labelStyle()),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone, color: AppColors.iconInput),
                    hintText: 'Nhập số điện thoại',
                    errorText: _phoneError,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),

                    // Màu viền khi bình thường
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
                    ),

                    // Màu viền khi focus
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.inputFocus, width: 2), // xanh đậm
                    ),

                    // Màu viền khi có lỗi
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    ),

                    // Màu viền khi có lỗi và đang focus
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Mật khẩu
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Mật khẩu', style: _labelStyle()),
                ),
                const SizedBox(height: 6),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: AppColors.iconInput),
                    errorText: _passwordError,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.iconInput,
                      ),
                      onPressed: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                    ),
                    hintText: 'Nhập mật khẩu',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    // Màu viền khi bình thường
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFFBDBDBD), width: 2),
                    ),

                    // Màu viền khi focus
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: AppColors.inputFocus, width: 2), // xanh đậm
                    ),

                    // Màu viền khi có lỗi
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2.0),
                    ),

                    // Màu viền khi có lỗi và đang focus
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Quên mật khẩu',
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _phoneError = authProvider.validatePhoneNumber(_phoneController.text);
                        _passwordError = authProvider.validatePassword(_passwordController.text);
                      });

                      if (_phoneError == null && _passwordError == null) {
                        bool success = await authProvider.login(
                          _phoneController.text,
                          _passwordController.text,
                        );

                        if (success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.green[50],
                              behavior: SnackBarBehavior.floating,
                              content: Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.circleCheck, color: Colors.green),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Đăng nhập thành công!',
                                    style: TextStyle(color: Colors.green[900]),
                                  ),
                                ],
                              ),
                            ),
                          );
                          Navigator.pushReplacementNamed(context, '/home');
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.red[50],
                              behavior: SnackBarBehavior.floating,
                              content: Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.circleExclamation, color: Colors.red),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Số điện thoại hoặc mật khẩu không đúng!',
                                    style: TextStyle(color: Colors.red[900], fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.backgroundPrimaryButton,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Đăng nhập',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w900, color: AppColors.textPrimaryButton),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Nút hỗ trợ
                TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.help_outline, color: Colors.white, size: 20),
                  label: const Text(
                    'Liên hệ chúng tôi để được hỗ trợ',
                    style: TextStyle(color: AppColors.textPrimaryButton, fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFF90CAF9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _labelStyle() {
    return const TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w700,
    );
  }
}
