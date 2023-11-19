/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_def_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../tools/bespoke_models.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';

import 'package:eliud_core_model/apis/apis.dart';

import 'package:eliud_core_model/tools/etc/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'package:eliud_core_model/model/embedded_component.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/menu_def_list_bloc.dart';
import 'package:eliud_core_model/model/menu_def_list_event.dart';
import 'package:eliud_core_model/model/menu_def_form_bloc.dart';
import 'package:eliud_core_model/model/menu_def_form_event.dart';
import 'package:eliud_core_model/model/menu_def_form_state.dart';

class MenuDefForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final MenuDefModel? value;
  final ActionModel? submitAction;

  MenuDefForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the MenuDefForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<MenuDefFormBloc>(
        create: (context) => MenuDefFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseMenuDefFormEvent(value: value)),
        child: _MyMenuDefForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<MenuDefFormBloc>(
        create: (context) => MenuDefFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseMenuDefFormNoLoadEvent(value: value)),
        child: _MyMenuDefForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update MenuDef'
                      : 'Add MenuDef'),
          body: BlocProvider<MenuDefFormBloc>(
            create: (context) => MenuDefFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseMenuDefFormEvent(value: value)
                : InitialiseNewMenuDefFormEvent())),
            child: _MyMenuDefForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyMenuDefForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyMenuDefForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyMenuDefForm> createState() => _MyMenuDefFormState(formAction);
}

class _MyMenuDefFormState extends State<_MyMenuDefForm> {
  final FormAction? formAction;
  late MenuDefFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  _MyMenuDefFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<MenuDefFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _nameController.addListener(_onNameChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MenuDefFormBloc, MenuDefFormState>(
        builder: (context, state) {
      if (state is MenuDefFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is MenuDefFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _nameController.text = state.value!.name.toString();
      }
      if (state is MenuDefFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

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
                .groupTitle(widget.app, context, 'General')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Document ID',
                icon: Icons.vpn_key,
                readOnly: (formAction == FormAction.updateAction),
                textEditingController: _documentIDController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DocumentIDMenuDefFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Name',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _nameController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is NameMenuDefFormError ? state.message : null,
                hintText: null));

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
                .groupTitle(widget.app, context, 'Menu items')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: menuItemsList(widget.app, context, state.value!.menuItems,
                _onMenuItemsChanged)));

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
                        if (state is MenuDefFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<MenuDefListBloc>(context)
                                .add(UpdateMenuDefList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              menuItems: state.value!.menuItems,
                              admin: state.value!.admin,
                            )));
                          } else {
                            BlocProvider.of<MenuDefListBloc>(context)
                                .add(AddMenuDefList(
                                    value: MenuDefModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              name: state.value!.name,
                              menuItems: state.value!.menuItems,
                              admin: state.value!.admin,
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

  void _onDocumentIDChanged() {
    _myFormBloc
        .add(ChangedMenuDefDocumentID(value: _documentIDController.text));
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedMenuDefName(value: _nameController.text));
  }

  void _onMenuItemsChanged(value) {
    _myFormBloc.add(ChangedMenuDefMenuItems(value: value));
    setState(() {});
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, MenuDefFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
