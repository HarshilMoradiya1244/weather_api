import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_api/screen/home/provider/home_provider.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  HomeProvider? providerr;
  HomeProvider? providerw;
  @override
  void initState() {
    super.initState();
    context.read<HomeProvider>().getData();
  }
  @override
  Widget build(BuildContext context) {
    providerr = context.read<HomeProvider>();
    providerw = context.watch<HomeProvider>();
    return SafeArea(
      child: Scaffold(
      appBar: AppBar(
        title: Text("${providerw!.weatherModel!.name}"),
      ),
      ),
    );
  }
}
