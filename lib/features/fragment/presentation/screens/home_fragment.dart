part of '../../fragment_injection.dart';
class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  _HomeFragmentState createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  final GlobalKey _headerKey = GlobalKey();
  final GlobalKey _searchBarKey = GlobalKey();

  double _spacing = 0;
  double _positionSearchBar = 0;
  bool _hasCalculated = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_hasCalculated) {
        _calculateSpacing();
        _hasCalculated = true;
      }
    });
  }

  void _calculateSpacing() {
    final RenderBox? headerBox =
        _headerKey.currentContext?.findRenderObject() as RenderBox?;
    final RenderBox? searchBarBox =
        _searchBarKey.currentContext?.findRenderObject() as RenderBox?;

    if (headerBox != null && searchBarBox != null) {
      final double headerHeight = headerBox.size.height;
      final double searchBarHeight = searchBarBox.size.height;

      setState(() {
        _spacing = headerHeight + searchBarHeight;
        _positionSearchBar = headerHeight - (searchBarHeight / 2);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.zero,
        child: Stack(
          children: [
            _buildHeader(_headerKey, context),
            _buildSearchBar(_searchBarKey, _positionSearchBar, context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: _spacing),
                _buildCategories(context),
                const BannerWidget(),
                const HomeDealsOfTheDayWidget(),
                const HomeFeaturedBrandWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
