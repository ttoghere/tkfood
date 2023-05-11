import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tkfood/models/voucher_model.dart';
import 'package:tkfood/repositories/voucher/base_voucher_repository.dart';

class VoucherRepository extends BaseVoucherRepository {
  final FirebaseFirestore _firebaseFirestore;
  VoucherRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;
  @override
  Stream<List<Voucher>> getVouchers() {
    return _firebaseFirestore.collection("vouchers").snapshots().map((event) {
      return event.docs.map((doc) => Voucher.fromSnapshot(doc)).toList();
    });
  }

  @override
  Future<bool> searchVoucher({required String code}) async {
    final voucher = await _firebaseFirestore
        .collection('vouchers')
        .where('code', isEqualTo: code)
        .get();

    return voucher.docs.isNotEmpty;
  }
}
