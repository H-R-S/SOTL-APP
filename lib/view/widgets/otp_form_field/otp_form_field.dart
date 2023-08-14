import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../resources/constants/style.dart';

class OtpFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const OtpFormField({super.key, required this.controller, this.validator});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 64,
        width: 64,
        child: TextFormField(
            validator: validator,
            controller: controller,
            cursorColor: primary,
            onSaved: (value) {},
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: primary)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: primary)),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: primary),
                    borderRadius: BorderRadius.circular(30))),
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
              FilteringTextInputFormatter.digitsOnly
            ]));
  }
}
