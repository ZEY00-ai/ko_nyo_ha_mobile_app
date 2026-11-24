// penanda mode apk
enum AppMode {
  pengunjung, //pengunjung tidak perlu login
  staff; //pemilik dan kasir

  bool get isPengunjung => this == AppMode.pengunjung; //true jika apk berjalan sebagai apk pengunjung
  bool get isStaff => this == AppMode.staff; //true jika apk berjalan sebagai apk staff

  String get appTitle { //Judul aplikasi yang ditampilkan di UI
    switch (this) {
      case AppMode.pengunjung:
        return 'KoNyoHa'; //untuk pengunjung KoNyoHa
      case AppMode.staff:
        return 'KoNyoHa Staff'; //untuk staff KoNyoHa Staff
    }
  }
}