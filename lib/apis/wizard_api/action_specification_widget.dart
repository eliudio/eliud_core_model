import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/style/frontend/has_list_tile.dart';
import 'package:eliud_core_model/style/frontend/has_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'action_specification.dart';

class ActionSpecificationWidget extends StatefulWidget {
  final AppModel app;
  final String label;
  final ActionSpecification actionSpecification;

  ActionSpecificationWidget({
    super.key,
    required this.app,
    required this.label,
    required this.actionSpecification,
  });

  @override
  State<StatefulWidget> createState() {
    return _ActionSpecificationWidgetState();
  }
}

class _ActionSpecificationWidgetState extends State<ActionSpecificationWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
      h4(widget.app, context, widget.label),
      checkboxListTile(
        widget.app,
        context,
        'AppBar',
        widget.actionSpecification.availableInAppBar,
        (value) {
          setState(() {
            widget.actionSpecification.availableInAppBar = value ?? false;
          });
        },
      ),
      checkboxListTile(
        widget.app,
        context,
        'Home menu',
        widget.actionSpecification.availableInHomeMenu,
        (value) {
          setState(() {
            widget.actionSpecification.availableInHomeMenu = value ?? false;
          });
        },
      ),
      checkboxListTile(
        widget.app,
        context,
        'Left drawer',
        widget.actionSpecification.availableInLeftDrawer,
        (value) {
          setState(() {
            widget.actionSpecification.availableInLeftDrawer = value ?? false;
          });
        },
      ),
      checkboxListTile(widget.app, context, 'Right drawer',
          widget.actionSpecification.availableInRightDrawer, (value) {
        setState(() {
          widget.actionSpecification.availableInRightDrawer = value ?? false;
        });
      }),
      checkboxListTile(widget.app, context, 'Available (not through menu)',
          widget.actionSpecification.available, (value) {
        setState(() {
          widget.actionSpecification.available = value ?? false;
        });
      }),
    ]);
  }
}
