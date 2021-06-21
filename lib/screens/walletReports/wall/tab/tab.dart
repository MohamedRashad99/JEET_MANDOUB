import 'package:flutter/material.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/screens/walletReports/wall/cubit/orders_rec_cubit.dart';
import 'package:jeet/screens/walletReports/wall/enums.dart';
import 'package:jeet/screens/walletReports/wall/tab/cubit/rec_tab_cubit.dart';
import 'package:jeet/screens/walletReports/wall/views/recordCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../constants.dart';


class WalletRecTab extends StatelessWidget {
  final WalletStatus type;
  const WalletRecTab(this.type,);

  @override
  Widget build(_) {
    return BlocProvider(
      create: (_) => WallatTabCubit(
        type,
        WalletRepCubit.of(_),
      ),
      child: Builder(
        builder: (context) => BlocBuilder<WallatTabCubit, WalletTabState>(
          builder: (context, state) {
            if (state is WalletTabLoading) {
              return Center(child: SpinKitChasingDots(
                size: 20,
                color: kPrimaryColor,
              ));
            } else if (state is WalletTabCantLoad) {
              return Center(child: Text(state.msg));
            } else if (state is WalletTabLoaded) {
              return state.items.isEmpty ?  Center(
                  child: Text(
                    LocaleKeys.emptyOrders.tr(),
                    style: TextStyle(
                      color: kTextColor,
                      fontFamily: "dinnextl bold",
                      fontSize: 18,
                    ),)
              ):ListView.builder(
                shrinkWrap: true,
                itemCount:  state.items.length,
                itemBuilder: (_, i) => WalletCard(
                    title: state.items[i].title ?? 'null',
                    amount:state.items[i].amount ?? 'null' ,
                    createdAt: state.items[i].createdAt.toString() ?? 'null'

                )
              );
            }
            throw state.runtimeType.toString();
          },
        ),
      ),
    );
  }
}
