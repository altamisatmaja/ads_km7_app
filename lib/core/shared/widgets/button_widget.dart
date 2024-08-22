import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ButtonWidget({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: Theme.of(context).textButtonTheme.style,
        onPressed: onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: Text(title.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: Colors.white)),
        ),
      ),
    );
  }
}
