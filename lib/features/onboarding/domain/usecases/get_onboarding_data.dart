part of '../../onboarding_injection.dart';

class GetOnboardingData {
  final OnboardingRepository repository;

  GetOnboardingData(this.repository);

  List<OnboardingEntity> call() {
    return repository.getOnboardingData();
  }
}
