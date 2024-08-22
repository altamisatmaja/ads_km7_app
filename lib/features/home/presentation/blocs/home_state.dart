part of '../../home_injection.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenDataLoaded extends HomeScreenState {
  HomeScreenDataLoaded({required this.selectedIndex});

  final int selectedIndex;
}
