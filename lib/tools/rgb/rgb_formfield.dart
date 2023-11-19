import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../model/app_model.dart';
import '../../model/rgb_model.dart';
import '../../style/frontend/has_container.dart';

typedef ChangeRgbField = Function(RgbModel value);

class RgbField extends StatefulWidget {
  final AppModel app;
  final String label;
  final RgbModel? rgbModel;
  final ChangeRgbField trigger;

  RgbField(this.app, this.label, this.rgbModel, this.trigger);

  @override
  createState() {
    return RgbFieldState();
  }
}

class RgbFieldState extends State<RgbField> {
  Color? color;

  @override
  void initState() {
    super.initState();
    if (widget.rgbModel != null) {
      color = Color.fromRGBO(widget.rgbModel!.r!, widget.rgbModel!.g!,
          widget.rgbModel!.b!, widget.rgbModel!.opacity!);
    } else {
      color = Color.fromRGBO(255, 0, 0, 1.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return topicContainer(widget.app, context,
        title: widget.label,
        collapsible: true,
        collapsed: true,
        children: [
          ColorPicker(
            pickerColor: color!,
            onColorChanged: changeColor,
            //enableLabel: true,
            pickerAreaHeightPercent: 0.8,
          )
        ]);
  }

  void changeColor(Color c) {
    setState(() => color = c);
    var rgbModel =
        RgbModel(r: c.red, g: c.green, b: c.blue, opacity: c.opacity);
    widget.trigger(rgbModel);
  }
}
