part of 'orders_rec_cubit.dart';

@immutable
abstract class WalletReportState extends Equatable {
  @override
  List<Object> get props => [];
}

class WalletRepInitial extends WalletReportState {}

class FilterByDay extends WalletReportState {}

class FilterByMonth extends WalletReportState {}

class FilterByYear extends WalletReportState {}

class FilterByPeriod extends WalletReportState {
  final DateTime from;
  final DateTime to;
  FilterByPeriod(
    this.from,
    this.to,
  );
  @override
  List<Object> get props => [from, to];
}
