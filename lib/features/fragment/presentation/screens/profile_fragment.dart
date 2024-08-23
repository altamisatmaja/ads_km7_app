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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ADSColor.backgroundPrimary,
          automaticallyImplyLeading: false,
          title: Text(
            'My Profile',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 35,
                    backgroundImage:
                        AssetImage('assets/icons/detail-profile-icon.png'),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hi, Lorem Ipsum',
                          style: Theme.of(context).textTheme.displaySmall),
                      const SizedBox(height: 4),
                      const Text(
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
            // Menu list section
            Expanded(
              child: ListView.builder(
                itemCount: profiles.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 16),
                        leading: Image.asset(
                          profiles[index]["icon"]!,
                          height: 20,
                        ),
                        title: Text(
                          profiles[index]["title"]!,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {
                          // * TODO : Implement Ontap
                        },
                      ),
                      const Positioned(
                        left: 56,
                        right: 16,
                        bottom: 0,
                        child: Divider(),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
