import 'package:bloc/bloc.dart';
import 'package:bloc_project/project/weather_app/data/repository/weather_repository.dart';
import 'package:bloc_project/project/weather_app/models/weather_model.dart';
import 'package:meta/meta.dart';

part 'weather_event.dart';

part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<GetWeather>(_getCurrentWeather);
  }

  void _getCurrentWeather(GetWeather event, Emitter<WeatherState> emit) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherLoaded(weatherModel: weather));
    } catch (e) {
      emit(WeatherError(e.toString()));
    }
  }
}
