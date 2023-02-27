import 'package:flutter/material.dart';
import 'package:sotl/resources/constants/style.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? header;
  final bool isRequired;
  final String hint;
  final bool isPassword;
  final int minLine;
  final Function(String)? onChanged;
  bool isVisible;
  final bool isReadable;
  final Function()? onTap;
  final String? Function(String?)? validator;

  MyTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.onChanged,
      this.minLine = 1,
      this.header,
      this.isRequired = false,
      this.isVisible = false,
      this.isPassword = false,
      this.isReadable = false,
      this.onTap,
      this.validator});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(children: [
          if (widget.header != null)
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(widget.header!, style: const TextStyle(fontSize: 16)),
              const SizedBox(width: 3),
              if (widget.isRequired)
                const Text("*",
                    style: TextStyle(fontSize: 16, color: Colors.red))
            ]),
          const SizedBox(height: 5),
          TextFormField(
              onChanged: widget.onChanged,
              maxLines: widget.minLine,
              readOnly: widget.isReadable,
              validator: widget.validator,
              obscureText: widget.isVisible,
              cursorColor: primary,
              controller: widget.controller,
              decoration: InputDecoration(
                  suffixIcon: widget.isPassword
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              widget.isVisible = !widget.isVisible;
                            });
                          },
                          icon: Icon(
                              widget.isVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.grey),
                        )
                      : null,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  hintText: widget.hint))
        ]));
  }
}
