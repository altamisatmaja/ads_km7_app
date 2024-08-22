part of '../../auth_injection.dart';

Widget otpTextField(
    {required bool first, last, required BuildContext context}) {
  return SizedBox(
    width: 50,
    height: 50,
    child: AspectRatio(
      aspectRatio: 1.0,
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        showCursor: false,
        readOnly: false,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyLarge
            ?.copyWith(color: ADSColor.secondary),
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: const InputDecoration(
          counter: Offstage(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.black12),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.purple),
          ),
        ),
      ),
    ),
  );
}
