part of '../../onboarding_injection.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();

  @override
  List<Object?> get props => [];
}

class OnboardingWidgetChangedEvent extends OnboardingEvent {
  final int pageIndex;

  const OnboardingWidgetChangedEvent(this.pageIndex);

  @override
  List<Object?> get props => [pageIndex];
}

class OnboardingCompletedEvent extends OnboardingEvent {}

class OnboardingDataLoadedEvent extends OnboardingEvent {}
