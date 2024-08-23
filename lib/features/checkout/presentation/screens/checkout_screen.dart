part of '../../checkout_injection.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String selectedAddress = 'Home';
  String selectedPaymentMethod = 'OVO';

  final List<Map<String, dynamic>> addresses = [
    {
      'label': 'Home',
      'phone': '(031) 555-024',
      'address': 'Jl. Rajawali No. 02, Surabaya',
    },
    {
      'label': 'Office',
      'phone': '(031) 555-024',
      'address': 'Jl. Gajah Mada No. 05, Sidoarjo',
    },
  ];

  final List<Map<String, dynamic>> paymentMethods = [
    {'label': 'OVO', 'icon': 'assets/icons/ovo-icon.png'},
    {'label': 'Dana', 'icon': 'assets/icons/dana-icon.png'},
    {'label': 'ShopeePay', 'icon': 'assets/icons/shopeepay-icon.png'},
    {'label': 'GoPay', 'icon': 'assets/icons/gopay-icon.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        leading: Icon(Icons.arrow_back),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            '2 Items in your cart',
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(height: 10),
          Text(
            'TOTAL',
            style: TextStyle(color: Colors.grey),
            textAlign: TextAlign.end,
          ),
          Text(
            'Rp 185.000',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.end,
          ),
          SizedBox(height: 20),
          Text(
            'Delivery Address',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ...addresses.map((address) => RadioListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address['label'],
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(address['phone']),
                    Text(address['address']),
                  ],
                ),
                value: address['label'],
                groupValue: selectedAddress,
                onChanged: (value) {
                  setState(() {
                    selectedAddress = value.toString();
                  });
                },
                secondary: Icon(Icons.edit),
              )),
          TextButton.icon(
            onPressed: () {
              // Add address logic here
            },
            icon: Icon(Icons.add),
            label: Text('Add Address'),
          ),
          SizedBox(height: 20),
          Text(
            'Payment method',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ...paymentMethods.map((method) => RadioListTile(
                title: Row(
                  children: [
                    Image.asset(method['icon'], height: 30, width: 30),
                    SizedBox(width: 10),
                    Text(method['label']),
                  ],
                ),
                value: method['label'],
                groupValue: selectedPaymentMethod,
                onChanged: (value) {
                  setState(() {
                    selectedPaymentMethod = value.toString();
                  });
                },
              )),
        ],
      ),
      bottomNavigationBar: ButtonWidget(
        title: 'Pay Now Rp 185.000',
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SuccessCallbackWidget(
                      title: 'Thank you',
                      description:
                          'Your Order will be delivered with invoice #INV20240817. You can track the delivery in the order section.',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      })));
        },
      ),
    );
  }
}
