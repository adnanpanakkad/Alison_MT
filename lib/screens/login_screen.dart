import 'package:alisons_mt/screens/bottombar_screen.dart';
import 'package:alisons_mt/services/login_controller.dart';
import 'package:alisons_mt/utils/constent/text_styles.dart';
import 'package:alisons_mt/widgets/login/custom_button.dart';
import 'package:alisons_mt/widgets/login/custom_textfeild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    var screeWidth = MediaQuery.of(context).size.width;
    var screeHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/login_image.png',
                  width: double.infinity,
                  height: screeHeight * 0.44,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 16,
                  right: 16,
                  child: TextButton(
                    onPressed: () {
                      Get.to(() => const BottombarScreens());
                    },
                    child: Row(
                      children: [
                        Text(
                          'Skip',
                          style: CustomTextStyles.syneText(
                            Colors.white,
                            15,
                            FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Login Form Section
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: CustomTextStyles.syneText(
                        Colors.black,
                        30,
                        FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Email Field
                    Text(
                      'Email Address',
                      style: CustomTextStyles.poppinsText(
                        Colors.black,
                        14,
                        FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextfield(
                      validation: (value) => controller.validateEmail(value),
                      hintText: "Enter your email",
                      controller: controller.emailController,
                      focusNode: FocusNode(),
                    ),
                    const SizedBox(height: 10),

                    // Password Field
                    Text(
                      'Password',
                      style: CustomTextStyles.poppinsText(
                        Colors.black,
                        14,
                        FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CustomTextfield(
                      validation: (value) => controller.validatePassword(value),
                      hintText: "Enter your password",
                      controller: controller.passwordController,
                      focusNode: FocusNode(),
                      //isPassword: true,
                    ),
                    // Forgot Password
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot password?',
                          style: CustomTextStyles.syneText(
                            Colors.black,
                            15,
                            FontWeight.w300,
                          ).copyWith(decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),

                    Obx(
                      () => CustomButton(
                        text: controller.isLoading.value
                            ? 'Loading...'
                            : 'Login',
                        onTap: controller.isLoading.value
                            ? null
                            : () => controller.login(),
                      ),
                    ),

                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an account? ",
                          style: CustomTextStyles.syneText(
                            Colors.black,
                            13,
                            FontWeight.w400,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // to sign up
                          },
                          child: Text(
                            'Sign Up',
                            style: CustomTextStyles.syneText(
                              Colors.black,
                              14,
                              FontWeight.w500,
                            ).copyWith(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
