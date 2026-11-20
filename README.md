# ☕ KoNyoHa MobileApp

Aplikasi pemesanan dan manajemen operasional kafe berbasis **Flutter** untuk **KoNyoHa Cafe** (menyediakan berbagai menu Makanan dan Minuman). Aplikasi ini dirancang dengan arsitektur *multi-role* menggunakan **Riverpod** dan terintegrasi dengan **Supabase** sebagai backend database.

---

## 🚀 Cara Menjalankan Proyek di Laptop Lain

### Prasyarat
Pastikan perangkat tujuan sudah terpasang:
* [Flutter SDK](https://docs.flutter.dev/get-started/install)
* Git
* Android Studio / VS Code (beserta Emulator Android atau perangkat HP fisik dengan *USB Debugging* aktif)
* Koneksi internet (untuk terhubung ke *cloud* Supabase)

### Langkah Instalasi

1. **Clone Repository**
   ```bash
   git clone <url-repository-konyoha>
   cd konyoha_mobile
   ```

2. **Konfigurasi Environment (`.env`)**
   Buat file baru bernama `.env` di direktori utama proyek (sejajar dengan `pubspec.yaml`), lalu isi dengan kredensial Supabase proyek:
   ```env
   SUPABASE_URL=[https://xxxxxxxxxxxx.supabase.co](https://xxxxxxxxxxxx.supabase.co)
   SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6...
   ```

3. **Unduh Dependensi Flutter**
   ```bash
   flutter doctor
   flutter pub get
   ```

4. **Jalankan Code Generator (Opsional — jika menggunakan `riverpod_generator`)**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

5. **Jalankan Aplikasi**
   Pastikan emulator sudah menyala atau HP Android sudah terhubung, lalu jalankan:
   ```bash
   flutter devices
   flutter run
   ```
---

## 🛠️ Tech Stack

* **Framework:** Flutter (Dart)
* **State Management:** Flutter Riverpod (`flutter_riverpod` / `riverpod_annotation`)
* **Backend & Database:** Supabase (`supabase_flutter`) — *Catatan: Menggunakan database SQL (PostgreSQL) yang di-hosting di Supabase.*
* **Architecture:** Feature-First Clean Architecture

---

## 👥 Aktor & Aturan Bisnis (Multi-Role)

Aplikasi ini dibagi menjadi **3 aktor utama** dengan hak akses dan alur yang berbeda:

### 1. Pengunjung (Customer) — *Tanpa Login*
* Dapat langsung mengakses katalog menu makanan dan minuman tanpa perlu membuat akun atau login.
* Melakukan pencarian menu dan filter berdasarkan kategori (Makanan / Minuman).
* Kustomisasi pesanan (contoh: *Hot/Ice*, level gula, dan catatan tambahan).
* Mengelola keranjang belanja (*Cart*) dan melakukan *Checkout*.
* **Aturan Khusus Pengantaran (Delivery):** 
  * Pesanan **$\le 8$ item**: Hanya tersedia opsi *Dine-in* (Makan di tempat) atau *Take-away* (Bawa pulang).
  * Pesanan **$> 8$ item**: Sistem otomatis membuka opsi **Delivery (Diantar)** beserta input alamat pengantaran.

### 2. Kasir (Cashier) — *Wajib Login*
* Menerima dan memproses pesanan masuk dari pengunjung secara *real-time*.
* Memperbarui status pesanan (Menunggu Pembayaran $\rightarrow$ Diproses $\rightarrow$ Siap / Diantar $\rightarrow$ Selesai).
* Mengakses **Riwayat Pesanan (*Order History*)** untuk memantau transaksi harian.

### 3. Pemilik (Owner) — *Wajib Login*
* Mengelola data master menu (**CRUD Menu**: Tambah, Lihat, Ubah, dan Hapus menu makanan/minuman beserta harga, stok, dan foto).
* Memantau ringkasan penjualan dan performa kafe.
* Mengelola akun staf (Kasir).

---

## ✨ Fitur Utama

- [x] **Katalog Menu Interaktif:** Daftar menu makanan & minuman dengan fitur pencarian dan filter kategori.
- [x] **Kustomisasi Varian:** Pilihan opsi penyajian (*Hot/Ice*, level gula, catatan khusus per item).
- [x] **Smart Cart & Conditional Delivery:** Keranjang belanja otomatis mendeteksi jumlah item ($> 8$ item) untuk mengaktifkan fitur *delivery*.
- [x] **Manajemen Pesanan & Riwayat (Kasir):** Pemantauan transaksi dan riwayat pesanan khusus dashboard kasir.
- [x] **Manajemen Menu / CRUD (Pemilik):** Pengelolaan daftar menu langsung dari aplikasi oleh pemilik kafe.
- [ ] **UI/UX Design:** *Dalam tahap perancangan desain antarmuka.*

---

## 📂 Struktur Folder Proyek (Rekomendasi Riverpod)

```text
lib/
├── core/
│   ├── constants/        # Konstanta aplikasi, aturan bisnis (misal: minDeliveryItems = 8)
│   ├── network/          # Konfigurasi inisialisasi Supabase Client
│   ├── router/           # Routing & Guard berdasarkan Role (Guest, Kasir, Pemilik)
│   └── theme/            # Konfigurasi warna, tipografi, dan tema (Menunggu tahap desain)
├── features/
│   ├── auth/             # Login khusus Kasir & Pemilik
│   ├── menu/             # Katalog menu (Pengunjung) & CRUD Menu (Pemilik)
│   ├── cart_checkout/    # Keranjang belanja, kustomisasi item, & logika delivery > 8 item
│   └── orders/           # Proses pesanan aktif & Riwayat Pesanan (Kasir)
└── main.dart             # Entry point aplikasi dengan ProviderScope
```

---

## 🗄️ Rancangan Struktur Database (Supabase)

Berikut adalah gambaran tabel utama yang perlu disiapkan di dashboard Supabase:

1. **`profiles` (Users)**
   * `id` (UUID, Primary Key, relasi ke `auth.users`)
   * `name` (String)
   * `role` (Enum/String: `'kasir'`, `'pemilik'`)
2. **`menus`**
   * `id` (UUID / Serial, Primary Key)
   * `name` (String)
   * `category` (String: `'makanan'`, `'minuman'`)
   * `price` (Numeric / Integer)
   * `image_url` (String)
   * `is_available` (Boolean)
3. **`orders`**
   * `id` (UUID / Serial, Primary Key)
   * `customer_name` (String)
   * `order_type` (String: `'dine_in'`, `'take_away'`, `'delivery'`)
   * `delivery_address` (Text, *Nullable — wajib diisi jika total item > 8 & pilih delivery*)
   * `total_items` (Integer)
   * `total_price` (Numeric / Integer)
   * `status` (String: `'pending'`, `'processing'`, `'completed'`, `'cancelled'`)
   * `created_at` (Timestamp)
4. **`order_items`**
   * `id` (UUID / Serial, Primary Key)
   * `order_id` (Foreign Key $\rightarrow$ `orders.id`)
   * `menu_id` (Foreign Key $\rightarrow$ `menus.id`)
   * `quantity` (Integer)
   * `customization` (String / JSON — *misal: Ice, Less Sugar*)
   * `subtotal` (Numeric / Integer)

---

## 🚀 Cara Menjalankan Proyek

1. **Clone repositori ini:**
   ```bash
   git clone https://github.com/username/konyoha-mobile-app.git
   cd konyoha-mobile-app
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Konfigurasi Environment Supabase:**
   Buat file `.env` pada root proyek dan masukkan kredensial proyek Supabase milikmu:
   ```env
   SUPABASE_URL=https://your-project-id.supabase.co
   SUPABASE_ANON_KEY=your-anon-key
   ```

4. **Jalankan aplikasi:**
   ```bash
   flutter run
   ```

---

## 📅 Roadmap Pengembangan

- [x] Perancangan arsitektur sistem & aturan bisnis
- [ ] Setup proyek Flutter, struktur folder Riverpod, & koneksi Supabase
- [ ] Implementasi fitur Pengunjung (Katalog, Kustomisasi, Keranjang, Aturan Delivery $> 8$ item)
- [ ] Implementasi autentikasi & fitur Kasir (Order masuk & Riwayat Pesanan)
- [ ] Implementasi fitur Pemilik (CRUD Menu)
- [ ] Penerapan desain UI/UX final & pengujian (*Testing*)