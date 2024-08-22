part of '../../auth_injection.dart';

Row medhubWelcomeWidget(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Welcome to ',
        style: Theme.of(context).textTheme.displayLarge,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: ADSColor.backgroundIcon,
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Text('MedHub', style: Theme.of(context).textTheme.displayLarge),
      ),
    ],
  );
}
