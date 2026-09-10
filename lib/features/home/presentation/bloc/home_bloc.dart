import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<ToggleDrawerEvent>((event, emit) {
      emit(state.copyWith(isDrawerOpen: !state.isDrawerOpen));
    });

    on<SelectMenuEvent>((event, emit) {
      emit(state.copyWith(
        selectedIndex: event.index,
        isDrawerOpen: false,
      ));
    });

    on<CloseDrawerEvent>((event, emit) {
      emit(state.copyWith(isDrawerOpen: false));
    });

    on<OpenDrawerEvent>((event, emit) {
      emit(state.copyWith(isDrawerOpen: true));
    });
  }
}
