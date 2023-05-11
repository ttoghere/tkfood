// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  final String? id;
  final String code;
  final int value;

  const Voucher({
    required this.id,
    required this.code,
    required this.value,
  });

  @override
  List<Object?> get props => [id, code, value];

  static List<Voucher> vouchers = const [
    Voucher(id: "1", code: 'SAVE5', value: 5),
    Voucher(id: "2", code: 'SAVE10', value: 10),
    Voucher(id: "3", code: 'SAVE15', value: 15),
  ];

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'code': code,
      'value': value,
    };
  }

  factory Voucher.fromSnapshot(DocumentSnapshot map) {
    return Voucher(
      id:map.id,
      code: map['code'] as String,
      value: map['value'] as int,
    );
  }

  Voucher copyWith({
    String? id,
    String? code,
    int? value,
  }) {
    return Voucher(
      id: id ?? this.id,
      code: code ?? this.code,
      value: value ?? this.value,
    );
  }
}
