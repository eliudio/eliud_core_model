import 'package:eliud_core_model/model/app_model.dart';
import 'package:eliud_core_model/model/pos_size_model.dart';
import 'package:eliud_core_model/style/frontend/has_container.dart';
import 'package:eliud_core_model/style/frontend/has_dialog_field.dart';
import 'package:eliud_core_model/style/frontend/has_list_tile.dart';
import 'package:eliud_core_model/style/frontend/has_text.dart';
import 'package:eliud_core_model/tools/helpers/parse_helper.dart';
import 'package:flutter/material.dart';

import '../pos_size/height_type_landscape.dart';
import '../pos_size/height_type_portrait.dart';
import '../pos_size/landscape_align_type.dart';
import '../pos_size/landscape_fit_type.dart';
import '../pos_size/portrait_align_type.dart';
import '../pos_size/portrait_fit_type.dart';
import '../pos_size/width_type_landscape.dart';
import '../pos_size/width_type_portrait.dart';

class PosSizeWidget extends StatefulWidget {
  final PosSizeModel posSizeModel;
  final AppModel app;
  PosSizeWidget({super.key, required this.app, required this.posSizeModel});

  @override
  State<StatefulWidget> createState() {
    return _PosSizeWidgetState();
  }
}

class _PosSizeWidgetState extends State<PosSizeWidget> {
  @override
  Widget build(BuildContext context) {
    return topicContainer(widget.app, context,
        title: 'Position / Size Settings',
        collapsible: true,
        collapsed: true,
        children: [
          ListView(shrinkWrap: true, physics: ScrollPhysics(), children: [
            h4(widget.app, context, '1. When in portrait mode'),
            h5(widget.app, context, '1.1 Width'),
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.posSizeModel.widthPortrait.toString(),
                  valueChanged: (value) {
                    widget.posSizeModel.widthPortrait = doubleParse(value);
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Width',
                    labelText: 'Width',
                  ),
                )),
            h5(widget.app, context, '1.2 Type'),
            WidthTypePortraitWidget(
              app: widget.app,
              widthTypePortraitCallback: (WidthTypePortrait widthTypePortrait) {
                widget.posSizeModel.widthTypePortrait = widthTypePortrait;
              },
              widthTypePortrait: widget.posSizeModel.widthTypePortrait ??
                  WidthTypePortrait.absoluteWidth,
            ),
            h5(widget.app, context, '1.3 Height'),
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.posSizeModel.heightPortrait.toString(),
                  valueChanged: (value) {
                    widget.posSizeModel.heightPortrait = doubleParse(value);
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Height',
                    labelText: 'Height',
                  ),
                )),
            h5(widget.app, context, '1.4 Type'),
            HeightTypePortraitWidget(
              app: widget.app,
              heightTypePortraitCallback:
                  (HeightTypePortrait heightTypePortrait) {
                widget.posSizeModel.heightTypePortrait = heightTypePortrait;
              },
              heightTypePortrait: widget.posSizeModel.heightTypePortrait ??
                  HeightTypePortrait.absoluteHeight,
            ),
            h5(widget.app, context, '1.5 Fit'),
            PortraitFitTypeWidget(
              app: widget.app,
              portraitFitTypeCallback: (PortraitFitType portraitFitType) {
                widget.posSizeModel.fitPortrait = portraitFitType;
              },
              portraitFitType: widget.posSizeModel.fitPortrait ??
                  PortraitFitType.portraitFitWidth,
            ),
            h5(widget.app, context, '1.6 Align'),
            PortraitAlignTypeWidget(
              app: widget.app,
              portraitAlignTypeCallback: (PortraitAlignType portraitAlignType) {
                widget.posSizeModel.alignTypePortrait = portraitAlignType;
              },
              portraitAlignType: widget.posSizeModel.alignTypePortrait ??
                  PortraitAlignType.portraitAlignCenter,
            ),
            h5(widget.app, context, '2. When in landscape mode'),
            h5(widget.app, context, '2.1 Width'),
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.posSizeModel.widthLandscape.toString(),
                  valueChanged: (value) {
                    widget.posSizeModel.widthLandscape = doubleParse(value);
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Width',
                    labelText: 'Width',
                  ),
                )),
            h5(widget.app, context, '2.2 Type'),
            WidthTypeLandscapeWidget(
              app: widget.app,
              widthTypeLandscapeCallback:
                  (WidthTypeLandscape widthTypeLandscape) {
                widget.posSizeModel.widthTypeLandscape = widthTypeLandscape;
              },
              widthTypeLandscape: widget.posSizeModel.widthTypeLandscape ??
                  WidthTypeLandscape.absoluteWidth,
            ),
            h5(widget.app, context, '2.3 Height'),
            getListTile(context, widget.app,
                leading: Icon(Icons.description),
                title: dialogField(
                  widget.app,
                  context,
                  initialValue: widget.posSizeModel.heightLandscape.toString(),
                  valueChanged: (value) {
                    widget.posSizeModel.heightLandscape = doubleParse(value);
                  },
                  maxLines: 1,
                  decoration: const InputDecoration(
                    hintText: 'Height',
                    labelText: 'Height',
                  ),
                )),
            h5(widget.app, context, '2.4 Type'),
            HeightTypeLandscapeWidget(
              app: widget.app,
              heightTypeLandscapeCallback:
                  (HeightTypeLandscape heightTypeLandscape) {
                widget.posSizeModel.heightTypeLandscape = heightTypeLandscape;
              },
              heightTypeLandscape: widget.posSizeModel.heightTypeLandscape ??
                  HeightTypeLandscape.absoluteHeight,
            ),
            h5(widget.app, context, '2.5 Fit'),
            LandscapeFitTypeWidget(
              app: widget.app,
              landscapeFitTypeCallback: (LandscapeFitType landscapeFitType) {
                widget.posSizeModel.fitLandscape = landscapeFitType;
              },
              landscapeFitType: widget.posSizeModel.fitLandscape ??
                  LandscapeFitType.landscapeFitHeight,
            ),
            h5(widget.app, context, '1.6 Align'),
            LandscapeAlignTypeWidget(
              app: widget.app,
              landscapeAlignTypeCallback:
                  (LandscapeAlignType landscapeAlignType) {
                widget.posSizeModel.alignTypeLandscape = landscapeAlignType;
              },
              landscapeAlignType: widget.posSizeModel.alignTypeLandscape ??
                  LandscapeAlignType.landscapeAlignCenter,
            ),
          ]),
        ]);
  }
}
