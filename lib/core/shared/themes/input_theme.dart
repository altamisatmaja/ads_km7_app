part of 'theme.dart';

class ADSInputDecoration {
  ADSInputDecoration();

  InputDecorationTheme get theme {
    return InputDecorationTheme(
      filled: false,
      labelStyle: TextStyle(color: ADSColor.textSecondary),
      hintStyle: TextStyle(color: ADSColor.textSecondary),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: ADSColor
                .borderColor), // Set border color when the field is enabled
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
            color: ADSColor
                .borderColor), // Set border color when the field is focused
      ),
    );
  }
}
