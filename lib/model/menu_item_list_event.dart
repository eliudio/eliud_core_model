/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 menu_item_list_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:eliud_core_model/tools/query/query_tools.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core_model/model/menu_item_model.dart';

abstract class MenuItemListEvent extends Equatable {
  const MenuItemListEvent();
  @override
  List<Object?> get props => [];
}

class LoadMenuItemList extends MenuItemListEvent {}

class NewPage extends MenuItemListEvent {}

class AddMenuItemList extends MenuItemListEvent {
  final MenuItemModel? value;

  const AddMenuItemList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AddMenuItemList{ value: $value }';
}

class UpdateMenuItemList extends MenuItemListEvent {
  final MenuItemModel? value;

  const UpdateMenuItemList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'UpdateMenuItemList{ value: $value }';
}

class DeleteMenuItemList extends MenuItemListEvent {
  final MenuItemModel? value;

  const DeleteMenuItemList({this.value});

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'DeleteMenuItemList{ value: $value }';
}

class MenuItemListUpdated extends MenuItemListEvent {
  final List<MenuItemModel?>? value;
  final bool? mightHaveMore;

  const MenuItemListUpdated({this.value, this.mightHaveMore});

  @override
  List<Object?> get props => [value, mightHaveMore];

  @override
  String toString() =>
      'MenuItemListUpdated{ value: $value, mightHaveMore: $mightHaveMore }';
}

class MenuItemChangeQuery extends MenuItemListEvent {
  final EliudQuery? newQuery;

  const MenuItemChangeQuery({required this.newQuery});

  @override
  List<Object?> get props => [newQuery];

  @override
  String toString() => 'MenuItemChangeQuery{ value: $newQuery }';
}
