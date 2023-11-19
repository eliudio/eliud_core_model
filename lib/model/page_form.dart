/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_form.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import '../tools/bespoke_models.dart';
import 'package:eliud_core_model/apis/action_api/action_model.dart';

import 'package:eliud_core_model/apis/apis.dart';

import 'package:eliud_core_model/tools/etc/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:eliud_core_model/style/style_registry.dart';
import 'package:eliud_core_model/model/internal_component.dart';
import 'package:eliud_core_model/model/embedded_component.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/page_list_bloc.dart';
import 'package:eliud_core_model/model/page_list_event.dart';
import 'package:eliud_core_model/model/page_form_bloc.dart';
import 'package:eliud_core_model/model/page_form_event.dart';
import 'package:eliud_core_model/model/page_form_state.dart';

class PageForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final PageModel? value;
  final ActionModel? submitAction;

  PageForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the PageForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<PageFormBloc>(
        create: (context) => PageFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePageFormEvent(value: value)),
        child: _MyPageForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<PageFormBloc>(
        create: (context) => PageFormBloc(
          appId,
          formAction: formAction,
        )..add(InitialisePageFormNoLoadEvent(value: value)),
        child: _MyPageForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update Page'
                      : 'Add Page'),
          body: BlocProvider<PageFormBloc>(
            create: (context) => PageFormBloc(
              appId,
              formAction: formAction,
            )..add((formAction == FormAction.updateAction
                ? InitialisePageFormEvent(value: value)
                : InitialiseNewPageFormEvent())),
            child: _MyPageForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyPageForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyPageForm({required this.app, this.formAction, this.submitAction});

  @override
  State<_MyPageForm> createState() => _MyPageFormState(formAction);
}

class _MyPageFormState extends State<_MyPageForm> {
  final FormAction? formAction;
  late PageFormBloc _myFormBloc;

  final TextEditingController _documentIDController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  String? _appBar;
  String? _drawer;
  String? _endDrawer;
  String? _homeMenu;
  int? _layoutSelectedRadioTile;
  String? _gridView;

  _MyPageFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<PageFormBloc>(context);
    _documentIDController.addListener(_onDocumentIDChanged);
    _descriptionController.addListener(_onDescriptionChanged);
    _titleController.addListener(_onTitleChanged);
    _layoutSelectedRadioTile = 0;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageFormBloc, PageFormState>(builder: (context, state) {
      if (state is PageFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is PageFormLoaded) {
        _documentIDController.text = state.value!.documentID.toString();
        _descriptionController.text = state.value!.description.toString();
        _titleController.text = state.value!.title.toString();
        if (state.value!.appBar != null) {
          _appBar = state.value!.appBar!.documentID;
        } else {
          _appBar = "";
        }
        if (state.value!.drawer != null) {
          _drawer = state.value!.drawer!.documentID;
        } else {
          _drawer = "";
        }
        if (state.value!.endDrawer != null) {
          _endDrawer = state.value!.endDrawer!.documentID;
        } else {
          _endDrawer = "";
        }
        if (state.value!.homeMenu != null) {
          _homeMenu = state.value!.homeMenu!.documentID;
        } else {
          _homeMenu = "";
        }
        if (state.value!.layout != null) {
          _layoutSelectedRadioTile = state.value!.layout!.index;
        } else {
          _layoutSelectedRadioTile = 0;
        }
        if (state.value!.gridView != null) {
          _gridView = state.value!.gridView!.documentID;
        } else {
          _gridView = "";
        }
      }
      if (state is PageFormInitialized) {
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
                    state is DocumentIDPageFormError ? state.message : null,
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
                    state is DescriptionPageFormError ? state.message : null,
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
                    state is TitlePageFormError ? state.message : null,
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
                .groupTitle(widget.app, context, 'Home menu')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "homeMenus",
              value: _homeMenu,
              trigger: (value, privilegeLevel) => _onHomeMenuSelected(value),
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
                .groupTitle(widget.app, context, 'Drawer')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "drawers",
              value: _drawer,
              trigger: (value, privilegeLevel) => _onDrawerSelected(value),
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
                .groupTitle(widget.app, context, 'End Drawer')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "drawers",
              value: _endDrawer,
              trigger: (value, privilegeLevel) => _onEndDrawerSelected(value),
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
                .groupTitle(widget.app, context, 'App Bar')));

        children.add(
          DropdownButtonComponentFactory().createNew(
              app: widget.app,
              id: "appBars",
              value: _appBar,
              trigger: (value, privilegeLevel) => _onAppBarSelected(value),
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
                .groupTitle(widget.app, context, 'Components')));

        children.add(Container(
            height: (fullScreenHeight(context) / 2.5),
            child: bodyComponentsList(widget.app, context,
                state.value!.bodyComponents, _onBodyComponentsChanged)));

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
                .groupTitle(widget.app, context, 'Background')));

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
                .groupTitle(widget.app, context, 'Layout')));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _layoutSelectedRadioTile,
                'gridView',
                'gridView',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionLayout(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _layoutSelectedRadioTile,
                'listView',
                'listView',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionLayout(val)));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .radioListTile(
                widget.app,
                context,
                0,
                _layoutSelectedRadioTile,
                'onlyTheFirstComponent',
                'onlyTheFirstComponent',
                !Apis.apis()
                        .getCoreApi()
                        .memberIsOwner(context, widget.app.documentID)
                    ? null
                    : (dynamic val) => setSelectionLayout(val)));

        children.add(Container(height: 20.0));
        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .divider(widget.app, context));

        if (state.value!.layout == PageLayout.gridView) {
          children.add(Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: StyleRegistry.registry()
                  .styleWithApp(widget.app)
                  .adminFormStyle()
                  .groupTitle(widget.app, context, 'GridView')));
        }

        if ((state.value!.layout == PageLayout.gridView)) {
          children.add(
            DropdownButtonComponentFactory().createNew(
                app: widget.app,
                id: "gridViews",
                value: _gridView,
                trigger: (value, privilegeLevel) => _onGridViewSelected(value),
                optional: false),
          );
        }

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
                .groupTitle(widget.app, context, 'Conditional')));

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
                        if (state is PageFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<PageListBloc>(context)
                                .add(UpdatePageList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              title: state.value!.title,
                              appBar: state.value!.appBar,
                              drawer: state.value!.drawer,
                              endDrawer: state.value!.endDrawer,
                              homeMenu: state.value!.homeMenu,
                              bodyComponents: state.value!.bodyComponents,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              layout: state.value!.layout,
                              gridView: state.value!.gridView,
                              conditions: state.value!.conditions,
                            )));
                          } else {
                            BlocProvider.of<PageListBloc>(context)
                                .add(AddPageList(
                                    value: PageModel(
                              documentID: state.value!.documentID,
                              appId: state.value!.appId,
                              description: state.value!.description,
                              title: state.value!.title,
                              appBar: state.value!.appBar,
                              drawer: state.value!.drawer,
                              endDrawer: state.value!.endDrawer,
                              homeMenu: state.value!.homeMenu,
                              bodyComponents: state.value!.bodyComponents,
                              backgroundOverride:
                                  state.value!.backgroundOverride,
                              layout: state.value!.layout,
                              gridView: state.value!.gridView,
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
    _myFormBloc.add(ChangedPageDocumentID(value: _documentIDController.text));
  }

  void _onDescriptionChanged() {
    _myFormBloc.add(ChangedPageDescription(value: _descriptionController.text));
  }

  void _onTitleChanged() {
    _myFormBloc.add(ChangedPageTitle(value: _titleController.text));
  }

  void _onAppBarSelected(String? val) {
    setState(() {
      _appBar = val;
    });
    _myFormBloc.add(ChangedPageAppBar(value: val));
  }

  void _onDrawerSelected(String? val) {
    setState(() {
      _drawer = val;
    });
    _myFormBloc.add(ChangedPageDrawer(value: val));
  }

  void _onEndDrawerSelected(String? val) {
    setState(() {
      _endDrawer = val;
    });
    _myFormBloc.add(ChangedPageEndDrawer(value: val));
  }

  void _onHomeMenuSelected(String? val) {
    setState(() {
      _homeMenu = val;
    });
    _myFormBloc.add(ChangedPageHomeMenu(value: val));
  }

  void _onBodyComponentsChanged(value) {
    _myFormBloc.add(ChangedPageBodyComponents(value: value));
    setState(() {});
  }

  void setSelectionLayout(int? val) {
    setState(() {
      _layoutSelectedRadioTile = val;
    });
    _myFormBloc.add(ChangedPageLayout(value: toPageLayout(val)));
  }

  void _onGridViewSelected(String? val) {
    setState(() {
      _gridView = val;
    });
    _myFormBloc.add(ChangedPageGridView(value: val));
  }

  @override
  void dispose() {
    _documentIDController.dispose();
    _descriptionController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, PageFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
