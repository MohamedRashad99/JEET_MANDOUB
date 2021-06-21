import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jeet/modules/rec/cubit/orders_rec_cubit.dart';
import 'package:jeet/modules/rec/data/data.dart';
import 'package:jeet/modules/rec/data/model.dart';

import '../../enums.dart';

part 'rec_tab_state.dart';

class RecTabCubit extends Cubit<RecTabState> {
  final OrderStatus status;
  final OrdersRecCubit ordersRecCubit;

  RecTabCubit(
    this.status,
    this.ordersRecCubit,
  ) : super(RecTabLoading()) {
    refresh();
    // TODO :: close stream
    ordersRecCubit.stream.listen((state) {
      refresh();
    });
  }

  Future<void> refresh() async {
    try {
      emit(RecTabLoading());
      final data = await findRecordsByFilter(
        ordersRecCubit.type,
        status,
        ordersRecCubit.from,
        ordersRecCubit.to,
      );
      emit(RecTabLoaded(data));
    } catch (e, st) {
      print(st);
      emit(RecTabCantLoad(e.toString()));
    }
  }
}
