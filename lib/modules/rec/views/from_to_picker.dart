import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:jeet/generated/locale_keys.g.dart';
import 'package:jeet/modules/rec/cubit/orders_rec_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../constants.dart';

class FromToPicker extends StatelessWidget {
  const FromToPicker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = OrdersRecCubit.of(context);
    final size = MediaQuery.of(context).size;
    final height = size.height;
    return BlocBuilder<OrdersRecCubit, OrdersRecState>(builder: (_, state) {
      if (state is FilterByPeriod) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Builder(
              builder: (context) => GestureDetector(
                child: CircleAvatar(
                  maxRadius: 25,
                  child: Icon(
                    Icons.search,
                    size: 30,
                  ),
                ),
              ),
            ),
            Container(
              width: height * .18,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'yyyy-MM-dd',
                cursorColor: kPrimaryColor,
                firstDate: DateTime.utc(2020),
                lastDate: DateTime.utc(2200),
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: LocaleKeys.dateOf.tr(),
                  suffixIcon: Icon(Icons.date_range),
                  hintStyle: TextStyle(fontSize: 14, color: kTextColor, fontFamily: "dinnextl medium"),
                  filled: true,
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kTextColor, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                use24HourFormat: false,
                onChanged: (val) => cubit.from = DateTime.parse(val),
                validator: (val) {
                  if (val.isEmpty) {
                    return "يرجى ادخال التاريخ";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            Container(
              width: height * .18,
              padding: EdgeInsets.symmetric(vertical: 5),
              child: DateTimePicker(
                type: DateTimePickerType.date,
                dateMask: 'yyyy-MM-dd',
                cursorColor: kPrimaryColor,
                firstDate: DateTime.utc(2020),
                lastDate: DateTime.utc(2200),
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: LocaleKeys.dateOf.tr(),
                  suffixIcon: Icon(Icons.date_range),
                  hintStyle: TextStyle(fontSize: 14, color: kTextColor, fontFamily: "dinnextl medium"),
                  filled: true,
                  focusColor: Colors.white,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kTextColor, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: kPrimaryColor, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                use24HourFormat: false,
                onChanged: (val) => cubit.to = DateTime.parse(val),
                validator: (val) {
                  if (val.isEmpty) {
                    return "يرجى ادخال التاريخ";
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ],
        );
      }
      return const SizedBox();
    });
  }
}
