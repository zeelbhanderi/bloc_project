import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../bloc/weather_bloc.dart';
import '../../data/data_provider/weather_data_provider.dart';
import '../../data/repository/weather_repository.dart';
import '../widgets/additional_info_item.dart';
import '../widgets/hourly_forecast_item.dart';
import 'package:http/http.dart' as http;

import '../../secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();

  Widget builder() {
    return RepositoryProvider(
        create: (context) => WeatherRepository(WeatherDataProvider()),
        child: BlocProvider(
            create: (context) => WeatherBloc(context.read<WeatherRepository>()),
            child: const WeatherScreen()));
  }
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(GetWeather('New Delhi'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<WeatherBloc>().add(GetWeather('New Delhi'));
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitial) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is WeatherError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is! WeatherLoaded) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }


          final data = state.weatherModel;

          final currentTemp = data.currentTemp;
          final currentSky = data.currentSky;
          final currentPressure = data.currentPressure;
          final currentWindSpeed = data.currentWindSpeed;
          final currentHumidity = data.currentHumidity;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // main card
                SizedBox(
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 10,
                          sigmaY: 10,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Text(
                                '$currentTemp K',
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Icon(
                                currentSky == 'Clouds' || currentSky == 'Rain'
                                    ? Icons.cloud
                                    : Icons.sunny,
                                size: 64,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                currentSky,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hourly Forecast',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                // SizedBox(
                //   height: 120,
                //   child: ListView.builder(
                //     itemCount: 5,
                //     scrollDirection: Axis.horizontal,
                //     itemBuilder: (context, index) {
                //       final hourlyForecast = data['list'][index + 1];
                //       final hourlySky =
                //           data['list'][index + 1]['weather'][0]['main'];
                //       final hourlyTemp =
                //           hourlyForecast['main']['temp'].toString();
                //       final time = DateTime.parse(hourlyForecast['dt_txt']);
                //       return HourlyForecastItem(
                //         time: DateFormat.j().format(time),
                //         temperature: hourlyTemp,
                //         icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                //             ? Icons.cloud
                //             : Icons.sunny,
                //       );
                //     },
                //   ),
                // ),

                const SizedBox(height: 20),
                const Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AdditionalInfoItem(
                      icon: Icons.water_drop,
                      label: 'Humidity',
                      value: currentHumidity.toString(),
                    ),
                    AdditionalInfoItem(
                      icon: Icons.air,
                      label: 'Wind Speed',
                      value: currentWindSpeed.toString(),
                    ),
                    AdditionalInfoItem(
                      icon: Icons.beach_access,
                      label: 'Pressure',
                      value: currentPressure.toString(),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
