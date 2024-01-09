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
          centerTitle: true,
          title: Text(" To Day Weather"),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
        ),
        body: Center(
          child: providerw!.weatherModel == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      child: Image.asset("assets/images/weather.jpeg",
                          fit: BoxFit.cover),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                "${providerw!.weatherModel!.name}",
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                  "${providerw!.weatherModel!.mainModel!.temp} K",
                                  style: TextStyle(
                                    fontSize: 30,
                                  )),
                              SizedBox(
                                height: 150,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.12,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all()),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.thermostat),
                                          Text("Temp Min"),
                                          Text(
                                              "${providerw!.weatherModel!.mainModel!.temp_min} "),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.12,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all()),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.thermostat),
                                          Text("Temp Max"),
                                          Text(
                                              "${providerw!.weatherModel!.mainModel!.temp_max} °"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.12,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.24,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all()),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.watch),
                                          Text("TimeZone"),
                                          Text(
                                              "${providerw!.weatherModel!.timezone}"),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.35,
                                width: MediaQuery.sizeOf(context).width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all()),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.12,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.22,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.water_drop_outlined),
                                                Text("Humidity"),
                                                Text(
                                                    "${providerw!.weatherModel!.mainModel!.humidity} %"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.12,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.22,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons
                                                    .thermostat_auto_rounded),
                                                Text("Feel Like"),
                                                Text(
                                                    "${providerw!.weatherModel!.mainModel!.feels_like} °"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.12,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.22,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.air),
                                                Text("N Wind"),
                                                Text(
                                                    "${providerw!.weatherModel!.windModel!.speed} km"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.12,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.22,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons
                                                    .remove_red_eye_outlined),
                                                Text("Visiblity"),
                                                Text(
                                                    "${providerw!.weatherModel!.visibility} m"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.12,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.22,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons.wind_power),
                                                Text("Pressure"),
                                                Text(
                                                    "${providerw!.weatherModel!.mainModel!.pressure} hPa"),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.12,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.22,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all()),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Icon(Icons
                                                    .rotate_90_degrees_ccw_outlined),
                                                Text("Deg"),
                                                Text(
                                                    "${providerw!.weatherModel!.windModel!.deg} °"),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        ),
        drawer: Drawer(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Text(
                "Choos The Location",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 15,
              ),
              TextButton(
                  onPressed: () {
                    providerw!.changeLocation(21.1702, 72.8311);
                    providerr!.getData();
                    Navigator.pop(context);
                  },
                  child: Text("Surat")),
              TextButton(
                  onPressed: () {
                    providerw!.changeLocation(30.7352, 79.0669);
                    providerr!.getData();
                    Navigator.pop(context);
                  },
                  child: Text("KedarNath")),
              TextButton(
                  onPressed: () {
                    providerw!.changeLocation(23.0225,72.5714);
                    providerr!.getData();
                    Navigator.pop(context);
                  },
                  child: Text("Ahemdabad")),
              TextButton(
                  onPressed: () {
                    providerw!.changeLocation(27.0238,74.2179);
                    providerr!.getData();
                    Navigator.pop(context);
                  },
                  child: Text("Rajsthan")),
              TextButton(
                  onPressed: () {
                    providerw!.changeLocation(28.7041,77.1025);
                    providerr!.getData();
                    Navigator.pop(context);
                  },
                  child: Text("Delhi")),
            ],
          ),
        ),
      ),
    );
  }
}
