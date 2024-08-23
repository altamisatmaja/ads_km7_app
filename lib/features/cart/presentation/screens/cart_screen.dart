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
        leading: Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          // ListView with constrained height
          Container(
            height: 150, // Adjust the height as per your requirement
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
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(item['description']),
                            SizedBox(height: 5),
                            Text('Rp ${item['price']}'),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              // Handle quantity decrement
                            },
                          ),
                          Text('${item['quantity']}'),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              // Handle quantity increment
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Payment Summary
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Payment Summary',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                _buildSummaryRow('Order Total', 'Rp 228.800'),
                _buildSummaryRow('Items Discount', '- Rp 28.800'),
                _buildSummaryRow('Coupon Discount', '- Rp 15.800'),
                _buildSummaryRow('Shipping', 'Free'),
                Divider(),
                _buildSummaryRow('Total', 'Rp 185.000', isBold: true),
                SizedBox(height: 20),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CheckoutScreen()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[900],
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text('Place Order @ Rp 185.000'),
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String title, String value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            value,
            style: TextStyle(
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
