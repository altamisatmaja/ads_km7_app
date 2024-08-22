part of '../../fragment_injection.dart';

final List<Map<String, String>> profiles = [
  {"title": "Private Account", "icon": "assets/icons/private-account-icon.png"},
  {"title": "My Consults", "icon": "assets/icons/consults-icon.png"},
  {"title": "My orders", "icon": "assets/icons/orders-icon.png"},
  {"title": "Billing", "icon": "assets/icons/billing-icon.png"},
  {"title": "Faq", "icon": "assets/icons/faq-icon.png"},
  {"title": "Settings", "icon": "assets/icons/settings-icon.png"},
];

class ProfileFragment extends StatelessWidget {
  const ProfileFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile header section
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: const [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/profile_image.png'),
              ),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, Lorem Ipsum',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Welcome to MedHub',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Divider(),
        // Menu list section
        Expanded(
          child: ListView.builder(
            itemCount: profiles.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.asset(
                  profiles[index]["icon"]!,
                  height: 24,
                ),
                title: Text(profiles[index]["title"]!),
                trailing: Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  // Handle the tap event
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
