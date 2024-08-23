part of '../../fragment_injection.dart';

class NotificationFragment extends StatelessWidget {
  const NotificationFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          'Notifikasi Screen',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    ));
  }
}
