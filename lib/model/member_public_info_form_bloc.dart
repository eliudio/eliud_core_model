/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_public_info_form_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:eliud_core_model/tools/etc/enums.dart';

import 'package:eliud_core_model/model/abstract_repository_singleton.dart';
import 'package:eliud_core_model/model/model_export.dart';

import 'package:eliud_core_model/model/member_public_info_form_event.dart';
import 'package:eliud_core_model/model/member_public_info_form_state.dart';

class MemberPublicInfoFormBloc
    extends Bloc<MemberPublicInfoFormEvent, MemberPublicInfoFormState> {
  final FormAction? formAction;
  final String? appId;

  MemberPublicInfoFormBloc(this.appId, {this.formAction})
      : super(MemberPublicInfoFormUninitialized()) {
    on<InitialiseNewMemberPublicInfoFormEvent>((event, emit) {
      MemberPublicInfoFormLoaded loaded = MemberPublicInfoFormLoaded(
          value: MemberPublicInfoModel(
        documentID: "",
        name: "",
        photoURL: "",
        subscriptions: [],
      ));
      emit(loaded);
    });

    on<InitialiseMemberPublicInfoFormEvent>((event, emit) async {
      // Need to re-retrieve the document from the repository so that I get all associated types
      MemberPublicInfoFormLoaded loaded = MemberPublicInfoFormLoaded(
          value: await memberPublicInfoRepository(appId: appId)!
              .get(event.value!.documentID));
      emit(loaded);
    });
    on<InitialiseMemberPublicInfoFormNoLoadEvent>((event, emit) async {
      MemberPublicInfoFormLoaded loaded =
          MemberPublicInfoFormLoaded(value: event.value);
      emit(loaded);
    });
    MemberPublicInfoModel? newValue;
    on<ChangedMemberPublicInfoDocumentID>((event, emit) async {
      if (state is MemberPublicInfoFormInitialized) {
        final currentState = state as MemberPublicInfoFormInitialized;
        newValue = currentState.value!.copyWith(documentID: event.value);
        if (formAction == FormAction.addAction) {
          emit(await _isDocumentIDValid(event.value, newValue!));
        } else {
          emit(SubmittableMemberPublicInfoForm(value: newValue));
        }
      }
    });
    on<ChangedMemberPublicInfoName>((event, emit) async {
      if (state is MemberPublicInfoFormInitialized) {
        final currentState = state as MemberPublicInfoFormInitialized;
        newValue = currentState.value!.copyWith(name: event.value);
        emit(SubmittableMemberPublicInfoForm(value: newValue));
      }
    });
    on<ChangedMemberPublicInfoSubscriptions>((event, emit) async {
      if (state is MemberPublicInfoFormInitialized) {
        final currentState = state as MemberPublicInfoFormInitialized;
        newValue = currentState.value!.copyWith(subscriptions: event.value);
        emit(SubmittableMemberPublicInfoForm(value: newValue));
      }
    });
  }

  DocumentIDMemberPublicInfoFormError error(
          String message, MemberPublicInfoModel newValue) =>
      DocumentIDMemberPublicInfoFormError(message: message, value: newValue);

  Future<MemberPublicInfoFormState> _isDocumentIDValid(
      String? value, MemberPublicInfoModel newValue) async {
    if (value == null) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    if (value.isEmpty) {
      return Future.value(error("Provide value for documentID", newValue));
    }
    Future<MemberPublicInfoModel?> findDocument =
        memberPublicInfoRepository(appId: appId)!.get(value);
    return await findDocument.then((documentFound) {
      if (documentFound == null) {
        return SubmittableMemberPublicInfoForm(value: newValue);
      } else {
        return error("Invalid documentID: already exists", newValue);
      }
    });
  }
}
