part of 'theme.dart';

class ADSColor {
  static Color get buttonPrimary => const Color(0xff0F3759);
  static Color get buttonSecondary => const Color(0xffFFFFFF);

  static Color get textPrimary => const Color(0xff090F47);
  static Color get textSecondary => textPrimary.withOpacity(0.45);
  static Color get textInButton => textPrimary.withOpacity(0.75);

  static Color get primary => const Color(0xff0F3759);
  static Color get secondary => const Color(0xff00A59B);

  static Color get borderColor => textPrimary.withOpacity(0.10);

  static Color get onSaleColor => const Color(0xffFF5A5A);
  static Color get onDiscountColor => const Color(0xffFFC618);
  static Color get labelStartColor => const Color(0xff00A59B);

  static Color get ratingReviewPrimary => const Color(0xffFFC000);
  static Color get ratingReviewSeconday => const Color(0xff00A59B);

  static Color get backgroundPrimary => const Color(0xffF7FBFF);
  static Color get backgroundSecondary => const Color(0xff00A59B);
  static Color get backgroundIcon => const Color(0xffFFA629);
  static Color get backgroundProduct => const Color(0xffF6F6F8);

  static Color get dividerColor => const Color(0xff000000).withOpacity(0.1);
}
