import 'package:flutter/material.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/modules/rec/cubit/orders_rec_cubit.dart';
import 'package:jeet/modules/rec/data/model.dart';
import 'package:jeet/modules/rec/enums.dart';
import 'package:jeet/modules/rec/views/recordCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../constants.dart';
import 'cubit/rec_tab_cubit.dart';

class OrderRecTab extends StatelessWidget {
  final OrderStatus type;
  final ValueChanged<RecoerdItem> onTap;
  const OrderRecTab(this.type, {Key key, @required this.onTap,}) : super(key: key);

  @override
  Widget build(_) {
    return BlocProvider(
      create: (_) => RecTabCubit(
        type,
        OrdersRecCubit.of(_),
      ),
      child: Builder(
        builder: (context) => BlocBuilder<RecTabCubit, RecTabState>(
          builder: (context, state) {
            if (state is RecTabLoading) {
              return Center(child: SpinKitChasingDots(
                size: 20,
                color: kPrimaryColor,
              ));
            } else if (state is RecTabCantLoad) {
              return Center(child: Text(state.msg));
            } else if (state is RecTabLoaded) {
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
                itemBuilder: (_, i) => OrderCard(
                  onTap: () => onTap(state.items[i]),
                  code: state.items[i].code ?? 'null',
                  date: state.items[i].accepted_date ?? 'null',
                  dealerName: state.items[i].dealer_name ?? 'null',
                  id:  state.items[i].id ??'null'
                  // dealerName: state.items[i].,
                ),
              );
            }
            throw state.runtimeType.toString();
          },
        ),
      ),
    );
  }
}
