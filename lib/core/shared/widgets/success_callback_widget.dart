part of 'widget.dart';

class SuccessCallbackWidget extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;
  const SuccessCallbackWidget({
    super.key,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 75.0),
                  Image.asset(
                    'assets/images/success.png',
                    height: 250.0,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    description,
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: ADSColor.textSecondary),
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                ButtonWidget(
                  title: 'Continue',
                  onPressed: onPressed,
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
