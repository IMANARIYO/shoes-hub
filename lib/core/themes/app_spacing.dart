/// Design token spacing scale.
/// Use these instead of raw numbers anywhere you write padding/margin/gap.
///
/// Usage:
///   SizedBox(height: AppSpacing.md)
///   Padding(padding: EdgeInsets.all(AppSpacing.lg))
class AppSpacing {
  AppSpacing._();

  static const double xxs = 2.0;
  static const double xs  = 4.0;
  static const double sm  = 8.0;
  static const double md  = 16.0;
  static const double lg  = 24.0;
  static const double xl  = 32.0;
  static const double xxl = 48.0;
  static const double xxxl = 64.0;

  // ── Border radius tokens ───────────────────────────────
  static const double radiusSm  = 6.0;
  static const double radiusMd  = 12.0;
  static const double radiusLg  = 16.0;
  static const double radiusXl  = 24.0;
  static const double radiusFull = 999.0;

  // ── Icon sizes ─────────────────────────────────────────
  static const double iconSm  = 16.0;
  static const double iconMd  = 24.0;
  static const double iconLg  = 32.0;

  // ── Button heights ─────────────────────────────────────
  static const double buttonHeightSm = 36.0;
  static const double buttonHeightMd = 48.0;
  static const double buttonHeightLg = 56.0;
}
