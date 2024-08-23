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
        surfaceTintColor: ADSColor.backgroundPrimary,
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
          'Checkout',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '2 Items in your cart',
                style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w300, color: ADSColor.textSecondary),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('TOTAL',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: ADSColor.textSecondary,
                          )),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text('Rp 185.000',
                      style: Theme.of(context).textTheme.displaySmall),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Delivery Address',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 20),
          ...addresses.map((address) => Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.transparent,
                  border: Border.all(
                    color: ADSColor.borderColor,
                    width: 1.0,
                  ),
                ),
                child: RadioListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(address['label'],
                          style: Theme.of(context).textTheme.labelLarge),
                      Text(address['phone'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: ADSColor.textSecondary)),
                      Text(address['address'],
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: ADSColor.textSecondary)),
                    ],
                  ),
                  value: address['label'],
                  groupValue: selectedAddress,
                  onChanged: (value) {
                    setState(() {
                      selectedAddress = value.toString();
                    });
                  },
                  secondary: Icon(
                    Icons.mode_edit_outlined,
                    color: ADSColor.textSecondary,
                  ),
                ),
              )),
          const SizedBox(height: 20),
          Text(
            'Payment method',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.transparent,
              border: Border.all(
                color: ADSColor.borderColor,
                width: 1.0,
              ),
            ),
            child: Column(
              children: paymentMethods.map((method) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5.0, horizontal: 5),
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.transparent,
                              border: Border.all(
                                color: ADSColor.borderColor,
                                width: 1.0,
                              ),
                            ),
                            child: Image.asset(method['icon'],
                                height: 30, width: 30)),
                        const SizedBox(width: 10),
                        Text(
                          method['label'],
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 14.0),
                        ),
                      ],
                    ),
                    Radio(
                      value: method['label'],
                      groupValue: selectedPaymentMethod,
                      onChanged: (value) {
                        setState(() {
                          selectedPaymentMethod = value.toString();
                        });
                      },
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: Colors.transparent,
        child: ButtonWidget(
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
      ),
    );
  }
}
