part of '../../auth_injection.dart';

class BasicTextField extends StatefulWidget {
  final String hintText;
  final bool suffix;
  final String? suffixTitle;
  final VoidCallback? suffixOnTap;

  const BasicTextField({
    super.key,
    required this.hintText,
    required this.suffix,
    this.suffixTitle,
    this.suffixOnTap,
  });

  @override
  // ignore: library_private_types_in_public_api
  _BasicTextFieldState createState() => _BasicTextFieldState();
}

class _BasicTextFieldState extends State<BasicTextField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        obscureText: widget.suffix ? _obscureText : false,
        decoration: InputDecoration(
          labelText: widget.hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          suffixIcon: widget.suffix
              ? IconButton(
                  icon: Icon(
                    _obscureText
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                  onPressed: _toggleVisibility,
                )
              : null,
        ),
      ),
    );
  }
}
