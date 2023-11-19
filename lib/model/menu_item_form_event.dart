/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_form_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../tools/bespoke_models.dart';
import 'package:eliud_core_model/model/model_export.dart';

@immutable
abstract class MenuItemFormEvent extends Equatable {
  const MenuItemFormEvent();

  @override
  List<Object?> get props => [];
}

class InitialiseNewMenuItemFormEvent extends MenuItemFormEvent {}

class InitialiseMenuItemFormEvent extends MenuItemFormEvent {
  final MenuItemModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseMenuItemFormEvent({this.value});
}

class InitialiseMenuItemFormNoLoadEvent extends MenuItemFormEvent {
  final MenuItemModel? value;

  @override
  List<Object?> get props => [value];

  InitialiseMenuItemFormNoLoadEvent({this.value});
}

class ChangedMenuItemDocumentID extends MenuItemFormEvent {
  final String? value;

  ChangedMenuItemDocumentID({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMenuItemDocumentID{ value: $value }';
}

class ChangedMenuItemText extends MenuItemFormEvent {
  final String? value;

  ChangedMenuItemText({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMenuItemText{ value: $value }';
}

class ChangedMenuItemDescription extends MenuItemFormEvent {
  final String? value;

  ChangedMenuItemDescription({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMenuItemDescription{ value: $value }';
}

class ChangedMenuItemIcon extends MenuItemFormEvent {
  final IconModel? value;

  ChangedMenuItemIcon({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMenuItemIcon{ value: $value }';
}

class ChangedMenuItemAction extends MenuItemFormEvent {
  final ActionModel? value;

  ChangedMenuItemAction({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'ChangedMenuItemAction{ value: $value }';
}
