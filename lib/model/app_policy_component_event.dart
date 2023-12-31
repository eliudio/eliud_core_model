/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 app_policy_component_event.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'package:equatable/equatable.dart';
import 'package:eliud_core_model/model/app_policy_model.dart';

/*
 * AppPolicyComponentEvent is the base class for events to be used with constructing a AppPolicyComponentBloc 
 */
abstract class AppPolicyComponentEvent extends Equatable {
  @override
  List<Object> get props => [];
}

/*
 * FetchAppPolicyComponent is the event to instruct the bloc to fetch the component
 */
class FetchAppPolicyComponent extends AppPolicyComponentEvent {
  final String? id;

  /*
   * Construct the FetchAppPolicyComponent
   */
  FetchAppPolicyComponent({this.id});
}

/*
 * AppPolicyComponentUpdated is the event to inform the bloc that a component has been updated
 */
class AppPolicyComponentUpdated extends AppPolicyComponentEvent {
  final AppPolicyModel value;

  /*
   * Construct the AppPolicyComponentUpdated
   */
  AppPolicyComponentUpdated({required this.value});
}
