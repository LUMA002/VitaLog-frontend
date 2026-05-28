import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_radii.dart';
import 'app_typography.dart';

@immutable
class SemanticColors extends ThemeExtension<SemanticColors> {
  const SemanticColors({
    required this.completed,
    required this.completedText,
    required this.completedBorder,
    required this.pendingText,
    required this.timeText,
    required this.primaryGlow,
    required this.destructive,
  });

  final Color completed;
  final Color completedText;
  final Color completedBorder;
  final Color pendingText;
  final Color timeText;
  final Color primaryGlow;
  final Color destructive;

  static const defaults = SemanticColors(
    completed: AppColors.completed,
    completedText: AppColors.completedText,
    completedBorder: AppColors.completedBorder,
    pendingText: AppColors.pendingText,
    timeText: AppColors.timeText,
    primaryGlow: AppColors.primaryGlow,
    destructive: AppColors.destructive,
  );

  @override
  SemanticColors copyWith({
    Color? completed,
    Color? completedText,
    Color? completedBorder,
    Color? pendingText,
    Color? timeText,
    Color? primaryGlow,
    Color? destructive,
  }) {
    return SemanticColors(
      completed: completed ?? this.completed,
      completedText: completedText ?? this.completedText,
      completedBorder: completedBorder ?? this.completedBorder,
      pendingText: pendingText ?? this.pendingText,
      timeText: timeText ?? this.timeText,
      primaryGlow: primaryGlow ?? this.primaryGlow,
      destructive: destructive ?? this.destructive,
    );
  }

  @override
  SemanticColors lerp(SemanticColors? other, double t) {
    if (other == null) return this;
    return SemanticColors(
      completed: Color.lerp(completed, other.completed, t)!,
      completedText: Color.lerp(completedText, other.completedText, t)!,
      completedBorder: Color.lerp(completedBorder, other.completedBorder, t)!,
      pendingText: Color.lerp(pendingText, other.pendingText, t)!,
      timeText: Color.lerp(timeText, other.timeText, t)!,
      primaryGlow: Color.lerp(primaryGlow, other.primaryGlow, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
    );
  }
}

abstract final class AppTheme {
  static ThemeData get dark => ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          onPrimary: AppColors.primaryForeground,
          secondary: AppColors.secondary,
          onSecondary: AppColors.secondaryForeground,
          surface: AppColors.card,
          onSurface: AppColors.foreground,
          error: AppColors.destructive,
          outline: AppColors.border,
        ),
        scaffoldBackgroundColor: AppColors.background,
        cardTheme: const CardThemeData(
          color: AppColors.cardElevated,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppRadii.card),
            side: BorderSide(color: AppColors.border),
          ),
          margin: EdgeInsets.zero,
          elevation: 0,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: AppColors.muted,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(AppRadii.r),
            borderSide: BorderSide(color: AppColors.border),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(AppRadii.r),
            borderSide: BorderSide(color: AppColors.border),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(AppRadii.r),
            borderSide: BorderSide(color: AppColors.primary, width: 1.5),
          ),
          hintStyle: TextStyle(color: AppColors.mutedForeground),
          labelStyle: TextStyle(color: AppColors.mutedForeground),
        ),
        dividerColor: AppColors.border,
        textTheme: AppTypography.textTheme,
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: AppColors.cardElevated,
          contentTextStyle: TextStyle(color: AppColors.foreground),
          actionTextColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppRadii.r),
            side: BorderSide(color: AppColors.completedBorder),
          ),
          elevation: 0,
        ),
        dialogTheme: const DialogThemeData(
          backgroundColor: AppColors.cardElevated,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(AppRadii.card),
            side: BorderSide(color: AppColors.border),
          ),
          elevation: 0,
        ),
        extensions: const [SemanticColors.defaults],
      );
}
