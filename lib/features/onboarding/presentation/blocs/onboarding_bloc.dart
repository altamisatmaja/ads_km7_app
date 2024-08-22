part of '../../onboarding_injection.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetOnboardingData getOnboardingData;

  OnboardingBloc(this.getOnboardingData)
      : super(const OnboardingInitialState(0)) {
    on<OnboardingDataLoadedEvent>((event, emit) {
      emit(OnboardingLoadingState());
      try {
        final onboardingData = getOnboardingData.call();
        emit(OnboardingWidgetState(onboardingData, 0));
      } catch (e) {
        emit(OnboardingErrorState(e.toString()));
      }
    });

    on<OnboardingWidgetChangedEvent>((event, emit) {
      if (state is OnboardingWidgetState) {
        final currentState = state as OnboardingWidgetState;
        emit(OnboardingWidgetState(
            currentState.onboardingData, event.pageIndex));
      }
    });

    on<OnboardingCompletedEvent>((event, emit) {
      emit(OnboardingCompleteState());
    });

    add(OnboardingDataLoadedEvent());
  }
}
