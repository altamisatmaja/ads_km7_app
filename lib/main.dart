import 'package:ads_km7/core/shared/themes/theme.dart';
import 'package:ads_km7/features/onboarding/onboarding_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

void main() {
  init();
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
              bloc.add(OnboardingDataLoadedEvent());
              return bloc;
            },
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ADSThemeData.theme,
          home: const Material(
            child: OnboardingScreen(),
          ),
        ));
  }
}
