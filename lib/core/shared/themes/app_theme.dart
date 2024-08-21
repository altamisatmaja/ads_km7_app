part of 'theme.dart';

class ADSThemeData {
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        inputDecorationTheme: ADSInputDecoration().theme,
        textTheme: ADSTextTheme().theme,
      );
}
