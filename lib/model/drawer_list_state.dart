/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 drawer_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core_model/model/drawer_model.dart';

abstract class DrawerListState extends Equatable {
  const DrawerListState();

  @override
  List<Object?> get props => [];
}

class DrawerListLoading extends DrawerListState {}

class DrawerListLoaded extends DrawerListState {
  final List<DrawerModel?>? values;
  final bool? mightHaveMore;

  const DrawerListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'DrawerListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is DrawerListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class DrawerNotLoaded extends DrawerListState {}
