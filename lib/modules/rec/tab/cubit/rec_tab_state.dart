part of 'rec_tab_cubit.dart';

abstract class RecTabState extends Equatable {
  const RecTabState();

  @override
  List<Object> get props => [];
}

class RecTabLoading extends RecTabState {}

class RecTabLoaded extends RecTabState {
  final List<RecoerdItem> items;
  RecTabLoaded(this.items);
}

class RecTabCantLoad extends RecTabState {
  final String msg;

  RecTabCantLoad(this.msg);
}

// TODO :: pagination
