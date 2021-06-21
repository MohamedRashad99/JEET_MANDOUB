import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class WalletReportsItem extends Equatable {
  final int id;
  final int userId;
  final String code;
  final String title;
  final String titleEn;
  final int amount;
  final int type;
  final String createdAt;
  final String updatedAt;
  final int day;
  final int month;
  final int year;
  WalletReportsItem({
    @required this.id,
    @required this.code,
    @required this.userId,
    @required this.title,
    @required this.titleEn,
    @required this.amount,
    @required this.type,
    @required this.createdAt,
    @required this.updatedAt,
    @required this.day,
    @required this.month,
    @required this.year,
  });

  WalletReportsItem copyWith({
    int id,
    String code,
    int userId,
    String title,
    String titleEn,
    int amount,
    int type,
    String createdAt,
    String updatedAt,
    int day,
    int month,
    int year,
  }) {
    return WalletReportsItem(
      id: id ?? this.id,
      code: code ?? this.code,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      titleEn: titleEn ?? this.titleEn,
      amount: amount ?? this.amount,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      day: day ?? this.day,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'code': code,
      'user_id': userId,
      'title': title,
      'title_en': titleEn,
      'amount': amount,
      'type': type,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'day': day,
      'month': month,
      'year': year,

    };
  }

  factory WalletReportsItem.fromMap(Map<String, dynamic> map) {
    return WalletReportsItem(
      id: map['id']?.toInt(),
      code: map['code'],
      userId: map['user_id']?.toInt(),
      title: map['title'],
      titleEn: map['title_en'],
      amount: map['amount'] as int,
      type: map['type']?.toInt(),
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      day: map['day']?.toInt(),
      month: map['month']?.toInt(),
      year: map['year']?.toInt(),
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      code,
      userId,
      title,
      titleEn,
      amount,
      type,
      createdAt,
      updatedAt,
      day,
      month,
      year,
    ];
  }
}
