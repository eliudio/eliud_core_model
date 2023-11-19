/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_form.dart
                       
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

import 'package:eliud_core_model/model/decoration_color_list_bloc.dart';
import 'package:eliud_core_model/model/decoration_color_list_event.dart';
import 'package:eliud_core_model/model/decoration_color_form_bloc.dart';
import 'package:eliud_core_model/model/decoration_color_form_event.dart';
import 'package:eliud_core_model/model/decoration_color_form_state.dart';

class DecorationColorForm extends StatelessWidget {
  final AppModel app;
  final FormAction formAction;
  final DecorationColorModel? value;
  final ActionModel? submitAction;

  DecorationColorForm(
      {super.key,
      required this.app,
      required this.formAction,
      required this.value,
      this.submitAction});

  /// Build the DecorationColorForm
  @override
  Widget build(BuildContext context) {
    //var accessState = AccessBloc.getState(context);
    var appId = app.documentID;
    if (formAction == FormAction.showData) {
      return BlocProvider<DecorationColorFormBloc>(
        create: (context) => DecorationColorFormBloc(
          appId,
        )..add(InitialiseDecorationColorFormEvent(value: value)),
        child: _MyDecorationColorForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    }
    if (formAction == FormAction.showPreloadedData) {
      return BlocProvider<DecorationColorFormBloc>(
        create: (context) => DecorationColorFormBloc(
          appId,
        )..add(InitialiseDecorationColorFormNoLoadEvent(value: value)),
        child: _MyDecorationColorForm(
            app: app, submitAction: submitAction, formAction: formAction),
      );
    } else {
      return Scaffold(
          appBar: StyleRegistry.registry()
              .styleWithApp(app)
              .adminFormStyle()
              .appBarWithString(app, context,
                  title: formAction == FormAction.updateAction
                      ? 'Update DecorationColor'
                      : 'Add DecorationColor'),
          body: BlocProvider<DecorationColorFormBloc>(
            create: (context) => DecorationColorFormBloc(
              appId,
            )..add((formAction == FormAction.updateAction
                ? InitialiseDecorationColorFormEvent(value: value)
                : InitialiseNewDecorationColorFormEvent())),
            child: _MyDecorationColorForm(
                app: app, submitAction: submitAction, formAction: formAction),
          ));
    }
  }
}

class _MyDecorationColorForm extends StatefulWidget {
  final AppModel app;
  final FormAction? formAction;
  final ActionModel? submitAction;

  _MyDecorationColorForm(
      {required this.app, this.formAction, this.submitAction});

  @override
  State<_MyDecorationColorForm> createState() =>
      _MyDecorationColorFormState(formAction);
}

class _MyDecorationColorFormState extends State<_MyDecorationColorForm> {
  final FormAction? formAction;
  late DecorationColorFormBloc _myFormBloc;

  final TextEditingController _stopController = TextEditingController();

  _MyDecorationColorFormState(this.formAction);

  @override
  void initState() {
    super.initState();
    _myFormBloc = BlocProvider.of<DecorationColorFormBloc>(context);
    _stopController.addListener(_onStopChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DecorationColorFormBloc, DecorationColorFormState>(
        builder: (context, state) {
      if (state is DecorationColorFormUninitialized) {
        return Center(
          child: StyleRegistry.registry()
              .styleWithApp(widget.app)
              .adminListStyle()
              .progressIndicator(widget.app, context),
        );
      }

      if (state is DecorationColorFormLoaded) {
        _stopController.text = state.value!.stop.toString();
      }
      if (state is DecorationColorFormInitialized) {
        List<Widget> children = [];
        children.add(RgbField(widget.app, "Background Color",
            state.value!.color, _onColorChanged));

        children.add(StyleRegistry.registry()
            .styleWithApp(widget.app)
            .adminFormStyle()
            .textFormField(widget.app, context,
                labelText: 'Stop (-1 = no stop)',
                icon: Icons.color_lens,
                readOnly: _readOnly(context, state),
                textEditingController: _stopController,
                keyboardType: TextInputType.number,
                validator: (_) => state is StopDecorationColorFormError
                    ? state.message
                    : null,
                hintText: null));

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
                        if (state is DecorationColorFormError) {
                          return;
                        } else {
                          if (formAction == FormAction.updateAction) {
                            BlocProvider.of<DecorationColorListBloc>(context)
                                .add(UpdateDecorationColorList(
                                    value: state.value!.copyWith(
                              documentID: state.value!.documentID,
                              color: state.value!.color,
                              stop: state.value!.stop,
                            )));
                          } else {
                            BlocProvider.of<DecorationColorListBloc>(context)
                                .add(AddDecorationColorList(
                                    value: DecorationColorModel(
                              documentID: state.value!.documentID,
                              color: state.value!.color,
                              stop: state.value!.stop,
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

  void _onColorChanged(value) {
    _myFormBloc.add(ChangedDecorationColorColor(value: value));
  }

  void _onStopChanged() {
    _myFormBloc.add(ChangedDecorationColorStop(value: _stopController.text));
  }

  @override
  void dispose() {
    _stopController.dispose();
    super.dispose();
  }

  /// Is the form read-only?
  bool _readOnly(BuildContext context, DecorationColorFormInitialized state) {
    return (formAction == FormAction.showData) ||
        (formAction == FormAction.showPreloadedData) ||
        (!Apis.apis()
            .getCoreApi()
            .memberIsOwner(context, widget.app.documentID));
  }
}
