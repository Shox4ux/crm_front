part of 'drawer_cubit.dart';

@immutable
sealed class DrawerState {}

final class DrawerInitial extends DrawerState {
  final DrawerData initData;

  DrawerInitial({required this.initData});
}

final class DrawerItemPressed extends DrawerState {
  final DrawerData data;

  DrawerItemPressed({required this.data});

  DrawerItemPressed copyWith({required DrawerData data}) =>
      DrawerItemPressed(data: data);
}
