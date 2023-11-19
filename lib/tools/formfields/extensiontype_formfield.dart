import 'package:eliud_core_model/apis/apis.dart';
import 'package:flutter/material.dart';

import '../../model/app_model.dart';
import '../../style/frontend/has_button.dart';
import '../../style/frontend/has_text.dart';

typedef ExtensionTypeFieldTrigger = Function(String? value);

class ExtensionTypeField extends StatefulWidget {
  final AppModel app;
  final String? value;
  final ExtensionTypeFieldTrigger trigger;

  ExtensionTypeField(this.app, this.value, this.trigger);

  @override
  ExtensionTypeFieldState createState() {
    return ExtensionTypeFieldState();
  }
}

class ExtensionTypeFieldState extends State<ExtensionTypeField> {
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
    var extensions = Apis.apis().getRegistryApi().getExtensions();
    var dropDownItems = extensions
        .map((extension) => DropdownMenuItem(
            value: extension, child: text(widget.app, context, extension)))
        .toList();

    if (extensions.indexWhere((extension) => (extension == value)) == -1) {
      value = null;
    }

    return dropdownButton<String>(widget.app, context,
        value: value,
        items: dropDownItems,
        hint: text(widget.app, context, 'Select component type'),
        onChanged: !memberIdOwner ? null : _onChangedDropDownItem);
  }

  void _onChangedDropDownItem(val) {
    setState(() {
      value = val;
    });
    widget.trigger(val);
  }
}
