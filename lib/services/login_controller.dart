import 'package:alisons_mt/screens/bottombar_screen.dart';
import 'package:alisons_mt/screens/home_screen.dart';
import 'package:alisons_mt/services/api/auth_repo.dart';
import 'package:alisons_mt/utils/constent/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final loginFormKey = GlobalKey<FormState>();

  final isPasswordHidden = true.obs;
  final isLoading = false.obs;

  final AuthenticationRepository authRepo = Get.put(AuthenticationRepository());

  // ---------------- Validators ----------------

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter an email address';
    }
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
    );
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    return null;
  }

  // ---------------- Actions ----------------

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    if (!loginFormKey.currentState!.validate()) {
      CustomSnackbar.show(
        title: 'Error',
        description: 'Please enter valid credentials',
        backgroundColor: Colors.red.shade600,
        icon: const Icon(Icons.cancel_outlined, color: Colors.white),
      );
      return;
    }

    try {
      isLoading.value = true;

      final String? loginSuccess = await authRepo.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (loginSuccess == null) {
        CustomSnackbar.show(
          title: 'Error',
          description: 'Something went wrong. Please try again later.',
          backgroundColor: Colors.red.shade600,
          icon: const Icon(Icons.cancel_outlined, color: Colors.white),
        );
        return;
      }

      // ✅ Success
      emailController.clear();
      passwordController.clear();

      Get.to(() => const BottombarScreens());
    } catch (e) {
      CustomSnackbar.show(
        title: 'Login Failed',
        description: 'The email or password you entered is incorrect',
        backgroundColor: Colors.red.shade600,
        icon: const Icon(Icons.error, color: Colors.white),
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
