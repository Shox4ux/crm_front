import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'drawerx_state.dart';

class DrawerXCubit extends Cubit<DrawerXState> {
  DrawerXCubit()
    : super(const DrawerXState(selectedIndex: 0, isDrawerOpen: false));
  void changeIndex(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  void toggleDrawer() {
    emit(state.copyWith(isDrawerOpen: !state.isDrawerOpen));
  }
}
