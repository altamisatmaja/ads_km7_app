part of '../../auth_injection.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Enter the verify code',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'We just send you a verification code via phone +62 821 39 488 953',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: ADSColor.textSecondary),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(4, (index) {
                          return Row(
                            children: [
                              otpTextField(
                                  context: context,
                                  first: index == 0,
                                  last: index == 3),
                              if (index < 3) const SizedBox(width: 10.0),
                            ],
                          );
                        }),
                      )),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const SizedBox(height: 29.0),
                  ButtonWidget(
                    title: 'Submit code',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SuccessCallbackWidget(
                                  title: 'Phone Number Verified',
                                  description:
                                      'Congradulations, your phone number has been verified. You can start using the app',
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const HomeScreen()));
                                  })));
                    },
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'The verify code will expire in 00:59',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: ADSColor.textSecondary),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Resend Code',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium
                          ?.copyWith(color: ADSColor.secondary),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
