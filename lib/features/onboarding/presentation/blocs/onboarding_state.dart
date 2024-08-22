part of '../../onboarding_injection.dart';

abstract class OnboardingState extends Equatable {
  const OnboardingState();

  @override
  List<Object?> get props => [];
}

class OnboardingInitialState extends OnboardingState {
  final int currentPage;

  const OnboardingInitialState(this.currentPage);

  @override
  List<Object?> get props => [currentPage];
}

class OnboardingWidgetState extends OnboardingState {
  final List<OnboardingEntity> onboardingData;
  final int currentPage;

  const OnboardingWidgetState(this.onboardingData, this.currentPage);

  @override
  List<Object?> get props => [currentPage, onboardingData];
}

class OnboardingErrorState extends OnboardingState {
  final String message;

  const OnboardingErrorState(this.message);

  @override
  List<Object?> get props => [message];
}

class OnboardingLoadingState extends OnboardingState {}

class OnboardingCompleteState extends OnboardingState {}
