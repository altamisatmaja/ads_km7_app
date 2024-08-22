// part 'data/models/onboarding_model.dart';
// part 'data/repositories/onboarding_repository_impl.dart';
library onboarding_injection;

import 'package:ads_km7/core/shared/themes/theme.dart';
import 'package:ads_km7/features/auth/auth_injection.dart';
import 'package:ads_km7/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

// *: BLOC
part 'presentation/blocs/onboarding_bloc.dart';
part 'presentation/blocs/onboarding_event.dart';
part 'presentation/blocs/onboarding_state.dart';

// *: DOMAIN REPOSITORY
part 'domain/repositories/onboarding_repository_impl.dart';

// *: DOMAIN USECASE
part 'domain/usecases/get_onboarding_data.dart';

// *: DOMAIN ENTITIES
part 'domain/entities/onboarding_entity.dart';

// *: DATA REPOSITORY
part 'data/repositories/onboarding_repository.dart';

// *: PRESENTATION
part 'presentation/screens/onboarding_screen.dart';

// *: WIDGET
part 'presentation/widgets/dots_widget.dart';
part 'presentation/widgets/container_dots_widget.dart';

final GetIt getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<OnboardingRepository>(
      () => OnboardingRepositoryImpl());

  getIt.registerFactory(() => GetOnboardingData(getIt<OnboardingRepository>()));

  getIt.registerFactory(() => OnboardingBloc(getIt<GetOnboardingData>()));
}
