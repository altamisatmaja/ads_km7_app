import 'package:ads_km7/core/shared/themes/theme.dart';
import 'package:ads_km7/features/home/home_injection.dart' as home_injection;
import 'package:ads_km7/features/onboarding/onboarding_injection.dart'
    as onboarding_injection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ads_km7/features/home/home_injection.dart';
import 'package:ads_km7/features/onboarding/onboarding_injection.dart';

void main() {
  home_injection.init();
  onboarding_injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OnboardingBloc>(
          create: (context) {
            final bloc = GetIt.instance<OnboardingBloc>();
            bloc.add(
                OnboardingDataLoadedEvent()); // Ensure this event is defined
            return bloc;
          },
        ),
        BlocProvider<HomeScreenBloc>(
          create: (context) {
            final bloc = GetIt.instance<HomeScreenBloc>();
            bloc.add(SetHomeScreenState());
            return bloc;
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ADSThemeData.theme,
        home:
            const OnboardingScreen(), // Ensure OnboardingScreen is a valid widget
      ),
    );
  }
}
