part of '../../fragment_injection.dart';

class OrderFragment extends StatelessWidget {
  const OrderFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          'Order Screen',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    ));
  }
}
