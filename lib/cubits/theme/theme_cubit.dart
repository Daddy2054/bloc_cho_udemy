// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '/constants/constants.dart';

//import '/cubits/weather/weather_cubit.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  //late final StreamSubscription weathersubscription;

  //final WeatherCubit weatherCubit;

  ThemeCubit(
      //   {
      //   required this.weatherCubit,
      // }
      )
      : super(ThemeState.initial())
  // {
  //   weathersubscription = weatherCubit.stream.listen((
  //     WeatherState weatherState,
  //   ) {
  //     print(
  //       'weatherState: $weatherState',
  //     );
  //     if (weatherState.weather.temp > kWarmOrNot) {
  //       emit(state.copyWith(appTheme: AppTheme.light));
  //     } else {
  //       emit(state.copyWith(appTheme: AppTheme.dark));
  //     }
  //   });
  // }
  ;
  // @override
  // Future<void> close() {
  //   weathersubscription.cancel();
  //   return super.close();
  // }

  void setTheme(double currentTemp) {
    print('currentTemp: $currentTemp');
    if (currentTemp > kWarmOrNot) {
      emit(state.copyWith(appTheme: AppTheme.light));
    } else {
      emit(state.copyWith(appTheme: AppTheme.dark));
    }
  }
}
