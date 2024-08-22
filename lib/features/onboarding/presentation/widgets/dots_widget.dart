part of '../../onboarding_injection.dart';

class OnboardingDotWidget extends StatelessWidget {
  const OnboardingDotWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) {
        if (state is OnboardingWidgetState) {
          final currentPage = state.currentPage;
          final itemCount = state.onboardingData.length;

          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                itemCount, (index) => dotWidget(index, currentPage, context)),
          );
        }
        return const Text('Not loading');
      },
    );
  }
}
