import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jeet/modules/rec/data/model.dart';
import 'package:jeet/modules/rec/enums.dart';
import 'package:jeet/network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<RecoerdItem>> findRecordsByFilter(
  FilterType filterType,
  OrderStatus orderStatus,
  DateTime from,
  DateTime to,
) async {
  final _willFilter = filterType != null;
  final _statusPath = _findPathToFetch(orderStatus);
  final _endPoint = '${_willFilter ? findFilter(filterType) : ''}$_statusPath';
  final _client = NetWork();
  final response = filterType == FilterType.period
      ? await _client.postData(
          url: _endPoint,
          formData: FormData.fromMap({"from_date": from, "to_date": to}),
          headers: await _getHeaders(),
        )
      : await _client.getData(url: _endPoint, headers: await _getHeaders());

  final isValidResponse = response['msg'] == 'success';

  if (isValidResponse) {
    return (response['data'] as List)
        .map((e) => RecoerdItem.fromMap(e))
        .toList();
  }
  throw response['msg'];
}

Future<Map<String, dynamic>> _getHeaders() async {
  final _prefs = await SharedPreferences.getInstance();

  return {
    HttpHeaders.acceptHeader: 'application/json',
    'Authorization': 'Bearer ' + _prefs.getString("token"),
  };
}

String _findPathToFetch(OrderStatus orderStatus) {
  switch (orderStatus) {
    case OrderStatus.underWay:
      return 'deliveryordersunderwayrecording';
      break;
    case OrderStatus.done:
      return 'deliveryordersendedrecording';

    case OrderStatus.bounced:
      return 'deliveryordersbouncedrecording';

    case OrderStatus.payment:
      return 'deliveryorderscashpaymentrecording';
  }
  return '';
}

String findFilter(FilterType filterType) {
  switch (filterType) {
    case FilterType.day:
      return 'filter_day_';

    case FilterType.month:
      return 'filter_month_';

    case FilterType.yaer:
      return 'filter_year_';

    case FilterType.period:
      return 'filter_from_to_';
  }
  return '';
}
