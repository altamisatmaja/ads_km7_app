part of '../../onboarding_injection.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          final currentPage =
              state is OnboardingWidgetState ? state.currentPage : 0;
          return PageView.builder(
              onPageChanged: (index) {
                context
                    .read<OnboardingBloc>()
                    .add(OnboardingWidgetChangedEvent(index));
              },
              controller: PageController(initialPage: currentPage),
              itemBuilder: (_, index) {
                return Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      Text('Halo!',
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                );
              });
        },
      )),
    );
  }
}
