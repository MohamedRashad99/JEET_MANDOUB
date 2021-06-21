import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jeet/screens/walletReports/wall/cubit/orders_rec_cubit.dart';


import 'package:jeet/screens/walletReports/wall/views/filter_type.view.dart';
import 'package:jeet/screens/walletReports/wall/views/from_to_picker.dart';
import 'package:jeet/screens/walletReports/wall/enums.dart';
import 'package:jeet/screens/walletReports/wall/tab/tab.dart';
import 'package:jeet/screens/walletReports/wall/views/tab_bar.view.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jeet/constants.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';



class WalletReportsPage extends StatefulWidget {
  @override
  _WalletReportsPageState createState() => _WalletReportsPageState();
}

class _WalletReportsPageState extends State<WalletReportsPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WalletRepCubit(),
      child: Builder(
        builder: (context) => Scaffold(
          backgroundColor: kBackgroundColor,
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            title: Text(
              LocaleKeys.walletReport.tr(),
              style: TextStyle(fontSize: 20, fontFamily: 'dinnextl bold'),
            ),
          ),
          body: Column(
            children: <Widget>[
              FilterByDropMenu(),
              FromToPicker(),
              WallTabBar(_tabController),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    WalletRecTab(
                      WalletStatus.All,
                    ),
                    WalletRecTab(
                      WalletStatus.Charge,
                    ),
                    WalletRecTab(
                      WalletStatus.Withdraw,
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
