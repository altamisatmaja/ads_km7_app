import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_model.freezed.dart';
part 'onboarding_model.g.dart';

@freezed
class OnboardingModel with _$OnboardingModel {
  const factory OnboardingModel({
    required String title,
    required String image,
    required String description,
  }) = _OnboardingModel;

  factory OnboardingModel.fromJson(Map<String, dynamic> json) =>
      _$OnboardingModelFromJson(json);
}
