part of '../../cart_injection.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Sugar free gold',
      'description': 'bottle of 500 pellets',
      'price': 25000,
      'quantity': 1,
      'image': 'assets/images/omron-hem-8712-product.png',
    },
    {
      'name': 'Sugar free gold',
      'description': 'bottle of 500 pellets',
      'price': 18000,
      'quantity': 1,
      'image': 'assets/images/omron-hem-8712-product.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          'Your Cart',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2 Items in your cart',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w300,
                      color: ADSColor.textSecondary),
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
                    Text('Add more',
                        style:
                            Theme.of(context).textTheme.labelMedium?.copyWith(
                                  color: ADSColor.textSecondary,
                                ))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 150,
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        item['image'],
                        height: 60,
                        width: 60,
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(item['description']),
                            const SizedBox(height: 5),
                            Text('Rp ${item['price']}'),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              padding: const EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: ADSColor.primary.withOpacity(0.25),
                                  width: 1.0,
                                ),
                              ),
                              child: Icon(
                                Icons.close_rounded,
                                color: ADSColor.primary.withOpacity(0.25),
                                size: 10,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  // ? TODO: Implement decrement
                                },
                              ),
                              Text('${item['quantity']}'),
                              IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  // ? TODO: Implement increment
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.transparent,
                border: Border.all(
                  color: ADSColor.labelStartColor,
                  width: 1.0,
                ),
              ),
              width: double.infinity,
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.discount_outlined,
                        color: ADSColor.primary,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        '1 Coupon Aplied',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: ADSColor.labelStartColor),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ADSColor.primary.withOpacity(0.25),
                        width: 1.0,
                      ),
                    ),
                    child: Icon(
                      Icons.close_rounded,
                      color: ADSColor.primary.withOpacity(0.25),
                      size: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Payment Summary
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 15),
                _buildSummaryRow('Order Total', 'Rp 228.800', context),
                _buildSummaryRow('Items Discount', '- Rp 28.800', context),
                _buildSummaryRow('Coupon Discount', '- Rp 15.800', context),
                _buildSummaryRow('Shipping', 'Free', context),
                const Divider(),
                _buildSummaryRow('Total', 'Rp 185.000', context, isBold: true),
                const SizedBox(height: 20),
              ],
            ),
          )
        ],
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
                builder: (context) => const CheckoutScreen(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, BuildContext context,
      {isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: isBold == false
                ? Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: ADSColor.textSecondary)
                : Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: ADSColor.textPrimary),
          ),
          Text(value,
              style: isBold == false
                  ? Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(color: ADSColor.primary)
                  : Theme.of(context).textTheme.labelMedium?.copyWith(
                      color: ADSColor.primary, fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
