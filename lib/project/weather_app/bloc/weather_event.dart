part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class GetWeather extends WeatherEvent {
  final String city;

  GetWeather(this.city);
}