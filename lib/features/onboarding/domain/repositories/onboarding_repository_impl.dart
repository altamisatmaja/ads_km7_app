part of '../../onboarding_injection.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final List<OnboardingModel> _onboardingData = [
    const OnboardingModel(
        title: 'Welcome1',
        image: 'assets/images/onboarding-one.png',
        description: 'This is the onboarding process1.'),
    const OnboardingModel(
        title: 'Welcome2',
        image: 'assets/images/onboarding-two.png',
        description: 'This is the onboarding process2.'),
  ];

  @override
  List<OnboardingEntity> getOnboardingData() {
    return _onboardingData
        .map((model) => OnboardingEntity(
            title: model.title,
            image: model.image,
            description: model.description))
        .toList();
  }
}
