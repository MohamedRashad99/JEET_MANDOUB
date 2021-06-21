import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:jeet/screens/walletReports/wall/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'package:jeet/screens/walletReports/wall/cubit/orders_rec_state.dart';

class WalletRepCubit extends Cubit<WalletReportState> {
  WalletRepCubit() : super(WalletRepInitial());

  static of(BuildContext context, {bool listen = false}) => BlocProvider.of<WalletRepCubit>(context, listen: listen);
  FilterType _type;
  DateTime _from;
  DateTime _to;
  FilterType get type => _type;
  DateTime get from => _from;
  DateTime get to => _to;

  set from(DateTime f) {
    _from = f;
    _updateUi();
  }

  set to(DateTime f) {
    _to = f;
    _updateUi();
  }

  void filterBy(FilterType filterType) {
    _type = filterType;
    _updateUi();
  }

  void _updateUi() => emit(_mapFilterToState());

  WalletReportState _mapFilterToState() {
    switch (_type) {
      case FilterType.day:
        return FilterByDay();
      case FilterType.month:
        return FilterByMonth();
      case FilterType.yaer:
        return FilterByYear();
      case FilterType.period:
        return FilterByPeriod(_from, _to);
      default:
        return WalletRepInitial();
    }
  }
}
