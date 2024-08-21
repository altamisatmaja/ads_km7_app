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
  final int currentPage;

  const OnboardingWidgetState(this.currentPage);

  @override
  List<Object?> get props => [currentPage];
}

class OnboardingCompleteState extends OnboardingState {}
