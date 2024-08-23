part of '../../product_injection.dart';

class DetailProductScreen extends StatelessWidget {
  const DetailProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text(''),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sugar Free Gold Low Calories',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Etiam mollis metus non purus',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
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
                  children: const [
                    Text(
                      'Rp 56.000',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Etiam mollis',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.add),
                  label: const Text('Add to cart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Package size',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            const Text(
              'Product Details',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas a, pretium vel tellus. Praesent feugiat diam sit amet pulvinar finibus. Etiam et nisi aliquet, accumsan nisi sit.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Rating and Reviews',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildRatingSection(),
            const SizedBox(height: 16),
            _buildReviewTile(),
            const SizedBox(height: 16),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartScreen()));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue[900],
            padding: const EdgeInsets.symmetric(vertical: 16.0),
          ),
          child: const Text('GO TO CART'),
        ),
      ),
    );
  }

  Widget _buildPackageOption(
      BuildContext context, String price, String size, bool isSelected) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal[50] : Colors.grey[200],
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
                color: isSelected ? Colors.teal : Colors.transparent, width: 2),
          ),
          child: Column(
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                size,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingSection() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              '4.4',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(
              Icons.star,
              color: Colors.amber,
              size: 48,
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '923 Ratings',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'and 257 Reviews',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRatingBar(4, 67),
            _buildRatingBar(3, 20),
            _buildRatingBar(2, 7),
            _buildRatingBar(1, 0),
            _buildRatingBar(0, 2),
          ],
        ),
      ],
    );
  }

  Widget _buildRatingBar(int stars, int percentage) {
    return Expanded(
      child: Row(
        children: [
          Text(
            '$stars',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: LinearProgressIndicator(
              value: percentage / 100,
              color: Colors.teal,
              backgroundColor: Colors.grey[200],
            ),
          ),
          const SizedBox(width: 4),
          Text(
            '$percentage%',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewTile() {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person),
      ),
      title: Row(
        children: [
          const Text('Lorem Hoffman'),
          const Spacer(),
          const Text('05 August 2024'),
        ],
      ),
      subtitle: Column(
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
              const Text('4.2'),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi ut nisi odio. Nulla facilisi. Nunc risus massa, gravida id egestas.',
          ),
        ],
      ),
    );
  }
}
