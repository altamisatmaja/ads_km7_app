part of '../../fragment_injection.dart';

Widget _buildHeader(dynamic headerKey, BuildContext context) {
  return Container(
    key: headerKey,
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/images/bg-header.png'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(40),
        bottomRight: Radius.circular(40),
      ),
    ),
    child: Column(
      children: [
        const SizedBox(height: 50),
        const Row(
          children: [
            CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage('assets/images/user.png'),
                backgroundColor: Colors.transparent),
            SizedBox(width: 16),
            Spacer(),
            Icon(Icons.notifications, color: Colors.white),
            SizedBox(width: 16),
            Icon(Icons.shopping_bag, color: Colors.white),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10.0,
                ),
                Text('Hi, Lorem',
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge
                        ?.copyWith(color: Colors.white)),
                const SizedBox(
                  height: 5.0,
                ),
                Text('Welcome to MedHub',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(color: Colors.white)),
                const SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 25),
      ],
    ),
  );
}
