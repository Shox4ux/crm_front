import 'package:bloc/bloc.dart';
import 'package:crm_app/app/utils/widgets/drawer/drawer_data.dart';
import 'package:meta/meta.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit() : super(DrawerInitial(initData: drawerList[0]));

  int _index = 0;
  DrawerData? _slctdData;

  DrawerData? getData() => _slctdData;

  void setIndex(int i) {
    _index = i;
  }

  int getIndex() => _index;

  void onDrawerItemPressed({required DrawerData data}) {
    if (state is DrawerItemPressed) {
      final oldState = state as DrawerItemPressed;
      _slctdData = data;
      final newState = oldState.copyWith(data: data);
      emit(newState);
    }
    emit(DrawerItemPressed(data: data));
  }
}
