part of 'theme.dart';

class ADSThemeData {
  static ThemeData get theme => ThemeData(
      useMaterial3: true,
      inputDecorationTheme: ADSInputDecoration().theme,
      textTheme: ADSTextTheme().theme,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        // textStyle: WidgetStateProperty.all<TextStyle>(
        //   TextStyle(color: Colors.white),
        // ),
        backgroundColor: WidgetStateProperty.all<Color>(ADSColor.buttonPrimary),
      )),
      scaffoldBackgroundColor: ADSColor.backgroundPrimary);
}
