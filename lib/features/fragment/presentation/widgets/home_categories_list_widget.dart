part of '../../fragment_injection.dart';

final List<Map<String, dynamic>> categories = [
  {'icon': 'assets/icons/dental-icon.png', 'title': 'Dental'},
  {'icon': 'assets/icons/wellnes-icon.png', 'title': 'Wellness'},
  {'icon': 'assets/icons/homeo-icon.png', 'title': 'Homeo'},
  {'icon': 'assets/icons/eye-care-icon.png', 'title': 'Eye care'},
  {'icon': 'assets/icons/skin-and-hair-icon.png', 'title': 'Skin & Hair'},
];

final List<List<Color>> gradients = [
  [Colors.red, Colors.orange],
  [Colors.green, Colors.teal],
  [Colors.blue, Colors.purple],
  [Colors.pink, Colors.purple],
  [Colors.yellow, Colors.red],
];

Widget _buildCategories(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 15),
        child: Text('Top Categories',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      const SizedBox(height: 5.0),
      SizedBox(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const SizedBox(width: 5),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            final imagePath = category['icon'].toString();
            final title = category['title'] as String;
            final gradientColors = gradients[index % gradients.length];
            return Padding(
              padding:
                  EdgeInsets.only(left: index == 0 ? 20.0 : 0.0, right: 16.0),
              child:
                  _buildCategoryItem(imagePath, title, gradientColors, context),
            );
          },
        ),
      ),
    ],
  );
}

Widget _buildCategoryItem(String imagePath, String title,
    List<Color> gradientColors, BuildContext context) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(50)),
        ),
        padding: const EdgeInsets.all(20),
        child: Image.asset(
          imagePath,
          width: 16,
          height: 16,
          fit: BoxFit.cover,
        ),
      ),
      const SizedBox(height: 5),
      Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 11),
      ),
    ],
  );
}
