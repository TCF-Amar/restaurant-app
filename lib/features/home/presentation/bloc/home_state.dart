part of 'home_bloc.dart';

@immutable
class HomeState {
  final bool isDrawerOpen;
  final int selectedIndex;

  const HomeState({
    this.isDrawerOpen = false,
    this.selectedIndex = 0,
  });

  HomeState copyWith({
    bool? isDrawerOpen,
    int? selectedIndex,
  }) {
    return HomeState(
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeState &&
          runtimeType == other.runtimeType &&
          isDrawerOpen == other.isDrawerOpen &&
          selectedIndex == other.selectedIndex;

  @override
  int get hashCode => isDrawerOpen.hashCode ^ selectedIndex.hashCode;
}
