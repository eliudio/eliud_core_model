import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/has_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogField extends StatefulWidget {
  final AppModel app;
  final InputDecoration? decoration;
  final ValueChanged<String> valueChanged;
  final String? initialValue;

  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final TextAlignVertical? textAlignVertical;
  final TextDirection? textDirection;
  final bool? readOnly;
  //ToolbarOptions? toolbarOptions;
  final bool? showCursor;
  final bool? autocorrect;
  final bool? enableSuggestions;
  final int? maxLines;
  final int? minLines;
  final bool? expands;
  final int? maxLength;

  DialogField({
    super.key,
    required this.app,
    this.decoration,
    required this.valueChanged,
    this.inputFormatters,
    this.initialValue,
    this.keyboardType,
    this.textCapitalization,
    this.textAlign,
    this.textAlignVertical,
    this.textDirection,
    this.readOnly,
    //this.toolbarOptions,
    this.showCursor,
    this.autocorrect,
    this.enableSuggestions,
    this.maxLines,
    this.minLines,
    this.expands,
    this.maxLength,
  });

  @override
  State<StatefulWidget> createState() {
    return _DialogFieldState();
  }
}

class _DialogFieldState extends State<DialogField> {
  final myController = TextEditingController();

/*
  @override
  void initState() {
    super.initState();
    myController.addListener(_fieldChanged);
    if (widget.initialValue != null) {
      myController.text = widget.initialValue!;
    }
  }

*/
  void _fieldChanged(String value) {
    widget.valueChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: _fieldChanged,
      initialValue: widget.initialValue,
      decoration: widget.decoration,
      //controller: myController,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      textCapitalization: widget.textCapitalization == null
          ? TextCapitalization.none
          : widget.textCapitalization!,
      textAlign: widget.textAlign == null ? TextAlign.start : widget.textAlign!,
      textAlignVertical: widget.textAlignVertical,
      textDirection: widget.textDirection,
      readOnly: widget.readOnly == null ? false : widget.readOnly!,
      //toolbarOptions: widget.toolbarOptions,
      showCursor: widget.showCursor,
      autocorrect: widget.autocorrect == null ? true : widget.autocorrect!,
      enableSuggestions:
          widget.enableSuggestions == null ? true : widget.enableSuggestions!,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      expands: widget.expands == null ? false : widget.expands!,
      maxLength: widget.maxLength,
      style: styleText(widget.app, context),
    );
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
