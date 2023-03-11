import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:open_weather_cubit/pages/search_page.dart';
import '/cubits/weather/weather_cubit.dart';
import '/repositories/weather_repository.dart';
import '/services/weather_api_services.dart';

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
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
