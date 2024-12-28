part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {

}

final class WeatherLoading extends WeatherState {

}
final class WeatherLoaded extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoaded({required this.weatherModel});
}
final class WeatherError extends WeatherState {
  final String message;

  WeatherError(this.message);
}
