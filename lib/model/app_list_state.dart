/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core_model/model/app_model.dart';

abstract class AppListState extends Equatable {
  const AppListState();

  @override
  List<Object?> get props => [];
}

class AppListLoading extends AppListState {}

class AppListLoaded extends AppListState {
  final List<AppModel?>? values;
  final bool? mightHaveMore;

  const AppListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'AppListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is AppListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class AppNotLoaded extends AppListState {}
