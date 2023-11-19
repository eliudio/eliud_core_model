/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_component_state.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core_model/model/app_model.dart';

/* 
 * AppComponentState is the base class for state for AppComponentBloc
 */
abstract class AppComponentState extends Equatable {
  const AppComponentState();

  @override
  List<Object?> get props => [];
}

/* 
 * AppComponentUninitialized is the uninitialized state of the AppComponentBloc 
 */
class AppComponentUninitialized extends AppComponentState {}

/* 
 * AppComponentError is the error state of the AppComponentBloc 
 */
class AppComponentError extends AppComponentState {
  final String? message;
  AppComponentError({this.message});
}

/* 
 * AppComponentPermissionDenied is to indicate permission denied state of the AppComponentBloc 
 */
class AppComponentPermissionDenied extends AppComponentState {
  AppComponentPermissionDenied();
}

/* 
 * AppComponentLoaded is used to set the state of the AppComponentBloc to the loaded state
 */
class AppComponentLoaded extends AppComponentState {
  final AppModel value;

  /* 
   * construct AppComponentLoaded
   */
  const AppComponentLoaded({required this.value});

  /* 
   * copy method
   */
  AppComponentLoaded copyWith({AppModel? copyThis}) {
    return AppComponentLoaded(value: copyThis ?? value);
  }

  @override
  List<Object?> get props => [value];

  @override
  String toString() => 'AppComponentLoaded { value: $value }';
}
