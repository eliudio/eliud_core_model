/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 blocking_dashboard_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core_model/model/blocking_dashboard_component_event.dart';
import 'package:eliud_core_model/model/blocking_dashboard_component_state.dart';
import 'package:eliud_core_model/model/blocking_dashboard_repository.dart';

class BlockingDashboardComponentBloc extends Bloc<
    BlockingDashboardComponentEvent, BlockingDashboardComponentState> {
  final BlockingDashboardRepository? blockingDashboardRepository;
  StreamSubscription? _blockingDashboardSubscription;

  void _mapLoadBlockingDashboardComponentUpdateToState(String documentId) {
    _blockingDashboardSubscription?.cancel();
    _blockingDashboardSubscription =
        blockingDashboardRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(BlockingDashboardComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct BlockingDashboardComponentBloc
   */
  BlockingDashboardComponentBloc({this.blockingDashboardRepository})
      : super(BlockingDashboardComponentUninitialized()) {
    on<FetchBlockingDashboardComponent>((event, emit) {
      _mapLoadBlockingDashboardComponentUpdateToState(event.id!);
    });
    on<BlockingDashboardComponentUpdated>((event, emit) {
      emit(BlockingDashboardComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the BlockingDashboardComponentBloc
   */
  @override
  Future<void> close() {
    _blockingDashboardSubscription?.cancel();
    return super.close();
  }
}
