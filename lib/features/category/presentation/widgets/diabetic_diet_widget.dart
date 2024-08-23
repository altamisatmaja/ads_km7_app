part of '../../category_injection.dart';

class DiabeticDietWidget extends StatelessWidget {
  const DiabeticDietWidget({super.key});

  final List<Map<String, String>> products = const [
    {
      "image": "assets/images/sugar-product.png",
      "title": "Sugar Substitute",
    },
    {
      "image": "assets/images/juices-product.png",
      "title": "Juices & Vinegars",
    },
    {
      "image": "assets/images/vitamins-product.png",
      "title": "Vitamins Medicines",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Diabetic Diet",
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 240,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemBuilder: (context, index) {
              final isFirst = index == 0;
              final isLast = index == products.length - 1;
              return Padding(
                padding: EdgeInsets.only(
                  left: isFirst ? 20.0 : 0.0,
                  right: isLast ? 20.0 : 0.0,
                ),
                child: _buildDealItem(
                  context,
                  image: products[index]["image"]!,
                  title: products[index]["title"]!,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildDealItem(BuildContext context,
      {required String image, required String title}) {
    return Column(
      children: [
        Container(
          width: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: ADSColor.borderColor,
                blurRadius: 4.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ADSColor.backgroundProduct,
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  child: Image.asset(
                    image,
                    height: 135,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 95,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 10.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
