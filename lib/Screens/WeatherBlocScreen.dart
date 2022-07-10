import 'package:bloc_pub/Bloc/WeatherBloc/weather_bloc.dart';
import 'package:bloc_pub/Models/WeatherModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBlocScreen extends StatelessWidget {
  const WeatherBlocScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherError) {
              print("Error state");

              Scaffold.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, WeatherState state) {
            if (state is WeatherInitial) {
              return buildInitialInput();
            }
            //  else if (state is WeatherLoading) {
            //   return buildColumnWithDataLoading(state.weather);
            //   // return buildLoading();
            // }

            else if (state is WeatherLoaded) {
              print("STATE =>$state");

              return buildColumnWithData((state as WeatherLoaded).weather);
            } else if (state is WeatherError) {
              print("STATE =>$state");

              return buildColumnWithData((state as WeatherError).weather);
            } else {
              // (state is WeatherError)
              return buildInitialInput();
            }
          },
        ),
      ),
    );
  }

  Widget buildInitialInput() {
    return Center(
      child: CityInputField(),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Column buildColumnWithData(WeatherModel? weather) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        if (weather != null)
          Text(
            weather.cityName,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        if (weather != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                // Display the temperature with 1 decimal place
                "${weather.temperatureCelsius.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.ac_unit,
                color: Colors.blue,
              )
            ],
          ),
        CityInputField(),
      ],
    );
  }

  Stack buildColumnWithDataLoading(WeatherModel weather) {
    return Stack(
      children: [
        weather == null
            ? Center(child: CityInputField())
            : buildColumnWithData(weather),
        Positioned(
            child: Container(
          color: Colors.blue.withOpacity(0.05),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ))
      ],
    );
  }
}

class CityInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: TextField(
        onSubmitted: (value) => submitCityName(context, value),
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Enter a city",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  void submitCityName(BuildContext context, String cityName) {
    print("Search action");

    WeatherBloc weatherBloc = context.read<WeatherBloc>();

    weatherBloc.add(GetWeather(cityName));
  }
}
