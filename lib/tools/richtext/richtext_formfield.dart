import 'package:eliud_core_model/apis/apis.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../model/app_model.dart';
import '../../style/frontend/has_text_form_field.dart';

typedef RichTextFieldTrigger = Function(String value);

class RichTextField extends StatefulWidget {
  final AppModel app;
  final String value;
  final RichTextFieldTrigger trigger;
  final String label;
  final String hint;
  final int rows;

  RichTextField(
      this.app, this.value, this.trigger, this.label, this.hint, this.rows);

  @override
  createState() {
    return RichTextFieldState();
  }
}

class RichTextFieldState extends State<RichTextField> {
  String? value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    var memberIdOwner =
        Apis.apis().getCoreApi().memberIsOwner(context, widget.app.documentID);
    return textFormField(
      widget.app,
      context,
      readOnly: !memberIdOwner,
      initialValue: value,
      onChanged: _onChanged,
      keyboardType: TextInputType.multiline,
      maxLines: widget.rows,
    );
  }

  void _onChanged(val) {
    setState(() {
      value = val;
    });
    widget.trigger(val);
  }
}
