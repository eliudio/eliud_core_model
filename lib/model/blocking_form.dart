/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../tools/bespoke_models.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';

import 'package:eliud_core_model/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/blocking_list_bloc.dart';
import 'package:eliud_core_model/model/blocking_list_event.dart';
import 'package:eliud_core_model/model/blocking_form_bloc.dart';
import 'package:eliud_core_model/model/blocking_form_event.dart';
import 'package:eliud_core_model/model/blocking_form_state.dart';

class BlockingForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final BlockingModel? value;
  final ActionModel? submitAction;

  BlockingForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the BlockingForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<BlockingFormBloc>(
        create: (context) => BlockingFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseBlockingFormEvent(value: value)),
        child: _MyBlockingForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<BlockingFormBloc>(
        create: (context) => BlockingFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseBlockingFormNoLoadEvent(value: value)),
        child: _MyBlockingForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Blocking'
                      : 'Add Blocking'),
          body: BlocProvider<BlockingFormBloc>(
            create: (context) => BlockingFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseBlockingFormEvent(value: value)
                : InitialiseNewBlockingFormEvent())),
            child: _MyBlockingForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyBlockingForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyBlockingForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyBlockingForm> createState() => _MyBlockingFormState(formAction);
}

class _MyBlockingFormState extends State<_MyBlockingForm> {
  final FormAction? formAction;
  late BlockingFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _memberBlockingController =
      TextEditingController();
  final TextEditingController _memberBeingBlockedController =
      TextEditingController();

  _MyBlockingFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<BlockingFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _memberBlockingController.addListener(_onMemberBlockingChanged);
    _memberBeingBlockedController.addListener(_onMemberBeingBlockedChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BlockingFormBloc, BlockingFormState>(
        builder: (context, state) {
      if (state is BlockingFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is BlockingFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _memberBlockingController.text = state.value!.memberBlocking.toString();
        _memberBeingBlockedController.text =
            state.value!.memberBeingBlocked.toString();
      }
      if (state is BlockingFormInitialized) {
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
                validator: (_) =>
                    state is DocumentIDBlockingFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'The member that is blocking another member',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _memberBlockingController,
                keyboardType: TextInputType.text,
                validator: (_) => state is MemberBlockingBlockingFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'The member being blocked by another member',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _memberBeingBlockedController,
                keyboardType: TextInputType.text,
                validator: (_) => state is MemberBeingBlockedBlockingFormError
                    ? state.message
                    : null,
                hintText: null));

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
                        if (state is BlockingFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<BlockingListBloc>(context)
                                .add(UpdateBlockingList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              memberBlocking: state.value!.memberBlocking,
                              memberBeingBlocked:
                                  state.value!.memberBeingBlocked,
                            )));
                          } else {
                            BlocProvider.of<BlockingListBloc>(context)
                                .add(AddBlockingList(
                                    value: BlockingModel(
                              documentID: state.value!.documentID,
                              memberBlocking: state.value!.memberBlocking,
                              memberBeingBlocked:
                                  state.value!.memberBeingBlocked,
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
        .add(ChangedBlockingDocumentID(value: _documentIDController.text));
  }

  void _onMemberBlockingChanged() {
    _myFormBloc.add(
        ChangedBlockingMemberBlocking(value: _memberBlockingController.text));
  }

  void _onMemberBeingBlockedChanged() {
    _myFormBloc.add(ChangedBlockingMemberBeingBlocked(
        value: _memberBeingBlockedController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _memberBlockingController.dispose();
    _memberBeingBlockedController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, BlockingFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
