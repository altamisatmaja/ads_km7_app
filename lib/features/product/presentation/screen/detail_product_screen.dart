part of '../../product_injection.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: ADSColor.backgroundPrimary,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: ADSColor.primary,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: ADSColor.backgroundPrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_checkout_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sugar Free Gold Low Calories',
                style: Theme.of(context).textTheme.displayMedium),
            const SizedBox(height: 4),
            Text('Etiam mollis metus non purus',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: ADSColor.textSecondary)),
            const SizedBox(height: 16),
            Center(
              child: Image.asset(
                'assets/images/omron-hem-8712-product.png',
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rp 56.000',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 18.0)),
                    Text('Etiam mollis',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: ADSColor.textSecondary)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_box_outlined,
                      color: ADSColor.labelStartColor,
                      size: 18.0,
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Text('Add to cart',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ADSColor.labelStartColor,
                                ))
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 10),
            Text('Package size',
                style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildPackageOption(context, 'Rp 252.000', '500 pellets', true),
                _buildPackageOption(
                    context, 'Rp 100.000', '110 pellets', false),
                _buildPackageOption(
                    context, 'Rp 160.000', '300 pellets', false),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Product Details',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
                'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 14.0)),
            const SizedBox(height: 16),
            Text(
              'Rating and Reviews',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            _buildRatingSection(context),
            const SizedBox(height: 16),
            _buildReviewTile(context),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.transparent,
        child: ButtonWidget(
          title: 'Go To Cart',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPackageOption(
      BuildContext context, String price, String size, bool isSelected) {
    return Flexible(
      fit: FlexFit.loose,
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          decoration: BoxDecoration(
            color: isSelected
                ? ADSColor.labelStartColor.withOpacity(0.5)
                : Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
                color:
                    isSelected ? ADSColor.labelStartColor : Colors.transparent,
                width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(price,
                  style: isSelected
                      ? Theme.of(context).textTheme.labelSmall?.copyWith(
                          color: ADSColor.labelStartColor, fontSize: 10)
                      : Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(fontSize: 10)),
              const SizedBox(height: 4),
              Text(size,
                  style: isSelected
                      ? Theme.of(context)
                          .textTheme
                          .labelSmall
                          ?.copyWith(color: ADSColor.labelStartColor)
                      : Theme.of(context).textTheme.labelSmall),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingSection(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * (3 / 9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '4.4',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.star,
                    color: ADSColor.ratingReviewPrimary,
                    size: 26,
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                '923 Ratings and 257 Reviews',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: ADSColor.textSecondary),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: 1.0,
            height: 90.0,
            color: ADSColor.dividerColor,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * (3 / 6.5),
          child: Column(
            children: [
              _buildRatingBar(5, 67, context),
              _buildRatingBar(4, 20, context),
              _buildRatingBar(3, 7, context),
              _buildRatingBar(2, 0, context),
              _buildRatingBar(1, 2, context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRatingBar(int stars, int percentage, BuildContext context) {
    return Row(
      children: [
        Text(
          '$stars',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 4),
        Icon(
          Icons.star,
          color: ADSColor.ratingReviewPrimary,
          size: 16,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: LinearProgressIndicator(
            value: percentage / 100,
            color: Colors.teal,
            backgroundColor: Colors.grey[200],
          ),
        ),
        const SizedBox(width: 8),
        Text('$percentage%',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: ADSColor.textSecondary)),
      ],
    );
  }

  Widget _buildReviewTile(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Text('Lorem Hoffman', style: Theme.of(context).textTheme.labelMedium),
          const Spacer(),
          Text('05 August 2024',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: ADSColor.textSecondary)),
        ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 16,
              ),
              const SizedBox(width: 4),
              Text('4.2',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: ADSColor.textSecondary)),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas.',
          ),
        ],
      ),
    ]);
  }
}
