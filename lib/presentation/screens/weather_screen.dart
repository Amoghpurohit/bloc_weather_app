import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/presentation/widgets/additional_item.dart';
import 'package:weather_app/presentation/widgets/hourly_forcast_item.dart';
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherFetch());
  }

  @override
  Widget build(BuildContext context) {
    String? selectedCity = 'London';
    List<String> cities = [
      'Tokyo',
      'London',
      'Paris',
      'Bangalore',
      'New Delhi',
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(137, 37, 33, 33),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(137, 37, 33, 33),
        title: const Text(
          'Weather App',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              context.read<WeatherBloc>().add(WeatherFetch());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherFailure) {
            //dont forget to return the widget after capturing a state, else it will not consider that state as completed
            return Center(
              child: Text(
                state.errMsg,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            );
          }

          if (state is! WeatherSuccess) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          final data = state.weatherModel;

          final temp = data.list[0].main.temp;
          final humidity = data.list[0].main.humidity;
          final pressure = data.list[0].main.pressure;
          final sky = data.list[0].weather[0].main;
          final windSpeed = data.list[0].wind.speed;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: MediaQuery.of(context).size.width * 0.10),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 58, 55, 55),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$temp K',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      const Icon(
                        Icons.cloud_sharp,
                        color: Colors.white,
                        size: 45,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        sky,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              //const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Text(
                  'Hourly Forecast',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final hourlyForecast = data.list[index + 1];
                    final hourlySky =
                        data.list[index + 1].weather[0].description;
                    final hourlyTemp = hourlyForecast.main.temp.toString();
                    final time =
                        DateTime.parse(hourlyForecast.dtTxt.toString());
                    //final formattedTime = DateFormat('yyyy/MM/dd').format(time);
                    final formattedTime2 = DateFormat.j().format(time);
                    return HourlyForecastItem(
                      time: formattedTime2,
                      temperature: hourlyTemp,
                      icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                          ? Icons.cloud
                          : Icons.sunny,
                    );
                  },
                ),
              ),
              const SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Text(
                  'Additional Information',
                  style: TextStyle(
                    fontSize:
                        Theme.of(context).textTheme.headlineSmall?.fontSize,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdditionalInfoItem(
                    icon: Icons.water_drop,
                    weatherParameter: 'Humidity',
                    value: '$humidity',
                  ),
                  AdditionalInfoItem(
                    icon: Icons.air,
                    weatherParameter: 'WindSpeed',
                    value: '$windSpeed',
                  ),
                  AdditionalInfoItem(
                    icon: Icons.beach_access,
                    weatherParameter: 'Pressure',
                    value: '$pressure',
                  ),
                ],
              ),
              const SizedBox(height: 50,),
              Center(
                child: DropdownButton<String>(
                    value: selectedCity,
                    underline: Container(
                      height: 2,
                      color: Colors.blueAccent,
                    ),
                    //hint: const Text('London',style:  TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white)),
                    dropdownColor: Colors.black,
                    icon: const Icon(Icons.arrow_downward, color: Colors.white,),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.black),
                    items: cities
                        .map<DropdownMenuItem<String>>(
                          (String city) => DropdownMenuItem(
                            value: city,
                            child: Text(city, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white ),),
                          ),
                        )
                        .toList(),
                    onChanged: (String? newValue) {
                      if (newValue == null) {
                        return;
                      }
                      cityName = newValue;
                      selectedCity = newValue;
                      context.read<WeatherBloc>().add(WeatherFetch());    //adding the fetch event when the value in the drop down changes
                    }),
              )
            ],
          );
        },
      ),
    );
  }
}
