import 'package:flutter/material.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/modules/rec/cubit/orders_rec_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:jeet/modules/rec/enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants.dart';

class FilterByDropMenu extends StatelessWidget {
  const FilterByDropMenu();

  FilterType _stateToFilterType(OrdersRecState state) {
    if (state is FilterByDay) {
      return FilterType.day;
    } else if (state is FilterByMonth) {
      return FilterType.month;
    } else if (state is FilterByYear) {
      return FilterType.yaer;
    } else if (state is FilterByPeriod) {
      return FilterType.period;
    }
    return null;
  }

  Widget build(BuildContext context) {
    final cubit = OrdersRecCubit.of(context);
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kHomeColor),
      padding: EdgeInsets.symmetric(horizontal: size.width * .05),
      margin: EdgeInsets.symmetric(horizontal: 25, vertical: 18,),
      height: size.height * 0.07,
      width: size.width * 0.9,
      child: BlocBuilder<OrdersRecCubit, OrdersRecState>(
        builder: (_, state) {
          final filterType = _stateToFilterType(state);
          return DropdownButton<FilterType>(
            isExpanded: true,
            dropdownColor: Colors.white,
            value: filterType,
            hint: Text(LocaleKeys.search.tr()),
            underline: SizedBox(),
            onChanged: (type) => cubit.filterBy(type),
            icon: Icon(
              Icons.search_sharp,
              color: Colors.grey,
            ),
            items: [
              DropdownMenuItem(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    LocaleKeys.day.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: kPrimaryColor),
                  ),
                ),
                value: FilterType.day,
              ),
              DropdownMenuItem(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    LocaleKeys.month.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: kPrimaryColor),
                  ),
                ),
                value: FilterType.month,
              ),
              DropdownMenuItem(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    LocaleKeys.year.tr(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: kPrimaryColor),
                  ),
                ),
                value: FilterType.yaer,
              ),
              DropdownMenuItem(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    "${LocaleKeys.from.tr()} ${LocaleKeys.to.tr()}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: kPrimaryColor),
                  ),
                ),
                value: FilterType.period,
              ),
            ],
          );
        },
      ),
    );
  }
}
