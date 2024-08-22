part of '../../fragment_injection.dart';

final List<Map<String, dynamic>> brands = [
  {
    'icon': 'assets/icons/himalaya-brand-icon.png',
    'title': 'Himalaya Wellness'
  },
  {'icon': 'assets/icons/accu-brand-icon.png', 'title': 'Accu-Chek'},
  {'icon': 'assets/icons/vlcc-brand-icon.png', 'title': 'Vlcc'},
  {'icon': 'assets/icons/protinex-brand-icon.png', 'title': 'Protinex'},
];

class HomeFeaturedBrandWidget extends StatelessWidget {
  const HomeFeaturedBrandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
          child: Text('Featured Brands',
              style: Theme.of(context).textTheme.headlineSmall),
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          height: 135,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 5),
            itemCount: brands.length,
            itemBuilder: (context, index) {
              final brand = brands[index];
              final imagePath = brand['icon'].toString();
              final title = brand['title'] as String;
              return Padding(
                padding:
                    EdgeInsets.only(left: index == 0 ? 20.0 : 0.0, right: 16.0),
                child: _buildBrandItem(imagePath, title, context),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBrandItem(String imagePath, String title, BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          padding: const EdgeInsets.all(20),
          child: Image.asset(
            imagePath,
            width: 40,
            height: 40,
            fit: BoxFit.fitWidth,
          ),
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 80,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 11),
          ),
        ),
      ],
    );
  }
}
