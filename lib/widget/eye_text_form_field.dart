import 'package:flutter/material.dart' hide Action;
import 'package:flutter/services.dart';

class EyeTextFormField extends StatefulWidget {
  final Key textFormKey;
  final bool initSeeEye;
  final TextEditingController controller;
  final String initialValue;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextStyle style;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final bool autofocus;
  final bool obscureText;
  final bool autocorrect;
  final bool autovalidate;
  final bool maxLengthEnforced;
  final int maxLines;
  final int maxLength;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;

  final bool enableInteractiveSelection;

  final InputCounterWidgetBuilder buildCounter;

  EyeTextFormField({
    Key key,
    this.controller,
    this.initSeeEye = true,
    this.textFormKey,
    this.initialValue,
    this.focusNode,
    this.decoration = const InputDecoration(),
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.obscureText = false,
    this.autocorrect = true,
    this.autovalidate = false,
    this.maxLengthEnforced = true,
    this.maxLines = 1,
    this.maxLength,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.buildCounter,
  }) : super(key: key);

  @override
  _EyeTextFormFieldState createState() => _EyeTextFormFieldState();
}

class _EyeTextFormFieldState extends State<EyeTextFormField> {
  bool seeEye;

  @override
  void initState() {
    super.initState();
    seeEye = widget.initSeeEye;
  }

  @override
  Widget build(BuildContext context) {
    var decoration = (widget.decoration ?? InputDecoration()).copyWith(
        suffixIcon: IconButton(
      icon: Image.asset(seeEye
          ? "assets/icon_see_password.png"
          : "assets/icon_no_see_password.png"),
      onPressed: () {
        setState(() {
          seeEye = !seeEye;
        });
      },
    ));
    return TextFormField(
        key: widget.textFormKey,
        controller: widget.controller,
        initialValue: widget.initialValue,
        focusNode: widget.focusNode,
        decoration: decoration,
        keyboardType: widget.keyboardType,
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.textInputAction,
        style: widget.style,
        textDirection: widget.textDirection,
        textAlign: widget.textAlign,
        autofocus: widget.autofocus,
        obscureText: !seeEye,
        autocorrect: widget.autocorrect,
        autovalidate: widget.autovalidate,
        maxLengthEnforced: widget.maxLengthEnforced,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled,
        cursorWidth: widget.cursorWidth,
        cursorRadius: widget.cursorRadius,
        cursorColor: widget.cursorColor,
        keyboardAppearance: widget.keyboardAppearance,
        scrollPadding: widget.scrollPadding,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        buildCounter: widget.buildCounter);
  }
}
