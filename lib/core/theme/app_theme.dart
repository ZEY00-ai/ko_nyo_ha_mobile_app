
import 'package:flutter/material.dart';

/// Konfigurasi Tema & Desain Global Aplikasi KoNyoHa
/// Identik dengan warna Merah Maroon dan Putih.
/// Bagian Tugas: Orang 3 (PBL KoNyoHa Mobile App)
class AppTheme {
  // Private constructor agar class ini tidak dapat diinstansiasi secara langsung
  AppTheme._();

  // =========================================================================
  // 1. PALET WARNA UTAMA (KONYOHA: MERAH MAROON & PUTIH)
  // =========================================================================

  /// Warna merah maroon utama khas KoNyoHa
  static const Color primaryMaroon = Color(0xFF800020);

  /// Variasi maroon lebih gelap (untuk header, aksen tajam, dsb.)
  static const Color primaryDarkMaroon = Color(0xFF4A0013);

  /// Variasi maroon lebih terang (untuk aksen sekunder / badge)
  static const Color primaryLightMaroon = Color(0xFFA31D36);

  /// Warna putih bersih khas KoNyoHa
  static const Color pureWhite = Color(0xFFFFFFFF);

  /// Warna latar belakang (putih lembut / off-white agar nyaman di mata)
  static const Color backgroundWhite = Color(0xFFF8F9FA);

  /// Warna permukaan komponen seperti Card, Modal, BottomSheet
  static const Color surfaceWhite = Color(0xFFFFFFFF);

  /// Warna teks utama (hitam pekat untuk keterbacaan tinggi di atas latar putih)
  static const Color textPrimary = Color(0xFF1E1E1E);

  /// Warna teks sekunder / subjudul (abu-abu netral)
  static const Color textSecondary = Color(0xFF6E6E6E);

  /// Warna teks di atas elemen maroon (selalu putih)
  static const Color textOnMaroon = Color(0xFFFFFFFF);

  /// Warna border dan divider halus
  static const Color borderGrey = Color(0xFFE0E0E0);
  static const Color dividerGrey = Color(0xFFEEEEEE);

  /// Warna status
  static const Color errorColor = Color(0xFFD32F2F);
  static const Color successColor = Color(0xFF388E3C);
  static const Color warningColor = Color(0xFFFFA000);

  // =========================================================================
  // 2. KONFIGURASI TEMA TERANG GLOBAL (LIGHT THEME)
  // Digunakan di app.dart untuk menyelaraskan tampilan APK Pengunjung & Staff
  // =========================================================================
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryMaroon,
      scaffoldBackgroundColor: backgroundWhite,

      // --- ColorScheme ---
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: primaryMaroon,
        onPrimary: pureWhite,
        primaryContainer: primaryLightMaroon,
        onPrimaryContainer: pureWhite,
        secondary: primaryMaroon,
        onSecondary: pureWhite,
        error: errorColor,
        onError: pureWhite,
        surface: surfaceWhite,
        onSurface: textPrimary,
      ),

      // --- AppBar Theme (Maroon elegan dengan tulisan & ikon putih) ---
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryMaroon,
        foregroundColor: pureWhite,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: pureWhite,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.3,
        ),
        iconTheme: IconThemeData(
          color: pureWhite,
        ),
      ),

      // --- Card Theme (Putih bersih dengan bayangan lembut) ---
      cardTheme: CardThemeData(
        color: surfaceWhite,
        elevation: 2,
        shadowColor: const Color(0x10000000), // Bayangan hitam lembut (transparansi ~6%)
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: borderGrey, width: 0.8),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      ),

      // --- ElevatedButton Theme (Tombol utama Maroon dengan teks Putih) ---
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryMaroon,
          foregroundColor: pureWhite,
          elevation: 1,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // --- OutlinedButton Theme (Border Maroon dengan teks Maroon) ---
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: primaryMaroon,
          side: const BorderSide(color: primaryMaroon, width: 1.5),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // --- TextButton Theme ---
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: primaryMaroon,
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // --- Input Decoration Theme (Form, Input teks & Pencarian) ---
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: pureWhite,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: const TextStyle(color: textSecondary, fontSize: 14),
        labelStyle: const TextStyle(color: textSecondary, fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: borderGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: borderGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryMaroon, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: errorColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: errorColor, width: 2),
        ),
      ),

      // --- Floating Action Button Theme ---
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: primaryMaroon,
        foregroundColor: pureWhite,
        elevation: 3,
      ),

      // --- Bottom Navigation Bar Theme ---
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: pureWhite,
        selectedItemColor: primaryMaroon,
        unselectedItemColor: textSecondary,
        elevation: 8,
        type: BottomNavigationBarType.fixed,
      ),

      // --- Circular & Linear Progress Indicator Theme ---
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: primaryMaroon,
      ),

      // --- Divider Theme ---
      dividerTheme: const DividerThemeData(
        color: dividerGrey,
        thickness: 1,
        space: 1,
      ),

      // --- Typography / Text Theme ---
      textTheme: const TextTheme(
        headlineLarge: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        headlineMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        titleMedium: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        bodyLarge: TextStyle(
          fontSize: 15,
          color: textPrimary,
        ),
        bodyMedium: TextStyle(
          fontSize: 13,
          color: textPrimary,
        ),
        bodySmall: TextStyle(
          fontSize: 12,
          color: textSecondary,
        ),
      ),
    );
  }
}
