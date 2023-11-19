import 'package:eliud_core_model/apis/apis.dart';
import 'package:flutter/material.dart';

import '../../model/app_model.dart';
import '../../style/frontend/has_dialog.dart';
import 'component_spec.dart';

Future<void> updateComponent(
    BuildContext context,
    AppModel app,
    String? componentName,
    String? componentId,
    EditorFeedback editorFeedback) async {
  var appId = app.documentID;
  if (componentName == null) {
    openErrorDialog(app, context, '$appId/_error',
        title: 'Problem', errorMessage: 'Component name is null');
  } else {
    var component =
        Apis.apis().getRegistryApi().getComponentSpecs(componentName);
    if (component == null) {
      openErrorDialog(app, context, '$appId/_error',
          title: 'Problem',
          errorMessage: 'Component specs for $componentName not found');
    } else {
      if (componentId == null) {
        openErrorDialog(app, context, '$appId/_error',
            title: 'Problem',
            errorMessage:
                'Component $componentName with ID $componentId does not exist');
      } else {
        component.editor
            .updateComponentWithID(app, context, componentId, editorFeedback);
      }
    }
  }
}

Future<void> addComponent(BuildContext context, AppModel app,
    String? componentName, EditorFeedback editorFeedback) async {
  var appId = app.documentID;
  if (componentName == null) {
    openErrorDialog(app, context, '$appId/_error',
        title: 'Problem', errorMessage: 'Component name is null');
  } else {
    var component =
        Apis.apis().getRegistryApi().getComponentSpecs(componentName);
    if (component == null) {
      openErrorDialog(app, context, '$appId/_error',
          title: 'Problem',
          errorMessage: 'Component specs for $componentName not found');
    } else {
      component.editor.createNewComponent(app, context, editorFeedback);
    }
  }
}
