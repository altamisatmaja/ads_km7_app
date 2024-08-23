part of '../../category_injection.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        surfaceTintColor: ADSColor.backgroundPrimary,
        backgroundColor: ADSColor.backgroundPrimary,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: ADSColor.primary,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
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
