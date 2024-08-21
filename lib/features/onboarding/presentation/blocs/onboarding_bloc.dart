part of '../../onboarding_injection.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetOnboardingData getOnboardingData;

  OnboardingBloc(this.getOnboardingData)
      : super(const OnboardingInitialState(0)) {
    on<OnboardingWidgetChangedEvent>((event, emit) {
      emit(OnboardingWidgetState(event.pageIndex));
    });

    on<OnboardingCompletedEvent>((event, emit) {
      emit(OnboardingCompleteState());
    });
  }
}
