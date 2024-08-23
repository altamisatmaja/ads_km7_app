part of '../../category_injection.dart';

class AllProductsWidget extends StatelessWidget {
  const AllProductsWidget({super.key});

  final List<Map<String, dynamic>> allProducts = const [
    {
      "image": "assets/images/accu-check-active-product.png",
      "title": "Accu-check Active Test Strip",
      "price": 112000,
      "rating": 4.2,
      "label": "promote",
      "detail_label": "SALE"
    },
    {
      "image": "assets/images/omron-hem-8712-product.png",
      "title": "Omron HEM-8712 BP Monitor",
      "price": 150000,
      "rating": 4.2,
      "label": "discount",
      "detail_label": "15% OFF"
    },
    {
      "image": "assets/images/accu-check-sugar-product.png",
      "title": "Accu-check Active Test Strip",
      "price": 112000,
      "rating": 4.2,
      "label": null,
      "detail_label": null
    },
    {
      "image": "assets/images/omron-hem-8712-sugar-product.png",
      "title": "Omron HEM-8712 BP Monitor",
      "price": 150000,
      "rating": 4.2,
      "label": null,
      "detail_label": null
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
              Text("All Products",
                  style: Theme.of(context).textTheme.headlineSmall),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 500,
          child: GridView.builder(
            padding: const EdgeInsets.all(16.0),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: allProducts.length,
            itemBuilder: (context, index) {
              final product = allProducts[index];
              return _buildProductItem(
                context,
                image: product['image'],
                title: product['title'],
                price: product['price'].toString(),
                rating: product['rating'].toString(),
                label: product['label'],
                detailLabel: product['detail_label'],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductItem(BuildContext context,
      {required String image,
      required String title,
      required String price,
      required String rating,
      String? label,
      String? detailLabel}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DetailProductScreen()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: ADSColor.borderColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      child: Image.asset(
                        image,
                        height: 75,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 6.0),
                        child: Text('Rp $price',
                            style: Theme.of(context).textTheme.labelLarge),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        decoration: BoxDecoration(
                          color: ADSColor.secondary,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(rating,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall
                                    ?.copyWith(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (label != null)
              Positioned(
                top: -7,
                left: -42,
                child: Transform.rotate(
                  angle: -0.785398,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Container(
                      height: 50,
                      width: 120,
                      padding: const EdgeInsets.only(top: 17.0),
                      decoration: BoxDecoration(
                        color: label == 'promote' ? Colors.red : Colors.orange,
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Center(
                        child: Text(
                          detailLabel!,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
