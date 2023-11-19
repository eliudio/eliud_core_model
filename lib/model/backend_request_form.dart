/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_form.dart
                       
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

import 'package:eliud_core_model/model/backend_request_list_bloc.dart';
import 'package:eliud_core_model/model/backend_request_list_event.dart';
import 'package:eliud_core_model/model/backend_request_form_bloc.dart';
import 'package:eliud_core_model/model/backend_request_form_event.dart';
import 'package:eliud_core_model/model/backend_request_form_state.dart';

class BackendRequestForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final BackendRequestModel? value;
  final ActionModel? submitAction;

  BackendRequestForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the BackendRequestForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<BackendRequestFormBloc>(
        create: (context) => BackendRequestFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseBackendRequestFormEvent(value: value)),
        child: _MyBackendRequestForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<BackendRequestFormBloc>(
        create: (context) => BackendRequestFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseBackendRequestFormNoLoadEvent(value: value)),
        child: _MyBackendRequestForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update BackendRequest'
                      : 'Add BackendRequest'),
          body: BlocProvider<BackendRequestFormBloc>(
            create: (context) => BackendRequestFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseBackendRequestFormEvent(value: value)
                : InitialiseNewBackendRequestFormEvent())),
            child: _MyBackendRequestForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyBackendRequestForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyBackendRequestForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<_MyBackendRequestForm> createState() =>
      _MyBackendRequestFormState(formAction);
}

class _MyBackendRequestFormState extends State<_MyBackendRequestForm> {
  final FormAction? formAction;
  late BackendRequestFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _authorIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _sendToController = TextEditingController();
  bool? _processedSelection;
  int? _requestTypeSelectedRadioTile;

  _MyBackendRequestFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<BackendRequestFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _authorIdController.addListener(_onAuthorIdChanged);
    _nameController.addListener(_onNameChanged);
    _sendToController.addListener(_onSendToChanged);
    _processedSelection = false;
    _requestTypeSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BackendRequestFormBloc, BackendRequestFormState>(
        builder: (context, state) {
      if (state is BackendRequestFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is BackendRequestFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _descriptionController.text = state.value!.description.toString();
        _authorIdController.text = state.value!.authorId.toString();
        _nameController.text = state.value!.name.toString();
        _sendToController.text = state.value!.sendTo.toString();
        if (state.value!.processed != null) {
          _processedSelection = state.value!.processed;
        } else {
          _processedSelection = false;
        }
        if (state.value!.requestType != null) {
          _requestTypeSelectedRadioTile = state.value!.requestType!.index;
        } else {
          _requestTypeSelectedRadioTile = 0;
        }
      }
      if (state is BackendRequestFormInitialized) {
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
                labelText: 'Author ID',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _authorIdController,
                keyboardType: TextInputType.text,
                validator: (_) => state is AuthorIdBackendRequestFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Author ID',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _nameController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is NameBackendRequestFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'sendTo email address',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _sendToController,
                keyboardType: TextInputType.text,
                validator: (_) => state is SendToBackendRequestFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _requestTypeSelectedRadioTile,
                'requestEmailData',
                'requestEmailData',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionRequestType(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _requestTypeSelectedRadioTile,
                'destroyAccount',
                'destroyAccount',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionRequestType(val)));

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
                validator: (_) => state is DocumentIDBackendRequestFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Description',
                icon: Icons.vpn_key,
                readOnly: _readOnly(context, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) => state is DescriptionBackendRequestFormError
                    ? state.message
                    : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'Processed',
                _processedSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionProcessed(val)));

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
                .groupTitle(widget.app, context, 'Source')));

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
                .groupTitle(widget.app, context, 'Photo')));

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
                        if (state is BackendRequestFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<BackendRequestListBloc>(context)
                                .add(UpdateBackendRequestList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              description: state.value!.description,
                              appId: state.value!.appId,
                              authorId: state.value!.authorId,
                              name: state.value!.name,
                              sendTo: state.value!.sendTo,
                              collections: state.value!.collections,
                              processed: state.value!.processed,
                              requestType: state.value!.requestType,
                            )));
                          } else {
                            BlocProvider.of<BackendRequestListBloc>(context)
                                .add(AddBackendRequestList(
                                    value: BackendRequestModel(
                              documentID: state.value!.documentID,
                              description: state.value!.description,
                              appId: state.value!.appId,
                              authorId: state.value!.authorId,
                              name: state.value!.name,
                              sendTo: state.value!.sendTo,
                              collections: state.value!.collections,
                              processed: state.value!.processed,
                              requestType: state.value!.requestType,
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
        ChangedBackendRequestDocumentID(value: _documentIDController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(
        ChangedBackendRequestDescription(value: _descriptionController.text));
  }

  void _onAuthorIdChanged() {
    _myFormBloc
        .add(ChangedBackendRequestAuthorId(value: _authorIdController.text));
  }

  void _onNameChanged() {
    _myFormBloc.add(ChangedBackendRequestName(value: _nameController.text));
  }

  void _onSendToChanged() {
    _myFormBloc.add(ChangedBackendRequestSendTo(value: _sendToController.text));
  }

  void setSelectionProcessed(bool? val) {
    setState(() {
      _processedSelection = val;
    });
    _myFormBloc.add(ChangedBackendRequestProcessed(value: val));
  }

  void setSelectionRequestType(int? val) {
    setState(() {
      _requestTypeSelectedRadioTile = val;
    });
    _myFormBloc
        .add(ChangedBackendRequestRequestType(value: toRequestType(val)));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    _authorIdController.dispose();
    _nameController.dispose();
    _sendToController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, BackendRequestFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
