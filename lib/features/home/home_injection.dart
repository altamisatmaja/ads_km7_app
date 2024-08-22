library home;

import 'package:ads_km7/core/shared/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'presentation/widgets/navigation_bar_widget.dart';
part 'presentation/screens/home_screen.dart';

part 'presentation/blocs/home_bloc.dart';
part 'presentation/blocs/home_event.dart';
part 'presentation/blocs/home_state.dart';

final GetIt getIt = GetIt.instance;

void init() {
  getIt.registerFactory(() => HomeScreenBloc());
}
