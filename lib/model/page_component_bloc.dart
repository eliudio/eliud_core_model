/*
       _ _           _ 
      | (_)         | |
   ___| |_ _   _  __| |
  / _ \ | | | | |/ _` |
 |  __/ | | |_| | (_| |
  \___|_|_|\__,_|\__,_|
                       
 
 page_component_bloc.dart
                       
 This code is generated. This is read only. Don't touch!

*/

import 'dart:async';
import 'package:bloc/bloc.dart';

import 'package:eliud_core_model/model/page_component_event.dart';
import 'package:eliud_core_model/model/page_component_state.dart';
import 'package:eliud_core_model/model/page_repository.dart';

class PageComponentBloc extends Bloc<PageComponentEvent, PageComponentState> {
  final PageRepository? pageRepository;
  StreamSubscription? _pageSubscription;

  void _mapLoadPageComponentUpdateToState(String documentId) {
    _pageSubscription?.cancel();
    _pageSubscription = pageRepository!.listenTo(documentId, (value) {
      if (value != null) {
        add(PageComponentUpdated(value: value));
      }
    });
  }

  /*
   * Construct PageComponentBloc
   */
  PageComponentBloc({this.pageRepository})
      : super(PageComponentUninitialized()) {
    on<FetchPageComponent>((event, emit) {
      _mapLoadPageComponentUpdateToState(event.id!);
    });
    on<PageComponentUpdated>((event, emit) {
      emit(PageComponentLoaded(value: event.value));
    });
  }

  /*
   * Close the PageComponentBloc
   */
  @override
  Future<void> close() {
    _pageSubscription?.cancel();
    return super.close();
  }
}
