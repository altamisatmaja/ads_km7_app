part of 'theme.dart';

class ADSThemeData {
  static ThemeData get theme => ThemeData(
      useMaterial3: true,
      inputDecorationTheme: ADSInputDecoration().theme,
      textTheme: ADSTextTheme().theme,
      scaffoldBackgroundColor: ADSColor.backgroundPrimary);
}
