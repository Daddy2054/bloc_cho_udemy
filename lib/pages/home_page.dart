import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/cubits/weather/weather_cubit.dart';
import 'search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;
  // @override
  // void initState() {
  //   super.initState();
  //   _fetchWeather();
  // }

  // _fetchWeather() {
  //   // WeatherRepository(
  //   //     weatherApiServices: WeatherApiServices(
  //   //   httpClient: http.Client(),
  //   // ))
  //   context.read<WeatherCubit>().fetchWeather(
  //         'london',
  //       );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              _city = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
              print('city: $_city ');
              if (_city != null) {
                context.read<WeatherCubit>().fetchWeather(_city!);
              }
            },
          ),
        ],
      ),
      body: _showWeather(),
    );
  }

  Widget _showWeather() {
    return BlocConsumer<WeatherCubit, WeatherState>(builder: (
      context,
      state,
    ) {
      if (state.status == WeatherStatus.initial) {
        return Center(
          child: Text(
            'Select a city',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      }
      if (state.status == WeatherStatus.loading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (state.status == WeatherStatus.error && state.weather.name =='') {
        return Center(
          child: Text(
            'Select a city',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      }
      return Center(
        child: Text(
          state.weather.name,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      );
      return Container();
    }, listener: (context, state) {
      if (state.status == WeatherStatus.error) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(state.error.errMsg),
            );
          },
        );
      }
    });
  }
}
