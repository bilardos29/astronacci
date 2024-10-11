import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RoundedTextField extends StatefulWidget {
  const RoundedTextField({
    super.key,
    this.onChanged,
    this.onFocus,
    this.onUnFocus,
    this.radius = 5,
    this.maxLines = 1,
    this.maxLength,
    this.textInputType = TextInputType.text,
    this.prefix,
    this.suffix,
    this.fillColor,
    this.hintText,
    this.obscureText = false,
    this.translateLabel = true,
    this.disabled = false,
    this.margin,
    this.textCapitalization,
    required this.textController,
  });
  final Function(String value)? onChanged;
  final Function()? onFocus;
  final Function()? onUnFocus;
  final double radius;
  final int maxLines;
  final int? maxLength;
  final TextInputType textInputType;
  final Widget? prefix;
  final Widget? suffix;
  final Color? fillColor;
  final String? hintText;
  final TextEditingController textController;
  final bool obscureText;
  final bool translateLabel;
  final bool disabled;
  final EdgeInsets? margin;
  final TextCapitalization? textCapitalization;

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  final hintTranslation = Rxn<String>();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    hintTranslation(widget.hintText);
    if (widget.onFocus != null || widget.onUnFocus != null) {
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          if (widget.onFocus != null) {
            widget.onFocus!();
          }
        } else {
          if (widget.onUnFocus != null) {
            widget.onUnFocus!();
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () {
            return Container(
              height: widget.maxLines == 1 ? 50 : null,
              // color: Colors.amber,
              width: double.maxFinite,
              child: TextField(
                enabled: !widget.disabled,
                obscureText: widget.obscureText,
                controller: widget.textController,
                keyboardType: widget.maxLines > 1
                    ? TextInputType.multiline
                    : widget.textInputType,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14,
                    ),
                textCapitalization:
                    widget.textCapitalization ?? TextCapitalization.sentences,
                decoration: InputDecoration(
                  hintText: hintTranslation.value,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  fillColor:
                      widget.disabled ? Colors.grey.shade300 : widget.fillColor,
                  filled: widget.fillColor == null ? false : true,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(widget.radius),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                  prefixIcon: widget.prefix,
                  suffixIcon: widget.suffix,
                ),
                maxLines: widget.maxLines,
                maxLength: widget.maxLength,
                buildCounter: (
                  context, {
                  required currentLength,
                  required isFocused,
                  maxLength,
                }) =>
                    null,
                onChanged: (String value) {
                  if (widget.onChanged != null) {
                    widget.onChanged!(value);
                  }
                },
                focusNode: focusNode,
              ),
            );
          },
        ),
      ],
    );
  }
}
