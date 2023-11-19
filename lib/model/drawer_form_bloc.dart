/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/tools/etc/string_validator.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/drawer_form_event.dart';
import 'package:eliud_core_model/model/drawer_form_state.dart';

class DrawerFormBloc extends Bloc<DrawerFormEvent, DrawerFormState> {
  final FormAction? formAction;
  final String? appId;

  DrawerFormBloc(this.appId, {this.formAction})
      : super(DrawerFormUninitialized()) {
    on<InitialiseNewDrawerFormEvent>((event, emit) {
      DrawerFormLoaded loaded = DrawerFormLoaded(
          value: DrawerModel(
        documentID: "",
        appId: "",
        name: "",
        headerText: "",
        secondHeaderText: "",
        headerHeight: 0.0,
        popupMenuBackgroundColor:
            RgbModel(r: 255, g: 255, b: 255, opacity: 1.00),
        popupMenuBackgroundColorOverride:
            RgbModel(r: 255, g: 255, b: 255, opacity: 1.00),
      ));
      emit(loaded);
    });

    on<InitialiseDrawerFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      DrawerFormLoaded loaded = DrawerFormLoaded(
          value: await drawerRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseDrawerFormNoLoadEvent>((event, emit) async {
      DrawerFormLoaded loaded = DrawerFormLoaded(value: event.value);
      emit(loaded);
    });
    DrawerModel? newValue;
    on<ChangedDrawerDocumentID>((event, emit) async {
      if (state is DrawerFormInitialized) {
        final currentState = state as DrawerFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableDrawerForm(value: newValue));
        }
      }
    });
    on<ChangedDrawerName>((event, emit) async {
      if (state is DrawerFormInitialized) {
        final currentState = state as DrawerFormInitialized;
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableDrawerForm(value: newValue));
      }
    });
    on<ChangedDrawerBackgroundOverride>((event, emit) async {
      if (state is DrawerFormInitialized) {
        final currentState = state as DrawerFormInitialized;
        newValue =
            currentState.value!.copyWith(backgroundOverride: event.value);
        emit(SubmittableDrawerForm(value: newValue));
      }
    });
    on<ChangedDrawerHeaderText>((event, emit) async {
      if (state is DrawerFormInitialized) {
        final currentState = state as DrawerFormInitialized;
        newValue = currentState.value!.copyWith(headerText: event.value);
        emit(SubmittableDrawerForm(value: newValue));
      }
    });
    on<ChangedDrawerSecondHeaderText>((event, emit) async {
      if (state is DrawerFormInitialized) {
        final currentState = state as DrawerFormInitialized;
        newValue = currentState.value!.copyWith(secondHeaderText: event.value);
        emit(SubmittableDrawerForm(value: newValue));
      }
    });
    on<ChangedDrawerHeaderHeight>((event, emit) async {
      if (state is DrawerFormInitialized) {
        final currentState = state as DrawerFormInitialized;
        if (isDouble(event.value!)) {
          newValue = currentState.value!
              .copyWith(headerHeight: double.parse(event.value!));
          emit(SubmittableDrawerForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(headerHeight: 0.0);
          emit(HeaderHeightDrawerFormError(
              message: "Value should be a number or decimal number",
              value: newValue));
        }
      }
    });
    on<ChangedDrawerPopupMenuBackgroundColor>((event, emit) async {
      if (state is DrawerFormInitialized) {
        final currentState = state as DrawerFormInitialized;
        newValue =
            currentState.value!.copyWith(popupMenuBackgroundColor: event.value);
        emit(SubmittableDrawerForm(value: newValue));
      }
    });
    on<ChangedDrawerHeaderBackgroundOverride>((event, emit) async {
      if (state is DrawerFormInitialized) {
        final currentState = state as DrawerFormInitialized;
        newValue =
            currentState.value!.copyWith(headerBackgroundOverride: event.value);
        emit(SubmittableDrawerForm(value: newValue));
      }
    });
    on<ChangedDrawerPopupMenuBackgroundColorOverride>((event, emit) async {
      if (state is DrawerFormInitialized) {
        final currentState = state as DrawerFormInitialized;
        newValue = currentState.value!
            .copyWith(popupMenuBackgroundColorOverride: event.value);
        emit(SubmittableDrawerForm(value: newValue));
      }
    });
    on<ChangedDrawerMenu>((event, emit) async {
      if (state is DrawerFormInitialized) {
        final currentState = state as DrawerFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              menu: await menuDefRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittableDrawerForm(value: newValue));
      }
    });
  }

  DocumentIDDrawerFormError error(String message, DrawerModel newValue) =>
      DocumentIDDrawerFormError(message: message, value: newValue);

  Future<DrawerFormState> _isDocumentIDValid(
      String? value, DrawerModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<DrawerModel?> findDocument =
        drawerRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableDrawerForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
