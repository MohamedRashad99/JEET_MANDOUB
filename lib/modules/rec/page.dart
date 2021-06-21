import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeet/modules/rec/enums.dart';
import 'package:jeet/modules/rec/tab/tab.dart';
import 'package:jeet/modules/rec/views/filter_type.view.dart';
import 'package:jeet/modules/rec/views/from_to_picker.dart';
import 'package:jeet/modules/rec/views/tab_bar.view.dart';
import 'package:jeet/screens/Parcels/view.dart';
import 'package:jeet/screens/statusOrders//view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import 'cubit/orders_rec_cubit.dart';

class OrdersRecordPage extends StatefulWidget {
  @override
  _OrdersRecordPageState createState() => _OrdersRecordPageState();
}

class _OrdersRecordPageState extends State<OrdersRecordPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OrdersRecCubit(),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text(
              LocaleKeys.orderRecord.tr(),
              style: TextStyle(fontSize: 20, fontFamily: 'dinnextl bold'),
            ),
          ),
          body: Column(
            children: <Widget>[
              FilterByDropMenu(),
              FromToPicker(),
              RecTabBar(_tabController),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    OrderRecTab(
                      OrderStatus.underWay,
                      onTap: (item) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ParclesPackages(
                              orderID: item.id,
                            ),
                          ),
                        );
                      },
                    ),
                    OrderRecTab(
                      OrderStatus.done,
                      onTap: (item) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ParclesPackages(
                              orderID: item.id,
                            ),
                          ),
                        );
                      },
                    ),
                    OrderRecTab(
                      OrderStatus.bounced,
                      onTap: (item) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => StatusforEveryOrders(
                              packageId: item.id,
                            ),
                          ),
                        );
                      },
                    ),
                    OrderRecTab(
                      OrderStatus.payment,
                      onTap: (item) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => StatusforEveryOrders(
                              packageId: item.id,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
