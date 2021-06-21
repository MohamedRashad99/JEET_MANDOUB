import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jeet/screens/walletReports/wall/cubit/orders_rec_cubit.dart';
import 'package:jeet/screens/walletReports/wall/data/data.dart';
import 'package:jeet/screens/walletReports/wall/data/model.dart';
import 'package:jeet/screens/walletReports/wall/enums.dart';



part 'rec_tab_state.dart';

class WallatTabCubit extends Cubit<WalletTabState> {
  final WalletStatus status;
  final WalletRepCubit walletRepCubit;

  WallatTabCubit(this.status, this.walletRepCubit,) : super(WalletTabLoading()) {
    refresh();
    // TODO :: close stream
    walletRepCubit.stream.listen((state) {
      refresh();
    });
  }

  Future<void> refresh() async {
    try {
      emit(WalletTabLoading());
      final data = await findWalletsByFilter(
        walletRepCubit.type,
        status,
        walletRepCubit.from,
        walletRepCubit.to,
      );
      emit(WalletTabLoaded(data));
    } catch (e, st) {
      print(st);
      emit(WalletTabCantLoad(e.toString()));
    }
  }
}
