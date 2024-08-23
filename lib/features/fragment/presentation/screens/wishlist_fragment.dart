part of '../../fragment_injection.dart';

class WishlistFragment extends StatelessWidget {
  const WishlistFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          'Wishlist Screen',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
    ));
  }
}
