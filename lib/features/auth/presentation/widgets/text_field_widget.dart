part of '../../auth_injection.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final bool suffix;
  final IconData icon;
  final String? suffixTitle;
  final VoidCallback? suffixOnTap;
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.suffix,
      required this.icon,
      this.suffixTitle,
      this.suffixOnTap})
      : assert(suffix == false || suffixTitle != null && suffixOnTap != null,
            'Suffix title dan Suffix Ontap harus diisi!');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(icon, color: ADSColor.primary),
          ),
          suffixIcon: suffix == true
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: suffixOnTap,
                      child: Text(
                        suffixTitle ?? '',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: ADSColor.textSecondary),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
