part of 'rec_tab_cubit.dart';

abstract class WalletTabState extends Equatable {
  const WalletTabState();

  @override
  List<Object> get props => [];
}

class WalletTabLoading extends WalletTabState {}

class WalletTabLoaded extends WalletTabState {
  final List<WalletReportsItem> items;
  WalletTabLoaded(this.items);
}

class WalletTabCantLoad extends WalletTabState {
  final String msg;

  WalletTabCantLoad(this.msg);
}

// TODO :: pagination
