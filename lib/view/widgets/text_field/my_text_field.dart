// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? header;
  final bool isRequired;
  final String hint;
  final bool isPassword;
  final int minLine;
  final double? contentPadding;
  final Function(String)? onChanged;
  List<String>? dropDownList;
  bool isVisible;
  final bool isReadable;
  final Function()? onTap, onEditingComplete;
  final String? Function(String?)? validator;

  MyTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.onEditingComplete,
      this.dropDownList,
      this.onChanged,
      this.contentPadding,
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
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(children: [
          if (widget.header != null)
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Text(widget.header!,
                  style: TextStyle(fontSize: 16, color: Styles.fontColor)),
              const SizedBox(width: 3),
              if (widget.isRequired)
                const Text("*",
                    style: TextStyle(fontSize: 16, color: Colors.red))
            ]),
          const SizedBox(height: 5),
          TextFormField(
              onEditingComplete: widget.onEditingComplete,
              onChanged: widget.onChanged,
              maxLines: widget.minLine,
              readOnly: widget.isReadable,
              validator: widget.validator,
              obscureText: widget.isVisible,
              cursorColor: primary,
              controller: widget.controller,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  labelStyle: TextStyle(color: Styles.fontColor),
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
                              color: Colors.grey))
                      : widget.dropDownList != null
                          ? PopupMenuButton<String>(
                              position: PopupMenuPosition.under,
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.grey),
                              onSelected: (String value) {
                                widget.controller.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return widget.dropDownList!
                                    .map<PopupMenuItem<String>>((String value) {
                                  return PopupMenuItem(
                                      value: value, child: Text(value));
                                }).toList();
                              })
                          : null,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.grey)),
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
