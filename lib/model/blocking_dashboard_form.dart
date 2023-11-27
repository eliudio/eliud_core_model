/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_main/model/app_model.dart';
import 'package:eliud_core_main/apis/action_api/action_model.dart';

import 'package:eliud_core_main/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_main/apis/style/style_registry.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_main/model/model_export.dart';
import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/blocking_dashboard_list_bloc.dart';
import 'package:eliud_core_model/model/blocking_dashboard_list_event.dart';
import 'package:eliud_core_model/model/blocking_dashboard_model.dart';
import 'package:eliud_core_model/model/blocking_dashboard_form_bloc.dart';
import 'package:eliud_core_model/model/blocking_dashboard_form_event.dart';
import 'package:eliud_core_model/model/blocking_dashboard_form_state.dart';

class BlockingDashboardForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final BlockingDashboardModel? value;
  final ActionModel? submitAction;

  BlockingDashboardForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the BlockingDashboardForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<BlockingDashboardFormBloc>(
        create: (context) => BlockingDashboardFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseBlockingDashboardFormEvent(value: value)),
        child: _MyBlockingDashboardForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<BlockingDashboardFormBloc>(
        create: (context) => BlockingDashboardFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseBlockingDashboardFormNoLoadEvent(value: value)),
        child: _MyBlockingDashboardForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update BlockingDashboard'
                      : 'Add BlockingDashboard'),
          body: BlocProvider<BlockingDashboardFormBloc>(
            create: (context) => BlockingDashboardFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseBlockingDashboardFormEvent(value: value)
                : InitialiseNewBlockingDashboardFormEvent())),
            child: _MyBlockingDashboardForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyBlockingDashboardForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyBlockingDashboardForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<_MyBlockingDashboardForm> createState() =>
      _MyBlockingDashboardFormState(formAction);
}

class _MyBlockingDashboardFormState extends State<_MyBlockingDashboardForm> {
  final FormAction? formAction;
  late BlockingDashboardFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _appIdController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  _MyBlockingDashboardFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<BlockingDashboardFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _appIdController.addListener(_onAppIdChanged);
    _descriptionController.addListener(_onDescriptionChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlockingDashboardFormBloc, BlockingDashboardFormState>(
        builder: (context, state) {
      if (state is BlockingDashboardFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is BlockingDashboardFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _appIdController.text = state.value!.appId.toString();
        _descriptionController.text = state.value!.description.toString();
      }
      if (state is BlockingDashboardFormInitialized) {
        List<Widget> children = [];
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
                validator: (_) => state is DocumentIDBlockingDashboardFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'App Identifier',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _appIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is AppIdBlockingDashboardFormError
                    ? state.message
                    : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Description',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionBlockingDashboardFormError
                    ? state.message
                    : null,
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
                .groupTitle(widget.app, context, 'Conditions')));

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
                        if (state is BlockingDashboardFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<BlockingDashboardListBloc>(context)
                                .add(UpdateBlockingDashboardList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<BlockingDashboardListBloc>(context)
                                .add(AddBlockingDashboardList(
                                    value: BlockingDashboardModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              conditions: state.value!.conditions,
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
    _myFormBloc.add(
        ChangedBlockingDashboardDocumentID(value: _documentIDController.text));
  }

  void _onAppIdChanged() {
    _myFormBloc
        .add(ChangedBlockingDashboardAppId(value: _appIdController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedBlockingDashboardDescription(
        value: _descriptionController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _appIdController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, BlockingDashboardFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
