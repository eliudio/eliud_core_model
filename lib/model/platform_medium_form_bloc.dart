/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 platform_medium_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/tools/etc/string_validator.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/platform_medium_form_event.dart';
import 'package:eliud_core_model/model/platform_medium_form_state.dart';

class PlatformMediumFormBloc
    extends Bloc<PlatformMediumFormEvent, PlatformMediumFormState> {
  final FormAction? formAction;
  final String? appId;

  PlatformMediumFormBloc(this.appId, {this.formAction})
      : super(PlatformMediumFormUninitialized()) {
    on<InitialiseNewPlatformMediumFormEvent>((event, emit) {
      PlatformMediumFormLoaded loaded = PlatformMediumFormLoaded(
          value: PlatformMediumModel(
        documentID: "",
        appId: "",
        authorId: "",
        base: "",
        ext: "",
        url: "",
        ref: "",
        urlThumbnail: "",
        refThumbnail: "",
        mediumWidth: 0,
        mediumHeight: 0,
        thumbnailWidth: 0,
        thumbnailHeight: 0,
        relatedMediumId: "",
      ));
      emit(loaded);
    });

    on<InitialisePlatformMediumFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      PlatformMediumFormLoaded loaded = PlatformMediumFormLoaded(
          value: await platformMediumRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialisePlatformMediumFormNoLoadEvent>((event, emit) async {
      PlatformMediumFormLoaded loaded =
          PlatformMediumFormLoaded(value: event.value);
      emit(loaded);
    });
    PlatformMediumModel? newValue;
    on<ChangedPlatformMediumDocumentID>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittablePlatformMediumForm(value: newValue));
        }
      }
    });
    on<ChangedPlatformMediumAuthorId>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(authorId: event.value);
        emit(SubmittablePlatformMediumForm(value: newValue));
      }
    });
    on<ChangedPlatformMediumBase>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(base: event.value);
        emit(SubmittablePlatformMediumForm(value: newValue));
      }
    });
    on<ChangedPlatformMediumExt>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(ext: event.value);
        emit(SubmittablePlatformMediumForm(value: newValue));
      }
    });
    on<ChangedPlatformMediumUrl>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(url: event.value);
        emit(SubmittablePlatformMediumForm(value: newValue));
      }
    });
    on<ChangedPlatformMediumRef>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(ref: event.value);
        emit(SubmittablePlatformMediumForm(value: newValue));
      }
    });
    on<ChangedPlatformMediumUrlThumbnail>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(urlThumbnail: event.value);
        emit(SubmittablePlatformMediumForm(value: newValue));
      }
    });
    on<ChangedPlatformMediumRefThumbnail>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(refThumbnail: event.value);
        emit(SubmittablePlatformMediumForm(value: newValue));
      }
    });
    on<ChangedPlatformMediumConditions>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittablePlatformMediumForm(value: newValue));
      }
    });
    on<ChangedPlatformMediumMediumType>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(mediumType: event.value);
        emit(SubmittablePlatformMediumForm(value: newValue));
      }
    });
    on<ChangedPlatformMediumMediumWidth>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(mediumWidth: int.parse(event.value!));
          emit(SubmittablePlatformMediumForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(mediumWidth: 0);
          emit(MediumWidthPlatformMediumFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPlatformMediumMediumHeight>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(mediumHeight: int.parse(event.value!));
          emit(SubmittablePlatformMediumForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(mediumHeight: 0);
          emit(MediumHeightPlatformMediumFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPlatformMediumThumbnailWidth>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(thumbnailWidth: int.parse(event.value!));
          emit(SubmittablePlatformMediumForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(thumbnailWidth: 0);
          emit(ThumbnailWidthPlatformMediumFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPlatformMediumThumbnailHeight>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        if (isInt(event.value)) {
          newValue = currentState.value!
              .copyWith(thumbnailHeight: int.parse(event.value!));
          emit(SubmittablePlatformMediumForm(value: newValue));
        } else {
          newValue = currentState.value!.copyWith(thumbnailHeight: 0);
          emit(ThumbnailHeightPlatformMediumFormError(
              message: "Value should be a number", value: newValue));
        }
      }
    });
    on<ChangedPlatformMediumRelatedMediumId>((event, emit) async {
      if (state is PlatformMediumFormInitialized) {
        final currentState = state as PlatformMediumFormInitialized;
        newValue = currentState.value!.copyWith(relatedMediumId: event.value);
        emit(SubmittablePlatformMediumForm(value: newValue));
      }
    });
  }

  DocumentIDPlatformMediumFormError error(
          String message, PlatformMediumModel newValue) =>
      DocumentIDPlatformMediumFormError(message: message, value: newValue);

  Future<PlatformMediumFormState> _isDocumentIDValid(
      String? value, PlatformMediumModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<PlatformMediumModel?> findDocument =
        platformMediumRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittablePlatformMediumForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
