part of '../../onboarding_injection.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final List<OnboardingModel> _onboardingData = [
    const OnboardingModel(
        title: 'View and buy\nMedicine online',
        image: 'assets/images/onboarding-one.png',
        description:
            'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.'),
    const OnboardingModel(
        title: 'Online medical &\nHealthcare',
        image: 'assets/images/onboarding-two-fixed.png',
        description:
            'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.'),
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
