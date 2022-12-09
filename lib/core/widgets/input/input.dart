import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatefulWidget {
  final String placeholder;
  final bool obscure;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final String emptyErrorText;
  final String regexErrorText;
  final RegExp? regExp;
  final int maxLines;
  final String? initialValue;
  final List<TextInputFormatter>? formatters;
  final void Function(String?)? onSaved;

  const Input({
    this.placeholder = '',
    this.obscure = false,
    this.prefix,
    this.validator,
    this.regexErrorText = '',
    this.emptyErrorText = '',
    this.regExp,
    this.maxLines = 1,
    this.initialValue,
    this.formatters,
    this.onSaved,
    super.key,
  });

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  late bool _obscure;

  @override
  void initState() {
    _obscure = widget.obscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscure,
      validator: _defaultValidator,
      maxLines: widget.maxLines,
      initialValue: widget.initialValue,
      inputFormatters: widget.formatters,
      onSaved: widget.onSaved,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).dividerColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).primaryColor,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).errorColor,
            width: 1.5,
          ),
        ),
        prefixIcon: widget.prefix,
        suffixIcon: _suffixIcon(),
        filled: true,
        fillColor: Theme.of(context).backgroundColor,
        labelText: widget.placeholder,
      ),
    );
  }

  Widget? _suffixIcon() {
    if (!widget.obscure) return null;
    return IconButton(
      icon: Icon(
        _obscure ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: () {
        setState(() {
          _obscure = !_obscure;
        });
      },
    );
  }

  String? _defaultValidator(String? value) {
    if (widget.validator != null) return widget.validator!(value);

    if (value == null || value.isEmpty) {
      return widget.emptyErrorText;
    }

    if (widget.regExp != null) {
      return widget.regExp!.hasMatch(value) ? null : widget.regexErrorText;
    }

    return null;
  }
}
