import 'package:flutter/material.dart';

/// ════════════════════════════════════════════════════════
///  60 - 30 - 10  COLOR RULE  —  Shoes Hub Design System
/// ════════════════════════════════════════════════════════
///
///  60% → DOMINANT  (backgrounds, surfaces, cards, inputs)
///         AppColors.background  #F5F6FA  light grey-white
///         AppColors.surface     #FFFFFF  pure white
///
///  30% → SECONDARY (structure, text, nav, borders, icons)
///         AppColors.primary     #1A1A2E  deep navy
///
///  10% → ACCENT    (CTA buttons, prices, badges, links)
///         AppColors.accent      #E94560  red-pink
///
///  Rule: NEVER use accent as a background.
///        NEVER use primary as a CTA button color.
///        NEVER use background/surface as text color.
/// ════════════════════════════════════════════════════════

class AppColors {
  AppColors._();

  // ── 60% — Dominant (backgrounds & surfaces) ────────────
  static const background     = Color(0xFFF5F6FA); // scaffold, page bg
  static const surface        = Color(0xFFFFFFFF); // cards, sheets, inputs
  static const surfaceVariant = Color(0xFFF0F0F5); // input fill, chip bg
  static const divider        = Color(0xFFE0E0E0); // borders, separators

  // ── 30% — Secondary (structure & navigation) ───────────
  static const primary        = Color(0xFF1A1A2E); // nav, appbar, text, icons
  static const primaryLight   = Color(0xFF16213E); // hover / pressed state

  // ── 10% — Accent (CTA, prices, highlights only) ────────
  static const accent         = Color(0xFFE94560); // buttons, prices, badges

  // ── Text (always on 60% surfaces) ─────────────────────
  static const textPrimary    = Color(0xFF1A1A1A); // headings, labels
  static const textSecondary  = Color(0xFF6B7280); // body, subtitles
  static const textHint       = Color(0xFFADB5BD); // placeholders, captions
  static const textOnDark     = Color(0xFFFFFFFF); // text on primary/accent

  // ── Semantic (status colors — use sparingly) ───────────
  static const success        = Color(0xFF27AE60);
  static const warning        = Color(0xFFF2994A);
  static const error          = Color(0xFFEB5757);
  static const info           = Color(0xFF2F80ED);

  // ── Dark theme (same 60-30-10 rule, inverted) ──────────
  // 60% dark dominant
  static const darkBackground     = Color(0xFF0F0F1A);
  static const darkSurface        = Color(0xFF1A1A2E);
  static const darkSurfaceVariant = Color(0xFF16213E);
  // 30% dark secondary → accent becomes the structure color in dark
  static const darkPrimary        = Color(0xFFE2E8F0);
  // 10% dark accent → same red-pink pops on dark bg
  // accent stays Color(0xFFE94560)
}

/// ════════════════════════════════════════════════════════
///  Quick reference — use this when deciding which color
///  to reach for in a widget.
///
///  BUILDING A SCREEN?          → AppColors.background (60%)
///  BUILDING A CARD/SHEET?      → AppColors.surface (60%)
///  BUILDING AN INPUT?          → AppColors.surfaceVariant (60%)
///  BUILDING A NAV/APPBAR?      → AppColors.primary (30%)
///  WRITING BODY TEXT?          → AppColors.textSecondary (30%)
///  WRITING A HEADING?          → AppColors.textPrimary (30%)
///  BUILDING A CTA BUTTON?      → AppColors.accent (10%)
///  SHOWING A PRICE/BADGE?      → AppColors.accent (10%)
///  SHOWING A LINK/HIGHLIGHT?   → AppColors.accent (10%)
/// ════════════════════════════════════════════════════════
