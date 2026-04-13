/// Single source of truth for app-wide identity.
/// Change the app name, version, or logo here — it updates everywhere.
class AppConstants {
  AppConstants._();

  // ── Identity ───────────────────────────────────────────
  static const String appName = 'Shoes Hub';
  static const String appTagline = 'Fresh kicks daily';
  static const String appVersion = '1.0.0';

  // ── Logo / Brand assets ────────────────────────────────
  static const String logoPath = 'assets/images/logo.png';
  static const String logoWhitePath = 'assets/images/logo_white.png';
  static const String splashLogoPath = 'assets/images/splash_logo.png';

  // ── Placeholder images ─────────────────────────────────
  static const String defaultUserAvatar =
      'https://www.pngall.com/wp-content/uploads/5/Profile.png';
  static const String defaultProductImage =
      'https://via.placeholder.com/300x300?text=No+Image';

  // ── Pagination ─────────────────────────────────────────
  static const int defaultPageSize = 20;

  // ── Cache ──────────────────────────────────────────────
  static const Duration cacheTimeout = Duration(minutes: 10);
}
