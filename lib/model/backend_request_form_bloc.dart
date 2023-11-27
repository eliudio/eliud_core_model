/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 backend_request_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_helpers/etc/enums.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/backend_request_form_event.dart';
import 'package:eliud_core_model/model/backend_request_form_state.dart';

class BackendRequestFormBloc
    extends Bloc<BackendRequestFormEvent, BackendRequestFormState> {
  final FormAction? formAction;
  final String? appId;

  BackendRequestFormBloc(this.appId, {this.formAction})
      : super(BackendRequestFormUninitialized()) {
    on<InitialiseNewBackendRequestFormEvent>((event, emit) {
      BackendRequestFormLoaded loaded = BackendRequestFormLoaded(
          value: BackendRequestModel(
        documentID: "",
        description: "",
        appId: "",
        authorId: "",
        name: "",
        sendTo: "",
        requestType: RequestType.requestEmailData,
      ));
      emit(loaded);
    });

    on<InitialiseBackendRequestFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      BackendRequestFormLoaded loaded = BackendRequestFormLoaded(
          value: await backendRequestRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseBackendRequestFormNoLoadEvent>((event, emit) async {
      BackendRequestFormLoaded loaded =
          BackendRequestFormLoaded(value: event.value);
      emit(loaded);
    });
    BackendRequestModel? newValue;
    on<ChangedBackendRequestDocumentID>((event, emit) async {
      if (state is BackendRequestFormInitialized) {
        final currentState = state as BackendRequestFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableBackendRequestForm(value: newValue));
        }
      }
    });
    on<ChangedBackendRequestDescription>((event, emit) async {
      if (state is BackendRequestFormInitialized) {
        final currentState = state as BackendRequestFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));
      }
    });
    on<ChangedBackendRequestAuthorId>((event, emit) async {
      if (state is BackendRequestFormInitialized) {
        final currentState = state as BackendRequestFormInitialized;
        newValue = currentState.value!.copyWith(authorId: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));
      }
    });
    on<ChangedBackendRequestName>((event, emit) async {
      if (state is BackendRequestFormInitialized) {
        final currentState = state as BackendRequestFormInitialized;
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));
      }
    });
    on<ChangedBackendRequestSendTo>((event, emit) async {
      if (state is BackendRequestFormInitialized) {
        final currentState = state as BackendRequestFormInitialized;
        newValue = currentState.value!.copyWith(sendTo: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));
      }
    });
    on<ChangedBackendRequestCollections>((event, emit) async {
      if (state is BackendRequestFormInitialized) {
        final currentState = state as BackendRequestFormInitialized;
        newValue = currentState.value!.copyWith(collections: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));
      }
    });
    on<ChangedBackendRequestProcessed>((event, emit) async {
      if (state is BackendRequestFormInitialized) {
        final currentState = state as BackendRequestFormInitialized;
        newValue = currentState.value!.copyWith(processed: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));
      }
    });
    on<ChangedBackendRequestRequestType>((event, emit) async {
      if (state is BackendRequestFormInitialized) {
        final currentState = state as BackendRequestFormInitialized;
        newValue = currentState.value!.copyWith(requestType: event.value);
        emit(SubmittableBackendRequestForm(value: newValue));
      }
    });
  }

  DocumentIDBackendRequestFormError error(
          String message, BackendRequestModel newValue) =>
      DocumentIDBackendRequestFormError(message: message, value: newValue);

  Future<BackendRequestFormState> _isDocumentIDValid(
      String? value, BackendRequestModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<BackendRequestModel?> findDocument =
        backendRequestRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableBackendRequestForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
