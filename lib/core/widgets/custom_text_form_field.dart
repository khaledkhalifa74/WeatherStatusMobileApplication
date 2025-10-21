import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_status_app/core/utils/styles.dart';
import '../utils/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String? placeholder;
  final TextEditingController? controller;
  final TextInputType? inputType;
  final bool? enabled;
  final int? maxLength;
  final bool? autoFocus;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final bool? isOptional;
  final Widget? suffix;
  final Widget? prefix;
  final bool? obscureText;
  final void Function(String)? onChanged;
  final TextStyle? titleStyle;
  final bool? readOnly;
  final FocusNode? focusNode;
  final int? minLines;
  final int? maxLines;
  final void Function(String)? onFieldSubmitted;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.autoFocus,
    this.placeholder,
    this.inputType,
    this.enabled,
    this.maxLength,
    this.validator,
    this.isOptional,
    this.suffix,
    this.obscureText,
    this.onChanged,
    this.titleStyle,
    this.onTap,
    this.readOnly,
    this.focusNode,
    this.minLines, this.maxLines, this.onFieldSubmitted, this.prefix,
  });

  @override
  CustomTextFormFieldState createState() => CustomTextFormFieldState();
}

class CustomTextFormFieldState extends State<CustomTextFormField> {
  // late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    // Add a listener to handle focus changes
    widget.focusNode?.addListener(() {
      if (!widget.focusNode!.hasFocus) {
        // Handle focus loss if needed
        // You can add any additional logic here
      }
    });
  }

  @override
  void dispose() {
    widget.focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: TextFormField(
            maxLines: widget.maxLines??1,
            minLines: widget.minLines??1,
            focusNode: widget.focusNode, // Attach the FocusNode here
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onFieldSubmitted,
            obscureText: widget.obscureText ?? false,
            onTap: () {
              if (widget.focusNode != null) {
                if (widget.focusNode!.hasFocus) {
                  widget.focusNode?.unfocus();
                } else {
                  widget.focusNode?.requestFocus();
                }
                if (widget.onTap != null) {
                  widget.onTap!(); // Call the onTap function if provided
                }
              } else {
                if (widget.onTap != null) {
                  widget.onTap!(); // Call the onTap function if provided
                }
              }
            },
            controller: widget.controller,
            enabled: widget.enabled ?? true,
            maxLength: widget.maxLength,
            readOnly: widget.readOnly ?? false,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            keyboardType: widget.inputType,
            cursorColor: kHintColor,
            autofocus: widget.autoFocus ?? false,
            validator: widget.validator ??
                    (data) {
                  if (data!.isEmpty) {
                    return 'this filed cannot be empty';
                  } else {
                    return null;
                  }
                },
            decoration: InputDecoration(
              filled: true,
              suffixIcon: widget.suffix,
              prefixIcon: widget.prefix,
              hintText: widget.placeholder,
              hintStyle: Styles.textStyle16.copyWith(
                fontWeight: FontWeight.w400,
                color: kHintColor,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  borderSide: BorderSide(
                    color: kBorderColor,
                    width: 1,
                    style: BorderStyle.solid,
                  )),
              border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                      width: 1,
                      color: kBorderColor,
                      style: BorderStyle.solid,
                  )),
              enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                      width: 1, color: kBorderColor, style: BorderStyle.solid)),
              disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                      width: 1,
                      color: Colors.transparent,
                      style: BorderStyle.solid)),
              errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  borderSide: BorderSide(
                      width: 1, color: kErrorColor, style: BorderStyle.solid)),
              fillColor: kFilledColor,
              contentPadding: const EdgeInsets.all(16),
            ),
          ),
        ),
      ],
    );
  }
}