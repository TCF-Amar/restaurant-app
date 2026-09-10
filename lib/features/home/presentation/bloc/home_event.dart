part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {
  const HomeEvent();
}

/// Toggles the sliding drawer open / closed
class ToggleDrawerEvent extends HomeEvent {
  const ToggleDrawerEvent();
}

/// Selects a drawer menu item by index and closes the drawer
class SelectMenuEvent extends HomeEvent {
  final int index;
  const SelectMenuEvent(this.index);
}

/// Closes the drawer explicitly (e.g. on background tap)
class CloseDrawerEvent extends HomeEvent {
  const CloseDrawerEvent();
}

/// Opens the drawer explicitly
class OpenDrawerEvent extends HomeEvent {
  const OpenDrawerEvent();
}
