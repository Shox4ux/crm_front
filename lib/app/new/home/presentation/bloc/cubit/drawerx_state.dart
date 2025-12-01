part of 'drawerx_cubit.dart';

class DrawerXState extends Equatable {
  final int selectedIndex;
  final bool isDrawerOpen;
  const DrawerXState({required this.selectedIndex, required this.isDrawerOpen});

  DrawerXState copyWith({int? selectedIndex, bool? isDrawerOpen}) {
    return DrawerXState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isDrawerOpen: isDrawerOpen ?? this.isDrawerOpen,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, isDrawerOpen];
}
