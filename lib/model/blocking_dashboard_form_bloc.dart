/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/blocking_dashboard_form_event.dart';
import 'package:eliud_core_model/model/blocking_dashboard_form_state.dart';

class BlockingDashboardFormBloc
    extends Bloc<BlockingDashboardFormEvent, BlockingDashboardFormState> {
  final FormAction? formAction;
  final String? appId;

  BlockingDashboardFormBloc(this.appId, {this.formAction})
      : super(BlockingDashboardFormUninitialized()) {
    on<InitialiseNewBlockingDashboardFormEvent>((event, emit) {
      BlockingDashboardFormLoaded loaded = BlockingDashboardFormLoaded(
          value: BlockingDashboardModel(
        documentID: "",
        appId: "",
        description: "",
      ));
      emit(loaded);
    });

    on<InitialiseBlockingDashboardFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      BlockingDashboardFormLoaded loaded = BlockingDashboardFormLoaded(
          value: await blockingDashboardRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseBlockingDashboardFormNoLoadEvent>((event, emit) async {
      BlockingDashboardFormLoaded loaded =
          BlockingDashboardFormLoaded(value: event.value);
      emit(loaded);
    });
    BlockingDashboardModel? newValue;
    on<ChangedBlockingDashboardDocumentID>((event, emit) async {
      if (state is BlockingDashboardFormInitialized) {
        final currentState = state as BlockingDashboardFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableBlockingDashboardForm(value: newValue));
        }
      }
    });
    on<ChangedBlockingDashboardAppId>((event, emit) async {
      if (state is BlockingDashboardFormInitialized) {
        final currentState = state as BlockingDashboardFormInitialized;
        newValue = currentState.value!.copyWith(appId: event.value);
        emit(SubmittableBlockingDashboardForm(value: newValue));
      }
    });
    on<ChangedBlockingDashboardDescription>((event, emit) async {
      if (state is BlockingDashboardFormInitialized) {
        final currentState = state as BlockingDashboardFormInitialized;
        newValue = currentState.value!.copyWith(description: event.value);
        emit(SubmittableBlockingDashboardForm(value: newValue));
      }
    });
    on<ChangedBlockingDashboardConditions>((event, emit) async {
      if (state is BlockingDashboardFormInitialized) {
        final currentState = state as BlockingDashboardFormInitialized;
        newValue = currentState.value!.copyWith(conditions: event.value);
        emit(SubmittableBlockingDashboardForm(value: newValue));
      }
    });
  }

  DocumentIDBlockingDashboardFormError error(
          String message, BlockingDashboardModel newValue) =>
      DocumentIDBlockingDashboardFormError(message: message, value: newValue);

  Future<BlockingDashboardFormState> _isDocumentIDValid(
      String? value, BlockingDashboardModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<BlockingDashboardModel?> findDocument =
        blockingDashboardRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableBlockingDashboardForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
