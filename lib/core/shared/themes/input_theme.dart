part of 'theme.dart';

class ADSInputDecoration {
  final bool isPrimary;

  ADSInputDecoration({
    this.isPrimary = true,
  });

  InputDecorationTheme get theme {
    return InputDecorationTheme(
      fillColor: _resolverFillColor(),
      filled: true,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ADSColor.borderColor),
          borderRadius: BorderRadius.circular(56.0)),
    );
  }

  Color _resolverFillColor() {
    return isPrimary ? ADSColor.buttonPrimary : ADSColor.buttonSecondary;
  }
}
