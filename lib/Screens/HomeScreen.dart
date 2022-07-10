import 'dart:io';

import 'package:bloc_pub/Bloc/CounterBlocProvider.dart';
import 'package:bloc_pub/Bloc/UserBlocProvider.dart';
import 'package:bloc_pub/Const/RouteNames.dart';
import 'package:bloc_pub/Models/UserModel.dart';
import 'package:bloc_pub/Screens/WeatherBlocScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CounterBlocProvider, int>(
          builder: (context, state) {
            return Text('$state');
          },
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(UserRoute,
                    arguments: context.read<UserBlocProvider>());
              },
              icon: Icon(Icons.add)),
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ApiListingRoute,
                );
              },
              icon: Icon(Icons.api_rounded)),

          GestureDetector(
            onTap: () async {
              Navigator.of(context).pushNamed(
                WeatherBlocRoute,
              );
            },
            child: SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: Text("B"),
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                WeatherCubitRoute,
              );
            },
            child: SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: Text("C"),
              ),
            ),
          ),

          // IconButton(
          //     onPressed: () {
          //       Navigator.of(context).pushNamed(
          //         WeatherCubitRoute,
          //       );
          //     },
          //     icon: Icon(Icons.wb_sunny_outlined))
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "fb1",
            mini: true,
            onPressed: () {
              print("Plus");
              context.read<CounterBlocProvider>().increment();
            },
            child: Icon(Icons.plus_one),
          ),
          SizedBox(
            width: 15,
          ),
          FloatingActionButton(
            heroTag: "fb2",
            mini: true,
            onPressed: () {
              print("Minus");
              context.read<CounterBlocProvider>().decrement();
            },
            child: Icon(Icons.exposure_minus_1_sharp),
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: BlocBuilder<UserBlocProvider, List<UserModel>>(
            builder: (context, state) {
              return ListView.separated(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  itemBuilder: (BuildContext context, int i) {
                    UserModel _user = state[i];
                    return Card(
                      color: Colors.blue,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _user.name,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                  color: Colors.white),
                            ),
                            Text("Email : ${_user.emailId}",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                            Text("Age : ${_user.age}",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.white)),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                        height: 10,
                      ),
                  itemCount: state.length);
            },
          ),
        ),
      ),
    );
  }
}
