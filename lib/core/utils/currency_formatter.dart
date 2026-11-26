import 'package:intl/intl.dart';

class CurrencyFormatter {
  /// Mengubah angka (int/double) menjadi format Rupiah, contoh: Rp 15.000
  static String formatRupiah(num? amount) {
    if (amount == null || amount == 0) {
      return 'Rp 0';
    }

    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );

    return formatter.format(amount);
  }
}
