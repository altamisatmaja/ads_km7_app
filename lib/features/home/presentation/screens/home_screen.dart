part of '../../home_injection.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        if (state is HomeScreenDataLoaded) {
          return Scaffold(
            body: [
              const HomeFragment(),
              const NotificationFragment(),
              const OrderFragment(),
              const WishlistFragment(),
              const ProfileFragment(),
            ][state.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: state.selectedIndex,
              onTap: (index) {
                context
                    .read<HomeScreenBloc>()
                    .add(SetHomeScreenSelectedIndex(index: index));
              },
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/home-navbar-icon.png',
                      width: 30.0, height: 30.0),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/notif-navbar-icon.png',
                      width: 30.0, height: 30.0),
                  label: 'Konten',
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_outlined,
                      size: 30.0, color: Color(0xFF4A4B57)),
                  label: 'Tanya Ahli',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/cart-navbar-icon.png',
                      width: 30.0, height: 30.0),
                  label: 'Chat Me',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('assets/icons/profile-navbar-icon.png',
                      width: 30.0, height: 30.0),
                  label: 'Profil',
                ),
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
