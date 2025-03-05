// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/config/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class KTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final TextInputType keyboardType;
  final bool obscureText;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextInputAction textInputAction;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onClear;
  final Function(String)? onChanged;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;

  const KTextFormField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.fontSize = 16.0,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.textInputAction = TextInputAction.done,
    this.validator,
    this.onClear,
    this.onChanged,
    this.maxLines,
    this.minLines,
    this.inputFormatters,
  });

  @override
  _KTextFormFieldState createState() => _KTextFormFieldState();
}

class _KTextFormFieldState extends State<KTextFormField> {
  late TextEditingController _controller;
  late ValueNotifier<String> _textNotifier;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    _textNotifier = ValueNotifier<String>(_controller.text);

    _controller.addListener(() {
      _textNotifier.value = _controller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: _textNotifier,
      builder: (context, text, child) {
        return TextFormField(
          inputFormatters: widget.inputFormatters,
          minLines: widget.minLines ?? 1,
          maxLines: widget.maxLines ?? 1,
          onChanged: widget.onChanged,
          controller: _controller,
          keyboardType: widget.keyboardType,
          obscureText: widget.obscureText,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hint,
            labelStyle: TextStyle(
              fontSize: widget.fontSize,
              color: widget.color,
              fontWeight: widget.fontWeight,
            ),
            hintStyle: TextStyle(
              fontSize: widget.fontSize,
              color: widget.color.withOpacity(0.6),
              fontWeight: widget.fontWeight,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: widget.color),
            ),
            suffixIcon: text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear,
                      color: widget.color.withOpacity(0.6),
                    ),
                    onPressed: () {
                      _controller.clear();
                      _textNotifier.value = ''; // Update the notifier when cleared
                      if (widget.onClear != null) {
                        widget.onClear!(); // Call the callback when the clear button is pressed
                      }
                    },
                  )
                : null,
          ),
          style: AppTextStyle.textStyle(
            context: context,
            fontSize: widget.fontSize,
            fontWeight: widget.fontWeight,
            color: widget.color,
          ),
        );
      },
    );
  }
}
