/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 decoration_color_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core_model/model/decoration_color_model.dart';

abstract class DecorationColorListState extends Equatable {
  const DecorationColorListState();

  @override
  List<Object?> get props => [];
}

class DecorationColorListLoading extends DecorationColorListState {}

class DecorationColorListLoaded extends DecorationColorListState {
  final List<DecorationColorModel?>? values;
  final bool? mightHaveMore;

  const DecorationColorListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'DecorationColorListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is DecorationColorListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class DecorationColorNotLoaded extends DecorationColorListState {}
