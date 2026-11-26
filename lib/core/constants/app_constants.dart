// Tempat menyimpan semua nilai tetap (konstanta) yang dipakai di seluruh aplikasi.
// Class ini hanya sebagai "wadah", jadi kamu tidak perlu membuat objeknya

class AppConstants {
  AppConstants._();

  //Identitas Aplikasi & Toko
  static const String customerAppName = 'KoNyoHa'; //nama apk untuk versi pengunjung
  static const String staffAppName = 'KoNyoHa staff'; // nama apk untuk staff
  static const String storeName = 'KoNyoHa'; //nama toko untuk header struk
  static const String storeAdress = 'Jl. Tigo Jangko Raya, Lintau Buo, Tanah Datar'; //alamat untuk struk

  //ucapan terimakasih di struk 
  //contoh pemesan daffa nah Temikasih Daffa .....
  static String receiptThankYou(String customerName) {
    return 'Terima Kasih, $customerName, telah memesan di $storeName!';
  }


  static const int minDeliveryItems = 8; //minimal di antar harus 8 pesanan
  static const List<String> categories = ['makanan','minuman']; //category menu 
  static const List<String> temperatures = ['Hot', 'Ice'];
  static const List<String> sugarLevels = ['Normal', 'Less Sugar', 'No Sugar'];
  static const List<String> orderTypes = ['dine_in', 'take_away', 'delivery'];

}
