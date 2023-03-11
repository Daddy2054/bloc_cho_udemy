import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '/cubits/weather/weather_cubit.dart';
import '/repositories/weather_repository.dart';
import '/services/weather_api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      ),
      body: Center(
        child: Text('Home'),
      ),
    );
  }
}
