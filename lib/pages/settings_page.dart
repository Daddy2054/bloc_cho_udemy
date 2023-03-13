import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/blocs/blocs.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        child: ListTile(
          title: Text(
            'Temperature Unit',
          ),
          subtitle: Text(
            'Celsius/Fahrenheit (Default: Celsius)',
          ),
          trailing: Switch(
            value: context.watch<TempSettingsBloc>().state.tempUnit ==
                TempUnit.celsius,
            onChanged: (_) {
              context.read<TempSettingsBloc>().add(ToggleTempUnitEvent());
            },
          ),
        ),
      ),
    );
  }
}
