import 'package:tkfood/models/models.dart';

abstract class BaseVoucherRepository {
  Future<bool> searchVoucher({required String code});
  Stream<List<Voucher>> getVouchers();
}
