part of '../../onboarding_injection.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<OnboardingBloc>();
    final controller = PageController();

    return Stack(
      children: [
        BlocConsumer<OnboardingBloc, OnboardingState>(
          listener: (context, state) {
            if (state is OnboardingCompleteState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
            }
          },
          builder: (context, state) {
            if (state is OnboardingWidgetState) {
              final currentPage = state.currentPage;
              final onboardingData = state.onboardingData;

              WidgetsBinding.instance.addPostFrameCallback((_) {
                controller.jumpToPage(currentPage);
              });

              return PageView.builder(
                controller: controller,
                onPageChanged: (index) {
                  bloc.add(OnboardingWidgetChangedEvent(index));
                },
                itemCount: onboardingData.length,
                itemBuilder: (context, index) {
                  final data = onboardingData[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          data.image,
                          height: 250.0,
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Text(
                            data.title,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          data.description,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: ADSColor.textSecondary),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else if (state is OnboardingLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is OnboardingErrorState) {
              return Center(
                child: Text('Error: ${state.message}'),
              );
            } else {
              return Container();
            }
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: double.infinity,
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WelcomeScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'Skip',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: ADSColor.textSecondary),
                  ),
                ),
                const OnboardingDotWidget(),
                GestureDetector(
                  onTap: () {
                    final currentState = bloc.state;
                    if (currentState is OnboardingWidgetState) {
                      final currentPage = currentState.currentPage;
                      final onboardingData = currentState.onboardingData;

                      if (currentPage < onboardingData.length - 1) {
                        final nextPage = currentState.currentPage + 1;

                        controller.animateToPage(nextPage,
                            duration: const Duration(milliseconds: 3000),
                            curve: Curves.easeInOut);

                        bloc.add(OnboardingWidgetChangedEvent(nextPage));
                      } else {
                        bloc.add(OnboardingCompletedEvent());
                      }
                    }
                  },
                  child: Text(
                    'Next',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(color: ADSColor.textSecondary),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
