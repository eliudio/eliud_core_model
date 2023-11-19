/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_model/model/model_export.dart';

@immutable
abstract class BlockingFormEvent extends Equatable {
  const BlockingFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewBlockingFormEvent extends BlockingFormEvent {}

class InitialiseBlockingFormEvent extends BlockingFormEvent {
  final BlockingModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseBlockingFormEvent({this.value});
}

class InitialiseBlockingFormNoLoadEvent extends BlockingFormEvent {
  final BlockingModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseBlockingFormNoLoadEvent({this.value});
}

class ChangedBlockingDocumentID extends BlockingFormEvent {
  final String? value;

  ChangedBlockingDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBlockingDocumentID{ value: $value }';
}

class ChangedBlockingMemberBlocking extends BlockingFormEvent {
  final String? value;

  ChangedBlockingMemberBlocking({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBlockingMemberBlocking{ value: $value }';
}

class ChangedBlockingMemberBeingBlocked extends BlockingFormEvent {
  final String? value;

  ChangedBlockingMemberBeingBlocked({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedBlockingMemberBeingBlocked{ value: $value }';
}
