part of '../../home_injection.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenDataLoaded(selectedIndex: 0)) {
    on<SetHomeScreenState>((event, emit) {
      // Check if the current state is of type HomeScreenDataLoaded
      final currentState = state;
      if (currentState is HomeScreenDataLoaded) {
        emit(event.state ??
            HomeScreenDataLoaded(selectedIndex: currentState.selectedIndex));
      } else {
        emit(event.state ?? HomeScreenDataLoaded(selectedIndex: 0));
      }
    });

    on<SetHomeScreenSelectedIndex>((event, emit) {
      // Emit a new state with the updated index
      emit(HomeScreenDataLoaded(selectedIndex: event.index));
    });
  }
}
