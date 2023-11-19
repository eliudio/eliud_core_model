/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 home_menu_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/home_menu_form_event.dart';
import 'package:eliud_core_model/model/home_menu_form_state.dart';

class HomeMenuFormBloc extends Bloc<HomeMenuFormEvent, HomeMenuFormState> {
  final FormAction? formAction;
  final String? appId;

  HomeMenuFormBloc(this.appId, {this.formAction})
      : super(HomeMenuFormUninitialized()) {
    on<InitialiseNewHomeMenuFormEvent>((event, emit) {
      HomeMenuFormLoaded loaded = HomeMenuFormLoaded(
          value: HomeMenuModel(
        documentID: "IDENTIFIER",
        appId: "",
        name: "Name",
        iconColorOverride: RgbModel(r: 255, g: 255, b: 255, opacity: 1.00),
        popupMenuBackgroundColorOverride:
            RgbModel(r: 255, g: 255, b: 255, opacity: 1.00),
      ));
      emit(loaded);
    });

    on<InitialiseHomeMenuFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      HomeMenuFormLoaded loaded = HomeMenuFormLoaded(
          value: await homeMenuRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseHomeMenuFormNoLoadEvent>((event, emit) async {
      HomeMenuFormLoaded loaded = HomeMenuFormLoaded(value: event.value);
      emit(loaded);
    });
    HomeMenuModel? newValue;
    on<ChangedHomeMenuDocumentID>((event, emit) async {
      if (state is HomeMenuFormInitialized) {
        final currentState = state as HomeMenuFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableHomeMenuForm(value: newValue));
        }
      }
    });
    on<ChangedHomeMenuName>((event, emit) async {
      if (state is HomeMenuFormInitialized) {
        final currentState = state as HomeMenuFormInitialized;
        newValue = currentState.value!.copyWith(name: event.value);
        if (!_isNameValid(event.value)) {
          emit(
              NameHomeMenuFormError(message: "Invalid value", value: newValue));
        } else {
          emit(SubmittableHomeMenuForm(value: newValue));
        }
      }
    });
    on<ChangedHomeMenuMenu>((event, emit) async {
      if (state is HomeMenuFormInitialized) {
        final currentState = state as HomeMenuFormInitialized;
        if (event.value != null) {
          newValue = currentState.value!.copyWith(
              menu: await menuDefRepository(appId: appId)!.get(event.value));
        }
        emit(SubmittableHomeMenuForm(value: newValue));
      }
    });
    on<ChangedHomeMenuIconColorOverride>((event, emit) async {
      if (state is HomeMenuFormInitialized) {
        final currentState = state as HomeMenuFormInitialized;
        newValue = currentState.value!.copyWith(iconColorOverride: event.value);
        emit(SubmittableHomeMenuForm(value: newValue));
      }
    });
    on<ChangedHomeMenuBackgroundOverride>((event, emit) async {
      if (state is HomeMenuFormInitialized) {
        final currentState = state as HomeMenuFormInitialized;
        newValue =
            currentState.value!.copyWith(backgroundOverride: event.value);
        emit(SubmittableHomeMenuForm(value: newValue));
      }
    });
    on<ChangedHomeMenuPopupMenuBackgroundColorOverride>((event, emit) async {
      if (state is HomeMenuFormInitialized) {
        final currentState = state as HomeMenuFormInitialized;
        newValue = currentState.value!
            .copyWith(popupMenuBackgroundColorOverride: event.value);
        emit(SubmittableHomeMenuForm(value: newValue));
      }
    });
  }

  bool _isNameValid(String? value) {
    // This could be written in 1 line. However, this is to illustrate how to write multiple lines of code
    if (value!.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  DocumentIDHomeMenuFormError error(String message, HomeMenuModel newValue) =>
      DocumentIDHomeMenuFormError(message: message, value: newValue);

  Future<HomeMenuFormState> _isDocumentIDValid(
      String? value, HomeMenuModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<HomeMenuModel?> findDocument =
        homeMenuRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableHomeMenuForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
