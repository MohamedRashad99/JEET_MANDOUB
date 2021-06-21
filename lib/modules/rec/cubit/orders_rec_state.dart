part of 'orders_rec_cubit.dart';

@immutable
abstract class OrdersRecState   {

}

class OrdersRecInitial extends OrdersRecState {}

class FilterByDay extends OrdersRecState {}

class FilterByMonth extends OrdersRecState {}

class FilterByYear extends OrdersRecState {}

class FilterByPeriod extends OrdersRecState {
  final DateTime from;
  final DateTime to;
  FilterByPeriod(
    this.from,
    this.to,
  );
 /* @override
  List<Object> get props => [from, to];*/
}
