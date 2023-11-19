/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_entry_pages_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../tools/bespoke_models.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';

import 'package:eliud_core_model/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'package:eliud_core_model/model/internal_component.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/app_entry_pages_list_bloc.dart';
import 'package:eliud_core_model/model/app_entry_pages_list_event.dart';
import 'package:eliud_core_model/model/app_entry_pages_form_bloc.dart';
import 'package:eliud_core_model/model/app_entry_pages_form_event.dart';
import 'package:eliud_core_model/model/app_entry_pages_form_state.dart';

class AppEntryPagesForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final AppEntryPagesModel? value;
  final ActionModel? submitAction;

  AppEntryPagesForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the AppEntryPagesForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<AppEntryPagesFormBloc>(
        create: (context) => AppEntryPagesFormBloc(
          appId,
        )..add(InitialiseAppEntryPagesFormEvent(value: value)),
        child: _MyAppEntryPagesForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<AppEntryPagesFormBloc>(
        create: (context) => AppEntryPagesFormBloc(
          appId,
        )..add(InitialiseAppEntryPagesFormNoLoadEvent(value: value)),
        child: _MyAppEntryPagesForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update AppEntryPages'
                      : 'Add AppEntryPages'),
          body: BlocProvider<AppEntryPagesFormBloc>(
            create: (context) => AppEntryPagesFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseAppEntryPagesFormEvent(value: value)
                : InitialiseNewAppEntryPagesFormEvent())),
            child: _MyAppEntryPagesForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyAppEntryPagesForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyAppEntryPagesForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyAppEntryPagesForm> createState() =>
      _MyAppEntryPagesFormState(formAction);
}

class _MyAppEntryPagesFormState extends State<_MyAppEntryPagesForm> {
  final FormAction? formAction;
  late AppEntryPagesFormBloc _myFormBloc;

  String? _entryPage;
  final TextEditingController _minPrivilegeController = TextEditingController();

  _MyAppEntryPagesFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AppEntryPagesFormBloc>(context);
    _minPrivilegeController.addListener(_onMinPrivilegeChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppEntryPagesFormBloc, AppEntryPagesFormState>(
        builder: (context, state) {
      if (state is AppEntryPagesFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is AppEntryPagesFormLoaded) {
        if (state.value!.entryPage != null) {
          _entryPage = state.value!.entryPage!.documentID;
        } else {
          _entryPage = "";
        }
        _minPrivilegeController.text = state.value!.minPrivilege.toString();
      }
      if (state is AppEntryPagesFormInitialized) {
        List<Widget> children = [];
        children.add(Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: StyleRegistry.registry()
                .styleWithApp(widget.app)
                .adminFormStyle()
                .groupTitle(widget.app, context, 'General')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "pages",
              value: _entryPage,
              trigger: (value, privilegeLevel) => _onEntryPageSelected(value),
              optional: false),
        );

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'minPrivilege',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _minPrivilegeController,
                keyboardType: TextInputType.number,
                validator: (_) => state is MinPrivilegeAppEntryPagesFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

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
                .groupTitle(widget.app, context, 'Component')));

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
                        if (state is AppEntryPagesFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<AppEntryPagesListBloc>(context)
                                .add(UpdateAppEntryPagesList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              entryPage: state.value!.entryPage,
                              minPrivilege: state.value!.minPrivilege,
                            )));
                          } else {
                            BlocProvider.of<AppEntryPagesListBloc>(context)
                                .add(AddAppEntryPagesList(
                                    value: AppEntryPagesModel(
                              documentID: state.value!.documentID,
                              entryPage: state.value!.entryPage,
                              minPrivilege: state.value!.minPrivilege,
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

  void _onEntryPageSelected(String? val) {
    setState(() {
      _entryPage = val;
    });
    _myFormBloc.add(ChangedAppEntryPagesEntryPage(value: val));
  }

  void _onMinPrivilegeChanged() {
    _myFormBloc.add(
        ChangedAppEntryPagesMinPrivilege(value: _minPrivilegeController.text));
  }

  @override
  void dispose() {
    _minPrivilegeController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, AppEntryPagesFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
