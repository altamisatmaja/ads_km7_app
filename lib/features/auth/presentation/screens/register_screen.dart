part of '../../auth_injection.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
                      'Create your account',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  const BasicTextField(
                    hintText: 'Your Name',
                    suffix: false,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const BasicTextField(
                    hintText: 'Mobile Number',
                    suffix: false,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const BasicTextField(
                    hintText: 'Email',
                    suffix: false,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  const BasicTextField(
                    hintText: 'Password',
                    suffix: true,
                  ),
                  const SizedBox(height: 24.0),
                  ButtonWidget(
                    title: 'Create Account',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OTPScreen(),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 19.0),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.arrow_back_ios_new_rounded,
                            size: 13,
                            color: ADSColor.secondary,
                          ),
                          const SizedBox(width: 5.0),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Already have account? Login",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium
                                  ?.copyWith(color: ADSColor.secondary),
                            ),
                          )
                        ],
                      ),
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
