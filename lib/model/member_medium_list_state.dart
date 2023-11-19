/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 member_medium_list_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:eliud_core_model/model/member_medium_model.dart';

abstract class MemberMediumListState extends Equatable {
  const MemberMediumListState();

  @override
  List<Object?> get props => [];
}

class MemberMediumListLoading extends MemberMediumListState {}

class MemberMediumListLoaded extends MemberMediumListState {
  final List<MemberMediumModel?>? values;
  final bool? mightHaveMore;

  const MemberMediumListLoaded({this.mightHaveMore, this.values = const []});

  @override
  List<Object?> get props => [values, mightHaveMore];

  @override
  String toString() => 'MemberMediumListLoaded { values: $values }';

  @override
  bool operator ==(Object other) =>
      other is MemberMediumListLoaded &&
      runtimeType == other.runtimeType &&
      ListEquality().equals(values, other.values) &&
      mightHaveMore == other.mightHaveMore;

  @override
  int get hashCode => values.hashCode ^ mightHaveMore.hashCode;
}

class MemberMediumNotLoaded extends MemberMediumListState {}
