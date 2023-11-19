import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/has_button.dart';
import 'package:eliud_core_model/style/frontend/has_divider.dart';
import 'package:eliud_core_model/style/frontend/has_text.dart';
import 'package:flutter/material.dart';

typedef VoidCallbackFutureSuccess = Future<bool> Function();

class HeaderWidget extends StatefulWidget {
  final AppModel app;
  final String title;
  final VoidCallbackFutureSuccess? cancelAction;
  final VoidCallbackFutureSuccess? okAction;

  HeaderWidget({
    super.key,
    required this.app,
    required this.title,
    this.cancelAction,
    this.okAction,
  });

  @override
  State<StatefulWidget> createState() {
    return _HeaderWidgetState();
  }
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      Row(children: [
        h5(widget.app, context, widget.title),
        Spacer(),
        if (widget.cancelAction != null)
          iconButton(widget.app, context, onPressed: () {
            widget.cancelAction!();
            Navigator.of(context).pop();
          }, icon: Icon(Icons.cancel), tooltip: 'Cancel'),
        if (widget.okAction != null)
          iconButton(widget.app, context, onPressed: () async {
            // apply and save
            if (await widget.okAction!()) Navigator.of(context).pop();
          }, icon: Icon(Icons.check), tooltip: 'Ok'),
      ]),
      divider(widget.app, context)
    ]);
  }
}
