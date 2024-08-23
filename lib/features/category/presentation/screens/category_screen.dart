part of '../../category_injection.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: ADSColor.backgroundPrimary,
        title: Text(
          'Diabetes Care',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: BannerWidget(),
          ),
          SliverToBoxAdapter(
            child: DiabeticDietWidget(),
          ),
          SliverToBoxAdapter(
            child: AllProductsWidget(),
          ),
        ],
      ),
    ));
  }
}
