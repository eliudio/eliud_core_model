/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:eliud_core_model/model/model_export.dart';

@immutable
abstract class AppFormEvent extends Equatable {
  const AppFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewAppFormEvent extends AppFormEvent {}

class InitialiseAppFormEvent extends AppFormEvent {
  final AppModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseAppFormEvent({this.value});
}

class InitialiseAppFormNoLoadEvent extends AppFormEvent {
  final AppModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseAppFormNoLoadEvent({this.value});
}

class ChangedAppDocumentID extends AppFormEvent {
  final String? value;

  ChangedAppDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppDocumentID{ value: $value }';
}

class ChangedAppOwnerID extends AppFormEvent {
  final String? value;

  ChangedAppOwnerID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppOwnerID{ value: $value }';
}

class ChangedAppTitle extends AppFormEvent {
  final String? value;

  ChangedAppTitle({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppTitle{ value: $value }';
}

class ChangedAppHomeURL extends AppFormEvent {
  final String? value;

  ChangedAppHomeURL({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppHomeURL{ value: $value }';
}

class ChangedAppEmail extends AppFormEvent {
  final String? value;

  ChangedAppEmail({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppEmail{ value: $value }';
}

class ChangedAppDescription extends AppFormEvent {
  final String? value;

  ChangedAppDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppDescription{ value: $value }';
}

class ChangedAppAppStatus extends AppFormEvent {
  final AppStatus? value;

  ChangedAppAppStatus({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppAppStatus{ value: $value }';
}

class ChangedAppAnonymousProfilePhoto extends AppFormEvent {
  final String? value;

  ChangedAppAnonymousProfilePhoto({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppAnonymousProfilePhoto{ value: $value }';
}

class ChangedAppHomePages extends AppFormEvent {
  final AppHomePageReferencesModel? value;

  ChangedAppHomePages({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppHomePages{ value: $value }';
}

class ChangedAppLogo extends AppFormEvent {
  final String? value;

  ChangedAppLogo({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppLogo{ value: $value }';
}

class ChangedAppStyleFamily extends AppFormEvent {
  final String? value;

  ChangedAppStyleFamily({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppStyleFamily{ value: $value }';
}

class ChangedAppStyleName extends AppFormEvent {
  final String? value;

  ChangedAppStyleName({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppStyleName{ value: $value }';
}

class ChangedAppAutoPrivileged1 extends AppFormEvent {
  final bool? value;

  ChangedAppAutoPrivileged1({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppAutoPrivileged1{ value: $value }';
}

class ChangedAppIsFeatured extends AppFormEvent {
  final bool? value;

  ChangedAppIsFeatured({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppIsFeatured{ value: $value }';
}

class ChangedAppIncludeShippingAddress extends AppFormEvent {
  final bool? value;

  ChangedAppIncludeShippingAddress({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppIncludeShippingAddress{ value: $value }';
}

class ChangedAppIncludeInvoiceAddress extends AppFormEvent {
  final bool? value;

  ChangedAppIncludeInvoiceAddress({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppIncludeInvoiceAddress{ value: $value }';
}

class ChangedAppIncludeSubscriptions extends AppFormEvent {
  final bool? value;

  ChangedAppIncludeSubscriptions({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppIncludeSubscriptions{ value: $value }';
}

class ChangedAppWelcomeMessage extends AppFormEvent {
  final String? value;

  ChangedAppWelcomeMessage({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedAppWelcomeMessage{ value: $value }';
}
