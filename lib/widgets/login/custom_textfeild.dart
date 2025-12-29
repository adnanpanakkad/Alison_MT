import 'package:alisons_mt/utils/constent/appcolors.dart';
import 'package:alisons_mt/utils/constent/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.controller,
    required this.hintText,
    this.validation,
    this.suffixIcon,
    this.keyboardType,
    this.readOnly,
    this.onChanged,
    FocusNode? focusNode,
  });
  final TextEditingController? controller;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String hintText;
  final FormFieldValidator? validation;
  final bool? readOnly;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onChanged: onChanged,
      readOnly: readOnly ?? false,
      keyboardType: keyboardType,
      validator: validation,
      controller: controller,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        contentPadding: const EdgeInsets.all(20),
        hintText: hintText,
        hintStyle: CustomTextStyles.poppinsText(
          Colors.black,
          13,
          FontWeight.w300,
        ),
        fillColor: const Color.fromARGB(255, 253, 253, 253),
        filled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          borderSide: BorderSide(color: Appcolors.buttonColor),
        ),
      ),
    );
  }
}
