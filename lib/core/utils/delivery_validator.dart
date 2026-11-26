// import '../constants/app_constants.dart'; // Aktifkan baris ini jika file Orang 1 sudah siap

class DeliveryValidator {
  // Batas minimal item sesuai ketentuan tugas (totalItems > 8)
  static const int _minItems = 8;

  /// Mengecek apakah total pesanan memenuhi syarat layanan delivery
  static bool isEligibleForDelivery(int totalItems) {
    return totalItems > _minItems;
    // Jika memakai konstanta dari Orang 1, ganti baris atas menjadi:
    // return totalItems > AppConstants.minDeliveryItems;
  }

  /// Mengembalikan pesan pemberitahuan jika jumlah pesanan belum memenuhi syarat
  static String getValidationMessage(int totalItems) {
    if (isEligibleForDelivery(totalItems)) {
      return 'Pesanan memenuhi syarat layanan delivery.';
    }

    final int kurang = (_minItems + 1) - totalItems;
    return 'Minimal pembelian untuk layanan delivery adalah lebih dari $_minItems item. Tambah $kurang item lagi.';
  }
}
