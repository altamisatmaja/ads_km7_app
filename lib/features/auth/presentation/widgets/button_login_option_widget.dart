part of '../../auth_injection.dart';

class ButtonLoginOptionWidget extends StatelessWidget {
  const ButtonLoginOptionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: loginOptions.map((option) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: TextButton(
            style: ButtonStyle(
              shadowColor: WidgetStateProperty.all<Color>(option['icon'] == null
                  ? Theme.of(context).colorScheme.primary
                  : Colors.transparent),
              elevation: WidgetStateProperty.all<double>(4.0),
              shape: WidgetStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  side: BorderSide(color: ADSColor.borderColor),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              backgroundColor: WidgetStateProperty.all<Color>(
                option['icon'] == null
                    ? ADSColor.buttonPrimary
                    : ADSColor.buttonSecondary,
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()));
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  option['icon'] != null
                      ? Image.asset(option['icon'], width: 24, height: 24)
                      : const SizedBox(),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    option['label'],
                    style: option['icon'] == null
                        ? Theme.of(context)
                            .textTheme
                            .displaySmall
                            ?.copyWith(color: Colors.white)
                        : Theme.of(context).textTheme.displaySmall,
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
