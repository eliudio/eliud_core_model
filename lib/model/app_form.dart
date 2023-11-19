/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/model/app_model.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';

import 'package:eliud_core_model/apis/apis.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'package:eliud_core_model/model/internal_component.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/app_list_bloc.dart';
import 'package:eliud_core_model/model/app_list_event.dart';
import 'package:eliud_core_model/model/app_form_bloc.dart';
import 'package:eliud_core_model/model/app_form_event.dart';
import 'package:eliud_core_model/model/app_form_state.dart';

class AppForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final AppModel? value;
  final ActionModel? submitAction;

  AppForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the AppForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<AppFormBloc>(
        create: (context) => AppFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseAppFormEvent(value: value)),
        child: _MyAppForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<AppFormBloc>(
        create: (context) => AppFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialiseAppFormNoLoadEvent(value: value)),
        child: _MyAppForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update App'
                      : 'Add App'),
          body: BlocProvider<AppFormBloc>(
            create: (context) => AppFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialiseAppFormEvent(value: value)
                : InitialiseNewAppFormEvent())),
            child: _MyAppForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyAppForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyAppForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyAppForm> createState() => _MyAppFormState(formAction);
}

class _MyAppFormState extends State<_MyAppForm> {
  final FormAction? formAction;
  late AppFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _homeURLController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  int? _appStatusSelectedRadioTile;
  String? _anonymousProfilePhoto;
  String? _logo;
  final TextEditingController _styleFamilyController = TextEditingController();
  final TextEditingController _styleNameController = TextEditingController();
  bool? _autoPrivileged1Selection;
  bool? _isFeaturedSelection;
  bool? _includeShippingAddressSelection;
  bool? _includeInvoiceAddressSelection;
  bool? _includeSubscriptionsSelection;
  final TextEditingController _welcomeMessageController =
      TextEditingController();

  _MyAppFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<AppFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _titleController.addListener(_onTitleChanged);
    _homeURLController.addListener(_onHomeURLChanged);
    _emailController.addListener(_onEmailChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _appStatusSelectedRadioTile = 0;
    _styleFamilyController.addListener(_onStyleFamilyChanged);
    _styleNameController.addListener(_onStyleNameChanged);
    _autoPrivileged1Selection = false;
    _isFeaturedSelection = false;
    _includeShippingAddressSelection = false;
    _includeInvoiceAddressSelection = false;
    _includeSubscriptionsSelection = false;
    _welcomeMessageController.addListener(_onWelcomeMessageChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppFormBloc, AppFormState>(builder: (context, state) {
      if (state is AppFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is AppFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _titleController.text = state.value!.title.toString();
        _homeURLController.text = state.value!.homeURL.toString();
        _emailController.text = state.value!.email.toString();
        _descriptionController.text = state.value!.description.toString();
        if (state.value!.appStatus != null) {
          _appStatusSelectedRadioTile = state.value!.appStatus!.index;
        } else {
          _appStatusSelectedRadioTile = 0;
        }
        if (state.value!.anonymousProfilePhoto != null) {
          _anonymousProfilePhoto =
              state.value!.anonymousProfilePhoto!.documentID;
        } else {
          _anonymousProfilePhoto = "";
        }
        if (state.value!.logo != null) {
          _logo = state.value!.logo!.documentID;
        } else {
          _logo = "";
        }
        _styleFamilyController.text = state.value!.styleFamily.toString();
        _styleNameController.text = state.value!.styleName.toString();
        if (state.value!.autoPrivileged1 != null) {
          _autoPrivileged1Selection = state.value!.autoPrivileged1;
        } else {
          _autoPrivileged1Selection = false;
        }
        if (state.value!.isFeatured != null) {
          _isFeaturedSelection = state.value!.isFeatured;
        } else {
          _isFeaturedSelection = false;
        }
        if (state.value!.includeShippingAddress != null) {
          _includeShippingAddressSelection =
              state.value!.includeShippingAddress;
        } else {
          _includeShippingAddressSelection = false;
        }
        if (state.value!.includeInvoiceAddress != null) {
          _includeInvoiceAddressSelection = state.value!.includeInvoiceAddress;
        } else {
          _includeInvoiceAddressSelection = false;
        }
        if (state.value!.includeSubscriptions != null) {
          _includeSubscriptionsSelection = state.value!.includeSubscriptions;
        } else {
          _includeSubscriptionsSelection = false;
        }
        _welcomeMessageController.text = state.value!.welcomeMessage.toString();
      }
      if (state is AppFormInitialized) {
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
              id: "publicMediums",
              value: _anonymousProfilePhoto,
              trigger: (value, privilegeLevel) =>
                  _onAnonymousProfilePhotoSelected(value),
              optional: false),
        );

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Style Family',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _styleFamilyController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is StyleFamilyAppFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Style Name',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _styleNameController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is StyleNameAppFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'autoPrivileged1',
                _autoPrivileged1Selection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionAutoPrivileged1(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'isFeatured',
                _isFeaturedSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionIsFeatured(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'includeShippingAddress',
                _includeShippingAddressSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) =>
                        setSelectionIncludeShippingAddress(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'includeInvoiceAddress',
                _includeInvoiceAddressSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionIncludeInvoiceAddress(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .checkboxListTile(
                widget.app,
                context,
                'includeSubscriptions',
                _includeSubscriptionsSelection,
                _readOnly(context, state)
                    ? null
                    : (dynamic val) => setSelectionIncludeSubscriptions(val)));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Welcome message',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _welcomeMessageController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is WelcomeMessageAppFormError ? state.message : null,
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
                    state is DocumentIDAppFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Title',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _titleController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is TitleAppFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Home URL',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _homeURLController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is HomeURLAppFormError ? state.message : null,
                hintText: 'field.remark'));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Contact email',
                icon: Icons.email,
                readOnly: _readOnly(context, state),
                textEditingController: _emailController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is EmailAppFormError ? state.message : null,
                hintText: null));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Description',
                icon: Icons.text_format,
                readOnly: _readOnly(context, state),
                textEditingController: _descriptionController,
                keyboardType: TextInputType.text,
                validator: (_) =>
                    state is DescriptionAppFormError ? state.message : null,
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
                .groupTitle(widget.app, context, 'Style')));

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
                .groupTitle(widget.app, context, 'Policy')));

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
                .groupTitle(widget.app, context, 'Owner')));

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
                .groupTitle(widget.app, context, 'Home Pages')));

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
                .groupTitle(widget.app, context, 'Logo')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "publicMediums",
              value: _logo,
              trigger: (value, privilegeLevel) => _onLogoSelected(value),
              optional: true),
        );

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
                .groupTitle(widget.app, context, 'Page Route Builder')));

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
                .groupTitle(widget.app, context, 'Status of the application')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _appStatusSelectedRadioTile,
                'live',
                'live',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAppStatus(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _appStatusSelectedRadioTile,
                'offline',
                'offline',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAppStatus(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _appStatusSelectedRadioTile,
                'invisible',
                'invisible',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionAppStatus(val)));

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
                .groupTitle(widget.app, context, 'Style')));

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
                        if (state is AppFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<AppListBloc>(context)
                                .add(UpdateAppList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              ownerID: state.value!.ownerID,
                              title: state.value!.title,
                              homeURL: state.value!.homeURL,
                              email: state.value!.email,
                              description: state.value!.description,
                              appStatus: state.value!.appStatus,
                              anonymousProfilePhoto:
                                  state.value!.anonymousProfilePhoto,
                              homePages: state.value!.homePages,
                              logo: state.value!.logo,
                              styleFamily: state.value!.styleFamily,
                              styleName: state.value!.styleName,
                              autoPrivileged1: state.value!.autoPrivileged1,
                              isFeatured: state.value!.isFeatured,
                              includeShippingAddress:
                                  state.value!.includeShippingAddress,
                              includeInvoiceAddress:
                                  state.value!.includeInvoiceAddress,
                              includeSubscriptions:
                                  state.value!.includeSubscriptions,
                              welcomeMessage: state.value!.welcomeMessage,
                            )));
                          } else {
                            BlocProvider.of<AppListBloc>(context)
                                .add(AddAppList(
                                    value: AppModel(
                              documentID: state.value!.documentID,
                              ownerID: state.value!.ownerID,
                              title: state.value!.title,
                              homeURL: state.value!.homeURL,
                              email: state.value!.email,
                              description: state.value!.description,
                              appStatus: state.value!.appStatus,
                              anonymousProfilePhoto:
                                  state.value!.anonymousProfilePhoto,
                              homePages: state.value!.homePages,
                              logo: state.value!.logo,
                              styleFamily: state.value!.styleFamily,
                              styleName: state.value!.styleName,
                              autoPrivileged1: state.value!.autoPrivileged1,
                              isFeatured: state.value!.isFeatured,
                              includeShippingAddress:
                                  state.value!.includeShippingAddress,
                              includeInvoiceAddress:
                                  state.value!.includeInvoiceAddress,
                              includeSubscriptions:
                                  state.value!.includeSubscriptions,
                              welcomeMessage: state.value!.welcomeMessage,
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
    _myFormBloc.add(ChangedAppDocumentID(value: _documentIDController.text));
  }

  void _onTitleChanged() {
    _myFormBloc.add(ChangedAppTitle(value: _titleController.text));
  }

  void _onHomeURLChanged() {
    _myFormBloc.add(ChangedAppHomeURL(value: _homeURLController.text));
  }

  void _onEmailChanged() {
    _myFormBloc.add(ChangedAppEmail(value: _emailController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedAppDescription(value: _descriptionController.text));
  }

  void setSelectionAppStatus(int? val) {
    setState(() {
      _appStatusSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedAppAppStatus(value: toAppStatus(val)));
  }

  void _onAnonymousProfilePhotoSelected(String? val) {
    setState(() {
      _anonymousProfilePhoto = val;
    });
    _myFormBloc.add(ChangedAppAnonymousProfilePhoto(value: val));
  }

  void _onLogoSelected(String? val) {
    setState(() {
      _logo = val;
    });
    _myFormBloc.add(ChangedAppLogo(value: val));
  }

  void _onStyleFamilyChanged() {
    _myFormBloc.add(ChangedAppStyleFamily(value: _styleFamilyController.text));
  }

  void _onStyleNameChanged() {
    _myFormBloc.add(ChangedAppStyleName(value: _styleNameController.text));
  }

  void setSelectionAutoPrivileged1(bool? val) {
    setState(() {
      _autoPrivileged1Selection = val;
    });
    _myFormBloc.add(ChangedAppAutoPrivileged1(value: val));
  }

  void setSelectionIsFeatured(bool? val) {
    setState(() {
      _isFeaturedSelection = val;
    });
    _myFormBloc.add(ChangedAppIsFeatured(value: val));
  }

  void setSelectionIncludeShippingAddress(bool? val) {
    setState(() {
      _includeShippingAddressSelection = val;
    });
    _myFormBloc.add(ChangedAppIncludeShippingAddress(value: val));
  }

  void setSelectionIncludeInvoiceAddress(bool? val) {
    setState(() {
      _includeInvoiceAddressSelection = val;
    });
    _myFormBloc.add(ChangedAppIncludeInvoiceAddress(value: val));
  }

  void setSelectionIncludeSubscriptions(bool? val) {
    setState(() {
      _includeSubscriptionsSelection = val;
    });
    _myFormBloc.add(ChangedAppIncludeSubscriptions(value: val));
  }

  void _onWelcomeMessageChanged() {
    _myFormBloc
        .add(ChangedAppWelcomeMessage(value: _welcomeMessageController.text));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _titleController.dispose();
    _homeURLController.dispose();
    _emailController.dispose();
    _descriptionController.dispose();
    _styleFamilyController.dispose();
    _styleNameController.dispose();
    _welcomeMessageController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, AppFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
