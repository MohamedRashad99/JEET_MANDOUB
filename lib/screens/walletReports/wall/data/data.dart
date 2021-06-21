import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:jeet/screens/walletReports/wall/data/model.dart';
import 'package:jeet/screens/walletReports/wall/enums.dart';
import 'package:jeet/network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<List<WalletReportsItem>> findWalletsByFilter(
  FilterType filterType,
  WalletStatus orderStatus,
  DateTime from,
  DateTime to,
) async {
  final _prefs = await SharedPreferences.getInstance();

  final _endPoint = findFilter(filterType);
  final _client = NetWork();
  final response = filterType == FilterType.period
      ? await _client.postData(
          url: _endPoint,
          formData: FormData.fromMap(
            {
              "from_date": from,
              "to_date": to,
            },
          ),
          headers: {
            HttpHeaders.acceptHeader: 'application/json',
            'Authorization':  token ?? 'Bearer ' + _prefs.getString("token"),
          },
        )
      : await _client.getData(
          url: _endPoint,
          headers: {
            HttpHeaders.acceptHeader: 'application/json',
            'Authorization': token ?? 'Bearer ' + _prefs.getString("token"),
          },
        );

  final isValidResponse = response['msg'] == 'success';

  if (!isValidResponse) throw response['msg'];
    return _byFilter(response,filterType,orderStatus);


}
String get token => "Bearer H3ur3rgKVetZAbn09oOUeyeFsqYJweWVZe4Y1bfJrgz75khq2DKlLYk1AfcEfw5HnL2DjZ0O3OoIdFUU3k4n9QMsJ0VKQIYFDWRA";

List<WalletReportsItem> _byFilter(
    dynamic data, FilterType filterType, WalletStatus status) {
  try{
  if (filterType == null) {

    switch(status){
      case WalletStatus.All:
        final list = data['data']['all'];
        return map(list);
      case WalletStatus.Charge:
        final list = data['data']['recharges'];
        return map(list);
      case WalletStatus.Withdraw:
        final list = data['data']['withdraw'];
        return map(list);
    }



  } else {
    switch (status) {
      case WalletStatus.All:
        final list = data['data'];
        return map(list);
      case WalletStatus.Charge:
        final list = data['data'].where((e) => e['title'] == "دفع اكتروني").toList();
        return map(list);

      case WalletStatus.Withdraw:
        final list = data['data'].where((e) => e['title'] == "استرجاع رصيد").toList();
        return map(list);
    }
  }
  }catch(e,st){
    log(filterType.toString());
    log(status.toString());
    log(e.toString());
    log(st.toString());
    return [];
  }
}

List<WalletReportsItem> map(List data) {
  return data.map((e) => WalletReportsItem.fromMap(e)).toList();
}

String findFilter(FilterType filterType) {
  switch (filterType) {
    case FilterType.day:
      return 'search_by_day';

    case FilterType.month:
      return 'search_by_month';

    case FilterType.yaer:
      return 'search_by_year';

    case FilterType.period:
      return 'search_from_to';
  }
  return 'dealerwalletreports';
}
