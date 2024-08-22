part of '../../auth_injection.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/welcome.png'),
              const SizedBox(
                height: 34,
              ),
              medhubWelcomeWidget(context),
              const SizedBox(
                height: 16,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Text(
                    'Do you want some help with your health to get better life?',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: ADSColor.textSecondary,
                        )),
              ),
              const SizedBox(
                height: 34,
              ),
              const ButtonLoginOptionWidget(),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                width: double.infinity,
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Text(
                      'LOGIN',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(color: ADSColor.textSecondary),
                    )),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
