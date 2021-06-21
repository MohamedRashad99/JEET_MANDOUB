import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class RecoerdItem extends Equatable {
  final int id;
  final String accepted_date;
  final String code;
  final String dealer_name;
  final String dealer_name_en;
  // final int userId;
  // final String title;
  // final String titleEn;
  // final int amount;
  // final int type;
  // final String createdAt;
  // final String updatedAt;
  // final int day;
  // final int month;
  // final int year;
  RecoerdItem({
    @required this.id,
    @required this.accepted_date,
    @required this.code,
    @required this.dealer_name,
    @required this.dealer_name_en,
    // @required this.userId,
    // @required this.title,
    // @required this.titleEn,
    // @required this.amount,
    // @required this.type,
    // @required this.createdAt,
    // @required this.updatedAt,



    // @required this.day,
    // @required this.month,
    // @required this.year,
  });

  RecoerdItem copyWith({
    int id,
    String accepted_date,
    String code,
    String dealer_name,
    String dealer_name_en,
    // int userId,
    // String title,
    // String titleEn,
    // int amount,
    // int type,
    // String createdAt,
    // String updatedAt,

    // int day,
    // int month,
    // int year,
  }) {
    return RecoerdItem(
      id: id ?? this.id,
      accepted_date: accepted_date ?? this.accepted_date,
      code: code ?? this.code,
      dealer_name:  dealer_name ?? this.dealer_name,
      dealer_name_en: dealer_name_en ?? this.dealer_name_en

      // userId: userId ?? this.userId,
      // title: title ?? this.title,
      // titleEn: titleEn ?? this.titleEn,
      // amount: amount ?? this.amount,
      // type: type ?? this.type,
      // createdAt: createdAt ?? this.createdAt,
      // updatedAt: updatedAt ?? this.updatedAt,
      // day: day ?? this.day,
      // month: month ?? this.month,
      // year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accepted_date':accepted_date,
      'code': code,
      'dealer_name':dealer_name,
      'dealer_name_en':dealer_name_en
      // 'user_id': userId,
      // 'title': title,
      // 'title_en': titleEn,
      // 'amount': amount,
      // 'type': type,
      // 'created_at': createdAt,
      // 'updated_at': updatedAt,
      // 'day': day,
      // 'month': month,
      // 'year': year,

    };
  }

  factory RecoerdItem.fromMap(Map<String, dynamic> map) {
    return RecoerdItem(
      id: map['id']?.toInt(),
      code: map['code'],
      accepted_date: map['accepted_date'],
      dealer_name: map['dealer_name'],
      dealer_name_en: map['dealer_name_en']
      // userId: map['user_id']?.toInt(),
      // title: map['title'],
      // titleEn: map['title_en'],
      // amount: map['amount']?.toInt(),
      // type: map['type']?.toInt(),
      // createdAt: map['created_at'],
      // updatedAt: map['updated_at'],
      // day: map['day']?.toInt(),
      // month: map['month']?.toInt(),
      // year: map['year']?.toInt(),
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      accepted_date,
      code,
      dealer_name,
      dealer_name_en
      // userId,
      // title,
      // titleEn,
      // amount,
      // type,
      // createdAt,
      // updatedAt,
      // day,
      // month,
      // year,
    ];
  }
}
