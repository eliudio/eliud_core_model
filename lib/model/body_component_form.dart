/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 body_component_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../tools/bespoke_models.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';

import 'package:eliud_core_model/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'package:eliud_core_model/tools/bespoke_formfields.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/body_component_list_bloc.dart';
import 'package:eliud_core_model/model/body_component_list_event.dart';
import 'package:eliud_core_model/model/body_component_form_bloc.dart';
import 'package:eliud_core_model/model/body_component_form_event.dart';
import 'package:eliud_core_model/model/body_component_form_state.dart';

class BodyComponentForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final BodyComponentModel? value;
  final ActionModel? submitAction;

  BodyComponentForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the BodyComponentForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<BodyComponentFormBloc>(
        create: (context) => BodyComponentFormBloc(
          appId,
        )..add(InitialiseBodyComponentFormEvent(value: value)),
        child: _MyBodyComponentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<BodyComponentFormBloc>(
        create: (context) => BodyComponentFormBloc(
          appId,
        )..add(InitialiseBodyComponentFormNoLoadEvent(value: value)),
        child: _MyBodyComponentForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update BodyComponent'
                      : 'Add BodyComponent'),
          body: BlocProvider<BodyComponentFormBloc>(
            create: (context) => BodyComponentFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseBodyComponentFormEvent(value: value)
                : InitialiseNewBodyComponentFormEvent())),
            child: _MyBodyComponentForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyBodyComponentForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyBodyComponentForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyBodyComponentForm> createState() =>
      _MyBodyComponentFormState(formAction);
}

class _MyBodyComponentFormState extends State<_MyBodyComponentForm> {
  final FormAction? formAction;
  late BodyComponentFormBloc _myFormBloc;

  _MyBodyComponentFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<BodyComponentFormBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BodyComponentFormBloc, BodyComponentFormState>(
        builder: (context, state) {
      if (state is BodyComponentFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is BodyComponentFormLoaded) {}
      if (state is BodyComponentFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Component')));

        children.add(ExtensionTypeField(
            widget.app, state.value!.componentName, _onComponentNameChanged));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'Component spec')));

        children.add(ComponentIdField(widget.app,
            componentName: state.value!.componentName,
            originalValue: state.value!.componentId,
            trigger: (value, _) => _onComponentIdChanged(value)));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if ((formAction != FormAction.showData) &&
            (formAction != FormAction.showPreloadedData)) {
          children.add(StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminFormStyle()
              .button(
                widget.app,
                context,
                label: 'Submit',
                onPressed: _readOnly(context, state)
                    ? null
                    : () {
                        if (state is BodyComponentFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<BodyComponentListBloc>(context)
                                .add(UpdateBodyComponentList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              componentName: state.value!.componentName,
                              componentId: state.value!.componentId,
                            )));
                          } else {
                            BlocProvider.of<BodyComponentListBloc>(context)
                                .add(AddBodyComponentList(
                                    value: BodyComponentModel(
                              documentID: state.value!.documentID,
                              componentName: state.value!.componentName,
                              componentId: state.value!.componentId,
                            )));
                          }
                          if (widget.submitAction != null) {
                            Apis.apis()
                                .getRouterApi()
                                .navigateTo(context, widget.submitAction!);
                          } else {
                            Navigator.pop(context);
                          }
                        }
                      },
              ));
        }

        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .container(
                widget.app,
                context,
                Form(
                  child: ListView(
                      padding: const EdgeInsets.all(8),
                      physics: ((formAction == FormAction.showData) ||
                              (formAction == FormAction.showPreloadedData))
                          ? NeverScrollableScrollPhysics()
                          : null,
                      shrinkWrap: ((formAction == FormAction.showData) ||
                          (formAction == FormAction.showPreloadedData)),
                      children: children),
                ),
                formAction!);
      } else {
        return StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminListStyle()
            .progressIndicator(widget.app, context);
      }
    });
  }

  void _onComponentNameChanged(value) {
    _myFormBloc.add(ChangedBodyComponentComponentName(value: value));
  }

  void _onComponentIdChanged(value) {
    _myFormBloc.add(ChangedBodyComponentComponentId(value: value));
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, BodyComponentFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
