import 'package:ads_km7/core/shared/themes/theme.dart';
import 'package:ads_km7/features/onboarding/onboarding_injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: const [
        // TODO: Implement blocs
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ADSThemeData().theme,
        home: const OnboardingScreen(),
      ),
    );
  }
}
